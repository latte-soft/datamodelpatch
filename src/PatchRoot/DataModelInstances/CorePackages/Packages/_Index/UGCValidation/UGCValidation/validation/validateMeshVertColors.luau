local l_UGCValidationService_0 = game:GetService("UGCValidationService");
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.flags.getFFlagUseUGCValidationContext);
local v3 = require(l_Parent_0.flags.getEngineFeatureUGCValidateEditableMeshAndImage);
local _ = require(l_Parent_0.util.Types);
local v5 = require(l_Parent_0.util.pcallDeferred);
local v6 = require(l_Parent_0.flags.getFFlagUGCValidationShouldYield);
local v7 = require(l_Parent_0.Analytics);
local function v19(v8, v9, v10)
    local l_isServer_0 = v10.isServer;
    local v12 = nil;
    local v13 = nil;
    if not v3() or not v6() then
        local l_status_0, l_result_0 = pcall(function()
            return l_UGCValidationService_0:ValidateMeshVertColors(v8.contentId, v9);
        end);
        v12 = l_status_0;
        v13 = l_result_0;
    else
        local v16, v17 = v5(function()
            return l_UGCValidationService_0:ValidateEditableMeshVertColors(v8.editableMesh, v9);
        end, v10);
        v12 = v16;
        v13 = v17;
    end;
    if v12 then
        if v13 then
            return true;
        else
            v7.reportFailure(v7.ErrorType.validateMeshVertexColors_NonNeutralVertexColors);
            return false, {
                string.format("Invalid vertex color found in mesh model '%s'. You need to edit the color map to be all white %s and try again.", v8.fullName, not v9 and "" or "with no transarency")
            };
        end;
    else
        v7.reportFailure(v7.ErrorType.validateMeshVertexColors_FailedToLoadMesh);
        local v18 = string.format("Failed to load vertex color map for model mesh %s. Make sure it exists and try again.", v8.fullName);
        if not (not (l_isServer_0 ~= nil) or not l_isServer_0) then
            error(v18);
        end;
        return false, {
            v18
        };
    end;
end;
local function v25(v20, v21, v22)
    local l_status_1, l_result_1 = pcall(function()
        return l_UGCValidationService_0:ValidateMeshVertColors(v20, v21);
    end);
    if l_status_1 then
        if l_result_1 then
            return true;
        else
            v7.reportFailure(v7.ErrorType.validateMeshVertexColors_NonNeutralVertexColors);
            return false, {
                (("Your mesh (%*) has non-neutral vertex color values, which violates UGC upload requirements."):format(v20))
            };
        end;
    else
        v7.reportFailure(v7.ErrorType.validateMeshVertexColors_FailedToLoadMesh);
        if not (not (v22 ~= nil) or not v22) then
            error("Failed to execute validateMeshVertexColors check");
        end;
        return false, {
            "Failed to execute validateMeshVertexColors check"
        };
    end;
end;
if not v2() then
    return v25;
else
    return v19;
end;
