local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v2 = require(l_Parent_0.util.pcallDeferred);
local v3 = require(l_Parent_0.flags.getFFlagUGCValidationShouldYield);
local v4 = require(l_Parent_0.Analytics);
local v5 = require(l_Parent_0.flags.getFFlagUseUGCValidationContext);
local v6 = require(l_Parent_0.flags.getEngineFeatureEngineUGCValidateMeshTriangleArea);
local v7 = require(l_Parent_0.flags.getEngineFeatureUGCValidateEditableMeshAndImage);
local l_UGCValidationService_0 = game:GetService("UGCValidationService");
local function v18(v9, v10)
    local v11 = if not v10 then nil else v10.isServer;
    if v6() then
        local v12 = nil;
        local v13 = nil;
        if not v7() or not v3() then
            local l_status_0, l_result_0 = pcall(function()
                return l_UGCValidationService_0:validateMeshTriangleArea(v9.contentId);
            end);
            v12 = l_status_0;
            v13 = l_result_0;
        else
            local v16, v17 = v2(function()
                return l_UGCValidationService_0:ValidateEditableMeshTriangleArea(v9.editableMesh);
            end, v10);
            v12 = v16;
            v13 = v17;
        end;
        if v12 then
            if not v13 then
                v4.reportFailure(v4.ErrorType.validateMeshTriangleArea_NoArea);
                return false, {
                    string.format("Detected zero-area triangle in model mesh %s. You need to edit the mesh to remove zero-area triangles.", v9.fullName)
                };
            end;
        else
            v4.reportFailure(v4.ErrorType.validateMeshTriangleArea_FailedToLoadMesh);
            if v11 then
                error(string.format("Failed to load model mesh %s. Make sure mesh exists and try again.", v9.fullName));
            end;
            return false, {
                string.format("Failed to load model mesh %s. Make sure mesh exists and try again.", v9.fullName)
            };
        end;
    end;
    return true;
end;
local function v25(v19, v20, v21)
    local v22 = v19[v20];
    if v6() then
        local l_status_1, l_result_1 = pcall(function()
            return l_UGCValidationService_0:validateMeshTriangleArea(v22);
        end);
        if l_status_1 then
            if not l_result_1 then
                v4.reportFailure(v4.ErrorType.validateMeshTriangleArea_NoArea);
                return false, {
                    string.format("%s.%s ( %s ) contained an invalid triangle which contained no area in 3D space", v19:GetFullName(), v20, v22)
                };
            end;
        else
            v4.reportFailure(v4.ErrorType.validateMeshTriangleArea_FailedToLoadMesh);
            if v21 then
                error("Failed to load mesh data");
            end;
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
