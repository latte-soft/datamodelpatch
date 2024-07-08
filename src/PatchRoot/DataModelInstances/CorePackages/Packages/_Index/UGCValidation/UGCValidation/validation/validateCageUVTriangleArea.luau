local l_UGCValidationService_0 = game:GetService("UGCValidationService");
local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v3 = require(l_Parent_0.util.pcallDeferred);
local v4 = require(l_Parent_0.flags.getFFlagUGCValidationShouldYield);
local v5 = require(l_Parent_0.flags.getFFlagUseUGCValidationContext);
local v6 = require(l_Parent_0.flags.getEngineFeatureEngineUGCValidateCageUVTriangleArea);
local v7 = require(l_Parent_0.flags.getEngineFeatureUGCValidateEditableMeshAndImage);
local v8 = require(l_Parent_0.Analytics);
local function v18(v9, v10)
    local l_isServer_0 = v10.isServer;
    if v6() then
        local v12 = nil;
        local v13 = nil;
        if not v7() or not v4() then
            local l_status_0, l_result_0 = pcall(function()
                return l_UGCValidationService_0:ValidateCageUVTriangleArea(v9.contentId);
            end);
            v12 = l_status_0;
            v13 = l_result_0;
        else
            local v16, v17 = v3(function()
                return l_UGCValidationService_0:ValidateEditableMeshCageUVTriangleArea(v9.editableMesh);
            end, v10);
            v12 = v16;
            v13 = v17;
        end;
        if v12 then
            if not v13 then
                v8.reportFailure(v8.ErrorType.validateCageUVTriangleArea_ZeroAreaTriangle);
                return false, {
                    string.format("Detected zero-area triangle in UV map of '%s'. You need to edit the UV map to fix this issue.", v9.fullName)
                };
            end;
        else
            if l_isServer_0 then
                error(string.format("Failed to load UVs for '%s'. Make sure the model has a valid UV map and try again.", v9.fullName));
            end;
            v8.reportFailure(v8.ErrorType.validateCageUVTriangleArea_FailedToLoadMesh);
            return false, {
                string.format("Failed to load UVs for '%s'. Make sure the model has a valid UV map and try again.", v9.fullName)
            };
        end;
    end;
    return true;
end;
local function v25(v19, v20, v21)
    local v22 = v19[v20];
    if v6() then
        local l_status_1, l_result_1 = pcall(function()
            return l_UGCValidationService_0:ValidateCageUVTriangleArea(v22);
        end);
        if l_status_1 then
            if not l_result_1 then
                v8.reportFailure(v8.ErrorType.validateCageUVTriangleArea_ZeroAreaTriangle);
                return false, {
                    string.format("%s.%s ( %s ) contained an invalid triangle which contained no area", v19:GetFullName(), v20, v22)
                };
            end;
        else
            if v21 then
                error("Failed to load mesh data");
            end;
            v8.reportFailure(v8.ErrorType.validateCageUVTriangleArea_FailedToLoadMesh);
            return false, {
                "Failed to load mesh data"
            };
        end;
    end;
    return true;
end;
if not v5() then
    return v25;
else
    return v18;
end;
