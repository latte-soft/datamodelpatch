local l_UGCValidationService_0 = game:GetService("UGCValidationService");
local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v3 = require(l_Parent_0.util.pcallDeferred);
local v4 = require(l_Parent_0.flags.getFFlagUGCValidationShouldYield);
local v5 = require(l_Parent_0.Analytics);
local v6 = require(l_Parent_0.Constants);
local v7 = require(l_Parent_0.flags.getFFlagUGCLCQualityReplaceLua);
local v8 = require(l_Parent_0.flags.getFFlagUseUGCValidationContext);
local v9 = require(l_Parent_0.flags.getFFlagUGCValidateBodyPartsExtendedMeshTests);
local v10 = require(l_Parent_0.flags.getEngineFeatureUGCValidateEditableMeshAndImage);
local function v27(v11, v12, v13)
    local l_isServer_0 = v13.isServer;
    if not v7() or not v9() then
        local v15 = nil;
        local v16 = nil;
        if not v10() or not v4() then
            local l_status_0, l_result_0 = pcall(function()
                return l_UGCValidationService_0:GetMeshTriCount(v11.contentId);
            end);
            v15 = l_status_0;
            v16 = l_result_0;
        else
            local v19, v20 = v3(function()
                return l_UGCValidationService_0:GetEditableMeshTriCount(v11.editableMesh);
            end, v13);
            v15 = v19;
            v16 = v20;
        end;
        if not (v12 ~= nil) then
            v12 = v6.MAX_HAT_TRIANGLES;
        end;
        if v15 then
            if v12 < v16 then
                v5.reportFailure(v5.ErrorType.validateMeshTriangles_TooManyTriangles);
                return false, {
                    string.format("Model mesh %s resolution of %d is higher than max support value of %d. You need to retopologize your model and try again.", v11.fullName, v16, v12)
                };
            end;
        else
            v5.reportFailure(v5.ErrorType.validateMeshTriangles_FailedToLoadMesh);
            if not (not (l_isServer_0 ~= nil) or not l_isServer_0) then
                error(string.format("Failed to load model mesh %s. Make sure the mesh exists and try again.", v11.fullName));
            end;
            return false, {
                string.format("Failed to load model mesh %s. Make sure the mesh exists and try again.", v11.fullName)
            };
        end;
    else
        local v21 = nil;
        local v22 = nil;
        if not v10() or not v4() then
            local l_status_1, l_result_1 = pcall(function()
                return l_UGCValidationService_0:ValidateMeshTriangles(v11.contentId);
            end);
            v21 = l_status_1;
            v22 = l_result_1;
        else
            local v25, v26 = v3(function()
                return l_UGCValidationService_0:ValidateEditableMeshTriangles(v11.editableMesh);
            end, v13);
            v21 = v25;
            v22 = v26;
        end;
        if v21 then
            if not v22 then
                v5.reportFailure(v5.ErrorType.validateMeshTriangles_TooManyTriangles);
                return false, {
                    "Your mesh exceeds the max triangle limit for UGC upload requirements."
                };
            end;
        else
            v5.reportFailure(v5.ErrorType.validateMeshTriangles_FailedToExecute);
            if not (not (l_isServer_0 ~= nil) or not l_isServer_0) then
                error("Failed to execute validateMeshTriangles check");
            end;
            return false, {
                "Failed to execute validateMeshTriangles check"
            };
        end;
    end;
    return true;
end;
local function v35(v28, v29, v30)
    if not v7() or not v9() then
        local l_status_2, l_result_2 = pcall(function()
            return l_UGCValidationService_0:GetMeshTriCount(v28);
        end);
        if not (v29 ~= nil) then
            v29 = v6.MAX_HAT_TRIANGLES;
        end;
        if l_status_2 then
            if v29 < l_result_2 then
                v5.reportFailure(v5.ErrorType.validateMeshTriangles_TooManyTriangles);
                return false, {
                    string.format("Mesh has %d triangles, but the limit is %d", l_result_2, v29)
                };
            end;
        else
            v5.reportFailure(v5.ErrorType.validateMeshTriangles_FailedToLoadMesh);
            if not (not (v30 ~= nil) or not v30) then
                error("Failed to load mesh data");
            end;
            return false, {
                "Failed to load mesh data"
            };
        end;
    else
        local l_status_3, l_result_3 = pcall(function()
            return l_UGCValidationService_0:ValidateMeshTriangles(v28);
        end);
        if l_status_3 then
            if not l_result_3 then
                v5.reportFailure(v5.ErrorType.validateMeshTriangles_TooManyTriangles);
                return false, {
                    "Your mesh exceeds the max triangle limit for UGC upload requirements."
                };
            end;
        else
            v5.reportFailure(v5.ErrorType.validateMeshTriangles_FailedToExecute);
            if not (not (v30 ~= nil) or not v30) then
                error("Failed to execute validateMeshTriangles check");
            end;
            return false, {
                "Failed to execute validateMeshTriangles check"
            };
        end;
    end;
    return true;
end;
if not v8() then
    return v35;
else
    return v27;
end;
