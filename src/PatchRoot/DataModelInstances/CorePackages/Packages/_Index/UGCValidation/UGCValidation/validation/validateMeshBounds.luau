local l_UGCValidationService_0 = game:GetService("UGCValidationService");
local v1 = game:DefineFastFlag("TruncateMeshBoundsErrorMessage", false);
local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v4 = require(l_Parent_0.util.pcallDeferred);
local v5 = require(l_Parent_0.flags.getFFlagUGCValidationShouldYield);
local v6 = require(l_Parent_0.flags.getFFlagUGCLCQualityReplaceLua);
local v7 = require(l_Parent_0.flags.getFFlagUseUGCValidationContext);
local v8 = require(l_Parent_0.flags.getEngineFeatureUGCValidateEditableMeshAndImage);
local v9 = require(l_Parent_0.Analytics);
local v10 = Vector3.new(0, 0, 0);
local function v16(v11, v12, v13)
    local v14 = v12:PointToObjectSpace(v11);
    local v15 = false;
    if -v13.X / 2 <= v14.X then
        v15 = false;
        if v14.X <= v13.X / 2 then
            v15 = false;
            if -v13.Y / 2 <= v14.Y then
                v15 = false;
                if v14.Y <= v13.Y / 2 then
                    v15 = false;
                    if -v13.Z / 2 <= v14.Z then
                        v15 = v14.Z <= v13.Z / 2;
                    end;
                end;
            end;
        end;
    end;
    return v15;
end;
local function _(v17)
    return math.floor(v17 * 100) / 100;
end;
local function v22(v19, v20, v21)
    return {
        string.format("%s has size larger than max allowed bounding size. The max size for type %s is [%.2f, %.2f, %.2f]", v19, v20, math.floor(v21.X * 100) / 100, math.floor(v21.Y * 100) / 100, math.floor(v21.Z * 100) / 100)
    };
end;
local function v26(v23, v24, v25)
    if not v1 then
        return {
            "Mesh is too large", 
            string.format("Max size for type %s is [%.2f, %.2f, %.2f] from %s", v23, v24.X, v24.Y, v24.Z, v25.Name), 
            "Use SpecialMesh.Scale if using SpecialMeshes"
        };
    else
        return {
            "Mesh is too large", 
            string.format("Max size for type %s is [%.2f, %.2f, %.2f] from %s", v23, math.floor(v24.X * 100) / 100, math.floor(v24.Y * 100) / 100, math.floor(v24.Z * 100) / 100, v25.Name), 
            "Use SpecialMesh.Scale if using SpecialMeshes"
        };
    end;
end;
local function v52(v27, v28, v29, v30, v31, v32, v33)
    local l_isServer_0 = v33.isServer;
    local l_size_0 = v31.size;
    local v36 = v31.offset or v10;
    local v37 = (v27.CFrame * v28.CFrame) * CFrame.new(v36);
    if not v6() then
        local v38 = nil;
        local v39 = nil;
        if not v8() then
            local l_status_0, l_result_0 = pcall(function()
                return l_UGCValidationService_0:GetMeshVerts(v29.contentId);
            end);
            v38 = l_status_0;
            v39 = l_result_0;
        else
            local l_status_1, l_result_1 = pcall(function()
                return l_UGCValidationService_0:GetEditableMeshVerts(v29.editableMesh);
            end);
            v38 = l_status_1;
            v39 = l_result_1;
        end;
        if v38 then
            for _, v45 in pairs(v39) do
                if not v16(v27.CFrame:PointToWorldSpace(v45 * v30), v37, l_size_0) then
                    v9.reportFailure(v9.ErrorType.validateMeshBounds_TooLarge);
                    return false, (v22(v29.context, v32, l_size_0));
                end;
            end;
        else
            v9.reportFailure(v9.ErrorType.validateMeshBounds_FailedToLoadMesh);
            if not (not (l_isServer_0 ~= nil) or not l_isServer_0) then
                error(string.format("Failed to load body part mesh %s. Make sure body part exists and try again.", v29.fullName));
            end;
            return false, {
                string.format("Failed to load body part mesh %s. Make sure body part exists and try again.", v29.fullName)
            };
        end;
    else
        local v46 = nil;
        local v47 = nil;
        if not v8() or not v5() then
            local l_status_2, l_result_2 = pcall(function()
                return l_UGCValidationService_0:ValidateMeshBounds(v29.contentId, v30, v36, v28.CFrame, v27.CFrame);
            end);
            v46 = l_status_2;
            v47 = l_result_2;
        else
            local v50, v51 = v4(function()
                return l_UGCValidationService_0:ValidateEditableMeshBounds(v29.editableMesh, v30, v36, v28.CFrame, v27.CFrame);
            end, v33);
            v46 = v50;
            v47 = v51;
        end;
        if v46 then
            if not v47 then
                v9.reportFailure(v9.ErrorType.validateMeshBounds_TooLarge);
                return false, (v22(v29.context, v32, l_size_0));
            end;
        else
            if not (not (l_isServer_0 ~= nil) or not l_isServer_0) then
                error("Failed to execute validateMeshBounds check");
            end;
            v9.reportFailure(v9.ErrorType.validateMeshBounds_FailedToExecute);
            return false, {
                "Failed to execute validateMeshBounds check"
            };
        end;
    end;
    return true;
end;
local function v69(v53, v54, v55, v56, v57, v58, v59)
    local l_size_1 = v57.size;
    local v61 = v57.offset or v10;
    local v62 = (v53.CFrame * v54.CFrame) * CFrame.new(v61);
    if not v6() then
        local l_status_3, l_result_3 = pcall(function()
            return l_UGCValidationService_0:GetMeshVerts(v55);
        end);
        if l_status_3 then
            for _, v66 in pairs(l_result_3) do
                if not v16(v53.CFrame:PointToWorldSpace(v66 * v56), v62, l_size_1) then
                    v9.reportFailure(v9.ErrorType.validateMeshBounds_TooLarge);
                    return false, (v26(v58, l_size_1, v54));
                end;
            end;
        else
            v9.reportFailure(v9.ErrorType.validateMeshBounds_FailedToLoadMesh);
            if not (not (v59 ~= nil) or not v59) then
                error("Failed to read mesh");
            end;
            return false, {
                "Failed to read mesh"
            };
        end;
    else
        local l_status_4, l_result_4 = pcall(function()
            return l_UGCValidationService_0:ValidateMeshBounds(v55, v56, v61, v54.CFrame, v53.CFrame);
        end);
        if l_status_4 then
            if not l_result_4 then
                v9.reportFailure(v9.ErrorType.validateMeshBounds_TooLarge);
                return false, (v26(v58, l_size_1, v54));
            end;
        else
            if not (not (v59 ~= nil) or not v59) then
                error("Failed to execute validateMeshBounds check");
            end;
            v9.reportFailure(v9.ErrorType.validateMeshBounds_FailedToExecute);
            return false, {
                "Failed to execute validateMeshBounds check"
            };
        end;
    end;
    return true;
end;
if not v7() then
    return v69;
else
    return v52;
end;
