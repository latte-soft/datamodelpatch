local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Analytics);
local v2 = require(l_Parent_0.Constants);
local v3 = require(l_Parent_0.util.getAssetCreationDetails);
local v4 = require(l_Parent_0.util.ParseContentIds);
local _ = require(l_Parent_0.util.Types);
local v6 = require(l_Parent_0.flags.getFFlagUGCBetterModerationErrorText);
local v7 = require(l_Parent_0.flags.getFFlagUseUGCValidationContext);
local function v17(v8, v9, v10)
    if not v8 or #v8 == 0 then
        return true;
    else
        local v11 = {};
        for _, v13 in ipairs(v8) do
            v11[tonumber(v13.id)] = true;
        end;
        for _, v15 in ipairs(v9) do
            if not v11[tonumber(v15.creatorTargetId)] then
                local v16 = v10[tostring(v15.assetId)];
                assert(v16);
                if not v7() then
                    return false, {
                        string.format("%s.%s ( %s ) is not owned by the developer", v16.instance:GetFullName(), v16.fieldName, (tostring(v15.assetId)))
                    };
                else
                    return false, {
                        string.format("Failed to validate current user owns %s.%s ( %s ). Make sure you own the assets being validated and try again.", v16.instance:GetFullName(), v16.fieldName, (tostring(v15.assetId)))
                    };
                end;
            end;
        end;
        return true;
    end;
end;
return function(v18, v19)
    local v20 = {};
    local v21 = {};
    local v22, v23 = v4.parseWithErrorCheck(v21, v20, v18);
    if v22 then
        local v24 = {};
        local v25, v26 = v3(v21);
        if not v25 or #v26 ~= #v21 then
            v1.reportFailure(v1.ErrorType.validateModeration_CouldNotFetchModerationDetails);
            if not v7() then
                if not v6() then
                    return false, {
                        "Could not fetch details for assets"
                    };
                else
                    return false, {
                        "Could not fetch moderation details for assets.", 
                        "Make sure all assets are created by the current user."
                    };
                end;
            else
                return false, {
                    string.format("Failed to fetch moderation results for %s. Make sure all assets are owned by the current user.", v18:GetFullName())
                };
            end;
        else
            local v27, v28 = v17(v19, v26, v20);
            if v27 then
                for _, v30 in pairs(v26) do
                    if not (v30.status ~= v2.ASSET_STATUS.UNKNOWN and v30.status ~= v2.ASSET_STATUS.REVIEW_PENDING) or v30.status == v2.ASSET_STATUS.MODERATED then
                        table.insert(v24, v30.assetId);
                    end;
                end;
                if #v24 > 0 then
                    local v31 = {};
                    for v32, v33 in pairs(v24) do
                        local v34 = v20[v33];
                        if not v34 then
                            v31[v32] = v33;
                        else
                            v31[v32] = string.format("%s.%s ( %s )", v34.instance:GetFullName(), v34.fieldName, v33);
                        end;
                    end;
                    v1.reportFailure(v1.ErrorType.validateModeration_AssetsHaveNotPassedModeration);
                    if not v7() then
                        return false, {
                            "The following asset IDs have not passed moderation:", 
                            unpack(v31)
                        };
                    else
                        return false, {
                            "Asset(s) failed to pass moderation:", 
                            unpack(v31)
                        };
                    end;
                else
                    return true;
                end;
            else
                v1.reportFailure(v1.ErrorType.validateModeration_ValidateUser);
                return v27, v28;
            end;
        end;
    else
        v1.reportFailure(v1.ErrorType.validateModeration_FailedToParse);
        return false, v23;
    end;
end;
