local l_UGCValidationService_0 = game:GetService("UGCValidationService");
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.flags.getFFlagUseUGCValidationContext);
local v3 = require(l_Parent_0.flags.getEngineFeatureEngineUGCValidateBodyParts);
local v4 = require(l_Parent_0.flags.getFFlagUGCValidateMoveDynamicHeadTest);
local v5 = require(l_Parent_0.flags.getFFlagUGCValidateDynamicHeadMoodClient);
local v6 = require(l_Parent_0.flags.getFFlagUGCValidateDynamicHeadMoodRCC);
local v7 = require(l_Parent_0.Analytics);
local v8 = require(l_Parent_0.validation.validateSingleInstance);
local v9 = require(l_Parent_0.validation.validateMeshPartBodyPart);
local v10 = require(l_Parent_0.validation.validateDynamicHeadData);
local v11 = require(l_Parent_0.validation.validateDynamicHeadMood);
local _ = require(l_Parent_0.util.Types);
local v13 = require(l_Parent_0.util.createDynamicHeadMeshPartSchema);
local function v18(v14, v15)
    if v4() then
        assert(false, "Should never get here");
    end;
    if v3() then
        local l_status_0, l_result_0 = pcall(function()
            return l_UGCValidationService_0:ValidateDynamicHeadMesh(v14.MeshId);
        end);
        if l_status_0 then
            if l_result_0 then
                return true;
            else
                v7.reportFailure(v7.ErrorType.validateDynamicHeadMeshPartFormat_ValidateDynamicHeadMesh);
                return false, {
                    (("%*.MeshId (%*) is not correctly set-up to be a dynamic head mesh as it has no FACS information"):format(v14.Name, v14.MeshId))
                };
            end;
        else
            if v15 then
                error("Failed to retrieve mesh data to validate dynamic head");
            end;
            v7.reportFailure(v7.ErrorType.validateDynamicHeadMeshPartFormat_FailedToLoadMesh);
            return false, {
                "Failed to retrieve mesh data to validate dynamic head"
            };
        end;
    else
        return true;
    end;
end;
local function v28(v19)
    assert(v19.instances ~= nil, "instances required in validationContext for validateDynamicHeadMeshPartFormat");
    local l_instances_0 = v19.instances;
    local l_isServer_0 = v19.isServer;
    local v22 = not not v19.bypassFlags and v19.bypassFlags.skipSnapshot;
    local v23, v24 = v8(l_instances_0, v19);
    if v23 then
        local v25 = l_instances_0[1];
        local v26, v27 = v9(v25, v13(v19), v19);
        v23 = v26;
        v24 = v27;
        if v23 then
            if not (not (l_isServer_0 and v6()) and (l_isServer_0 or not v5()) or v22) then
                v26, v27 = v11(v25, if l_isServer_0 ~= nil then l_isServer_0 else false);
                v23 = v26;
                v24 = v27;
                if not v23 then
                    return false, v24;
                end;
            end;
            if not v4() then
                return v18(v25, l_isServer_0);
            else
                return v10(v25, v19);
            end;
        else
            return false, v24;
        end;
    else
        return v23, v24;
    end;
end;
local function v39(v29, v30, v31, v32, v33)
    local v34, v35 = v8(v29);
    if v34 then
        local v36 = v29[1];
        local v37, v38 = v9(v36, v13(), Enum.AssetType.DynamicHead, v30, v31, v32, v33);
        v34 = v37;
        v35 = v38;
        if v34 then
            if not (not (v30 and v6()) and (v30 or not v5())) then
                v37, v38 = v11(v36, if v30 ~= nil then v30 else false);
                v34 = v37;
                v35 = v38;
                if not v34 then
                    return false, v35;
                end;
            end;
            if not v4() then
                return v18(v36, v30);
            else
                return v10(v36, v30);
            end;
        else
            return false, v35;
        end;
    else
        return v34, v35;
    end;
end;
if not v2() then
    return v39;
else
    return v28;
end;
