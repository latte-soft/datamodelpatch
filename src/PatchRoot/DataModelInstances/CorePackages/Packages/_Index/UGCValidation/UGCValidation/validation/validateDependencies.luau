local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.flags.getFFlagUseUGCValidationContext);
local v2 = require(l_Parent_0.flags.getFFlagDebugUGCDisableRCCOwnershipCheck);
local v3 = require(l_Parent_0.flags.getFFlagUGCValidateBodyPartsModeration);
local v4 = require(l_Parent_0.flags.getFFlagUGCValidateAssetStatusNameChange);
local v5 = require(l_Parent_0.flags.getFFlagUGCValidationAnalytics);
local v6 = game:DefineFastFlag("ValidateUserAndUniverseNoModeration", false);
local v7 = require(l_Parent_0.Analytics);
local v8 = require(l_Parent_0.Constants);
local v9 = require(l_Parent_0.util.ParseContentIds);
local v10 = require(l_Parent_0.util.FailureReasonsAccumulator);
local v11 = require(l_Parent_0.util.getAssetCreationDetailsRCC);
local _ = require(l_Parent_0.util.Types);
local v13 = require(l_Parent_0.validation.validateModeration);
local v14 = require(l_Parent_0.validation.validateCanLoad);
local v15 = require(l_Parent_0.validation.validateAssetCreator);
local function v19(v16)
    for _, v18 in pairs(v16) do
        if not v14(v18.instance[v18.fieldName]) then
            error(string.format("Failed to load children assets (Meshes, Textures, etc.) for '%s'. Make sure the assets exist and try again.", v18.instance.Name));
        end;
    end;
end;
local v20 = nil;
local v21 = nil;
if not v4() then
    v21 = {
        MODERATION_STATE_REVIEWING = "MODERATION_STATE_REVIEWING", 
        MODERATION_STATE_REJECTED = "MODERATION_STATE_REJECTED", 
        MODERATION_STATE_APPROVED = "MODERATION_STATE_APPROVED"
    };
else
    v20 = {
        MODERATION_STATE_REVIEWING = {
            MODERATION_STATE_REVIEWING = true, 
            Reviewing = true
        }, 
        MODERATION_STATE_APPROVED = {
            MODERATION_STATE_APPROVED = true, 
            Approved = true
        }
    };
end;
local function v27(v22, v23, v24, v25, v26)
    if v22[tonumber(v23)] then
        return true;
    else
        v7.reportFailure(v7.ErrorType.validateDependencies_IsRestrictedUserId);
        if not v1() then
            return false, {
                (("%*.%* ( %* ) is not owned by the developer"):format(v24:GetFullName(), v25, v26))
            };
        else
            return false, {
                (("%*.%* ( %* ) is not owned by the current user. You can only validate assets that you or a group you belong to owns."):format(v24:GetFullName(), v25, v26))
            };
        end;
    end;
end;
local function v32(v28, v29, v30, v31)
    if if not v4() then v21.MODERATION_STATE_REVIEWING == v28 else v20.MODERATION_STATE_REVIEWING[v28] then
        v7.reportFailure(v7.ErrorType.validateDependencies_IsReviewing);
        if not v1() then
            error("Asset is under review");
        else
            error("Failed to load asset {instance:GetFullName()}.{fieldName} ( {id} ) that is still going through the review process. Please, wait for a notification of completion from the review process and try again.");
        end;
    end;
    if if not v4() then v21.MODERATION_STATE_APPROVED == v28 else v20.MODERATION_STATE_APPROVED[v28] then
        return true;
    else
        v7.reportFailure(v7.ErrorType.validateDependencies_IsNotApproved);
        if not v1() then
            return false, {
                (("%*.%* ( %* ) is not owned by the developer"):format(v29:GetFullName(), v30, v31))
            };
        else
            return false, {
                (("%*.%* ( %* ) is not owned by the current user. You can only validate assets that you or a group you belong to owns."):format(v29:GetFullName(), v30, v31))
            };
        end;
    end;
end;
local function v46(v33, v34)
    if not v33 or #v33 == 0 then
        return true;
    else
        local v35 = {};
        for _, v37 in ipairs(v33) do
            v35[tonumber(v37.id)] = true;
        end;
        local v38 = v10.new();
        for v39, v40 in pairs(v34) do
            local v41, v42 = v11(v39);
            if not v41 then
                error("Failed to load asset");
            end;
            local l_creator_0 = v42.creationContext.creator;
            local v44 = if not l_creator_0.userId then l_creator_0.groupId else l_creator_0.userId;
            if not v5() then
                local v45 = string.format("%s.%s ( %s ) is not owned by the developer", v40.instance:GetFullName(), v40.fieldName, v39);
                v38:updateReasons(v35[tonumber(v44)], {
                    v45
                });
                if if not v4() then v21.MODERATION_STATE_REVIEWING == v42.moderationResult.moderationState else v20.MODERATION_STATE_REVIEWING[v42.moderationResult.moderationState] then
                    error("Asset is under review");
                end;
                v38:updateReasons(if not v4() then v21.MODERATION_STATE_APPROVED == v42.moderationResult.moderationState else v20.MODERATION_STATE_APPROVED[v42.moderationResult.moderationState], {
                    v45
                });
            else
                v38:updateReasons(v27(v35, v44, v40.instance, v40.fieldName, v39));
                v38:updateReasons(v32(v42.moderationResult.moderationState, v40.instance, v40.fieldName, v39));
            end;
        end;
        return v38:getFinalResults();
    end;
end;
local function v49(v47, v48)
    assert(v48.isServer, "isServer must be true for validateAssetCreatorsRCC");
    return v15(v47, v48);
end;
local function v53(v50, v51, v52)
    return v15(v51, true, v50 or {}, "", v52);
end;
return if not v1() then function(v54, v55, v56, v57, v58)
    local v59 = {};
    local v60, v61 = v9.parseWithErrorCheck({}, v59, v54, nil, v8.CONTENT_ID_REQUIRED_FIELDS);
    if v60 then
        if v55 then
            v19(v59);
        end;
        local v62 = v10.new();
        if not (v2() or not v55) then
            if not v6 or not v58 then
                v62:updateReasons(v46(v57, v59));
            else
                v62:updateReasons(v53(v57, v59, v58));
            end;
        end;
        if not v3() then
            local v63 = not v55;
            if v56 then
                v63 = false;
            end;
            if v63 then
                v62:updateReasons(v13(v54, v57));
            end;
        end;
        return v62:getFinalResults();
    else
        v7.reportFailure(v7.ErrorType.validateDependencies_ParseFailure);
        return false, v61;
    end;
end else function(v64, v65)
    local v66 = if not v65 then nil else v65.isServer;
    local v67 = if not v65 then nil else v65.allowUnreviewedAssets;
    local v68 = if not v65 then nil else v65.restrictedUserIds;
    local v69 = if not v65 then nil else v65.universeId;
    local v70 = {};
    local v71, v72 = v9.parseWithErrorCheck({}, v70, v64, nil, v8.CONTENT_ID_REQUIRED_FIELDS);
    if v71 then
        if v66 then
            v19(v70);
        end;
        local v73 = v10.new();
        if not (v2() or not v66) then
            if not v6 or not v69 then
                v73:updateReasons(v46(v68, v70));
            else
                v73:updateReasons(v49(v70, v65));
            end;
        end;
        if not v3() then
            local v74 = not v66;
            if v67 then
                v74 = false;
            end;
            if v74 then
                v73:updateReasons(v13(v64, v68));
            end;
        end;
        return v73:getFinalResults();
    else
        v7.reportFailure(v7.ErrorType.validateDependencies_ParseFailure);
        return false, v72;
    end;
end;
