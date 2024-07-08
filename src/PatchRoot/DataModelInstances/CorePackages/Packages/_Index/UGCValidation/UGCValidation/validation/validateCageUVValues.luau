local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v2 = require(l_Parent_0.util.pcallDeferred);
local v3 = require(l_Parent_0.flags.getFFlagUGCValidationShouldYield);
local v4 = require(l_Parent_0.WrapTargetCageUVReferenceValues);
local v5 = require(l_Parent_0.flags.getFFlagUseUGCValidationContext);
local v6 = require(l_Parent_0.flags.getEngineFeatureEngineUGCValidateBodyParts);
local v7 = require(l_Parent_0.flags.getEngineFeatureEngineUGCValidateUVValuesInReference);
local v8 = require(l_Parent_0.flags.getEngineFeatureUGCValidateEditableMeshAndImage);
local v9 = require(l_Parent_0.Analytics);
local l_UGCValidationService_0 = game:GetService("UGCValidationService");
local function v23(v11, v12, v13)
    local l_isServer_0 = v13.isServer;
    if v6() then
        if v7() then
            local v15 = assert(v4[v12.Parent.Name], "WrapTarget is not parented to a MeshPart");
            local v16 = nil;
            local v17 = nil;
            if not v8() or not v3() then
                local l_status_0, l_result_0 = pcall(function()
                    return l_UGCValidationService_0:ValidateUVValuesInReference(v15, v11.contentId);
                end);
                v16 = l_status_0;
                v17 = l_result_0;
            else
                local v20, v21 = v2(function()
                    return l_UGCValidationService_0:ValidateEditableMeshUVValuesInReference(v15, v11.editableMesh);
                end, v13);
                v16 = v20;
                v17 = v21;
            end;
            if v16 then
                if v17 then
                    return true;
                else
                    v9.reportFailure(v9.ErrorType.validateCageUVValues_UnexpectedUVValue);
                    return false, {
                        string.format("Found invalid UV value outside [0, 1] range for '%s'. You need to edit the UV map to fix this issue.", v12:GetFullName())
                    };
                end;
            else
                v9.reportFailure(v9.ErrorType.validateCageUVValues_FailedToLoadMesh);
                local v22 = string.format("Failed to load UVs for '%s'. Make sure the UV map exists and try again.", v12:GetFullName());
                if l_isServer_0 then
                    error(v22);
                end;
                return false, {
                    v22
                };
            end;
        else
            return true;
        end;
    else
        return true;
    end;
end;
local function v32(v24, v25, v26, v27)
    if v6() then
        if v7() then
            local v28 = assert(v4[v25.Parent.Name], "WrapTarget is not parented to a MeshPart");
            local l_status_1, l_result_1 = pcall(function()
                return l_UGCValidationService_0:ValidateUVValuesInReference(v28, v24);
            end);
            if l_status_1 then
                if l_result_1 then
                    return true;
                else
                    v9.reportFailure(v9.ErrorType.validateCageUVValues_UnexpectedUVValue);
                    return false, {
                        string.format("%s.%s ( %s ) has a UV value that is unexpected", v25:GetFullName(), v26, v24)
                    };
                end;
            else
                v9.reportFailure(v9.ErrorType.validateCageUVValues_FailedToLoadMesh);
                local v31 = string.format("Failed to read mesh %s.%s ( %s )", v25:GetFullName(), v26, v24);
                if v27 then
                    error(v31);
                end;
                return false, {
                    v31
                };
            end;
        else
            return true;
        end;
    else
        return true;
    end;
end;
if not v5() then
    return v32;
else
    return v23;
end;
