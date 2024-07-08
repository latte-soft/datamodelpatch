local l_UGCValidationService_0 = game:GetService("UGCValidationService");
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.Analytics);
local v3 = require(l_Parent_0.Constants);
local _ = require(l_Parent_0.util.Types);
local v5 = require(l_Parent_0.util.pcallDeferred);
local v6 = require(l_Parent_0.flags.getFFlagUGCValidationShouldYield);
local v7 = require(l_Parent_0.validation.validateOverlappingVertices);
local v8 = require(l_Parent_0.validation.validateCageUVs);
local v9 = require(l_Parent_0.validation.validateFullBodyCageDeletion);
local v10 = require(l_Parent_0.validation.validateMeshVertColors);
local v11 = require(l_Parent_0.validation.validateCageUVTriangleArea);
local v12 = require(l_Parent_0.validation.validateMeshTriangleArea);
local v13 = require(l_Parent_0.validation.validateCageUVValues);
local v14 = require(l_Parent_0.util.FailureReasonsAccumulator);
local v15 = require(l_Parent_0.util.ParseContentIds);
local v16 = require(l_Parent_0.util.getMeshMinMax);
local v17 = require(l_Parent_0.util.getEditableMeshFromContext);
local v18 = require(l_Parent_0.flags.getFFlagUseUGCValidationContext);
local v19 = require(l_Parent_0.flags.getFFlagUGCValidateBodyPartsExtendedMeshTests);
local v20 = require(l_Parent_0.flags.getEngineFeatureEngineUGCValidateBodyParts);
local v21 = require(l_Parent_0.flags.getFFlagUGCValidateCageUVTriangleArea);
local v22 = require(l_Parent_0.flags.getFFlagUGCValidateMeshTriangleAreaForCages);
local v23 = require(l_Parent_0.flags.getFFlagUGCValidateMeshTriangleAreaForMeshes);
local v24 = require(l_Parent_0.flags.getFFlagUGCValidateUVValuesInReference);
local v25 = require(l_Parent_0.flags.getEngineFeatureUGCValidateEditableMeshAndImage);
local function v31(v26, v27)
    if v26.HasSkinnedMesh then
        if v20() then
            local l_status_0, l_result_0 = pcall(function()
                return l_UGCValidationService_0:ValidateSkinnedMesh(v26.MeshId);
            end);
            if l_status_0 then
                if l_result_0 then
                    return true;
                else
                    local v30 = ("Detected mismatch between model and skinned data for %*. You need to re-skin your model to fix this issue."):format(v26.Name);
                    if v27 then
                        error(v30);
                    end;
                    v2.reportFailure(v2.ErrorType.validateDescendantMeshMetrics_HasSkinnedMeshMismatch);
                    return false, {
                        v30
                    };
                end;
            else
                if v27 then
                    error("Failed to retrieve mesh data to validate skinned mesh");
                end;
                v2.reportFailure(v2.ErrorType.validateDescendantMeshMetrics_FailedToLoadMesh);
                return false, {
                    "Failed to retrieve mesh data to validate skinned mesh"
                };
            end;
        else
            return true;
        end;
    else
        v2.reportFailure(v2.ErrorType.validateDescendantMeshMetrics_NoSkinningInfo);
        return false, {
            (("Missing skinning data for %*.MeshId. You need to skin your model."):format(v26.Name))
        };
    end;
end;
local function v51(v32, v33, v34)
    local l_isServer_0 = v34.isServer;
    local v36 = assert(v3.ASSET_RENDER_MESH_MAX_TRIANGLES[v33.Name]);
    local v48, v49, v50 = (function()
        local v37 = 0;
        for _, v39 in v32, nil, nil do
            if v39.instance.ClassName == "MeshPart" then
                assert(v39.fieldName == "MeshId");
                local v40 = nil;
                local v41 = nil;
                if not v25() or not v6() then
                    local l_status_1, l_result_1 = pcall(function()
                        return l_UGCValidationService_0:GetMeshTriCount(v39.instance[v39.fieldName]);
                    end);
                    v40 = l_status_1;
                    v41 = l_result_1;
                else
                    local v44, v45 = v17(v39.instance, v39.fieldName, v34);
                    if v44 then
                        local v46, v47 = v5(function()
                            return l_UGCValidationService_0:GetEditableMeshTriCount(v45);
                        end, v34);
                        v40 = v46;
                        v41 = v47;
                    else
                        v2.reportFailure(v2.ErrorType.validateDescendantMeshMetrics_FailedToLoadMesh);
                        return false, string.format("Failed to load mesh for '%s'. Make sure mesh exists and try again.", v39.instance.Name);
                    end;
                end;
                if v40 then
                    v37 = v37 + v41;
                else
                    return false, string.format("Failed to execute check for triangle face information for mesh '%s'. Make sure mesh exists and try again.", v39.instance.Name);
                end;
            end;
        end;
        return true, nil, v37;
    end)();
    if v48 then
        if v36 < v50 then
            v2.reportFailure(v2.ErrorType.validateDescendantMeshMetrics_TooManyTriangles);
            return false, {
                string.format("Mesh resolution of '%d' for '%s' is higher than max supported number of triangles '%d'. You need to retopologize your model to reduce the triangle count.", v50, v33.Name, v36)
            };
        else
            return true;
        end;
    else
        if l_isServer_0 then
            error(v49);
        end;
        v2.reportFailure(v2.ErrorType.validateDescendantMeshMetrics_FailedToCalculateTriangles);
        return false, {
            v49
        };
    end;
end;
local function v64(v52, v53, v54)
    local v55 = assert(v3.ASSET_RENDER_MESH_MAX_TRIANGLES[v53.Name]);
    local v61, v62, v63 = (function()
        local v56 = 0;
        for _, v58 in v52, nil, nil do
            if v58.instance.ClassName == "MeshPart" then
                assert(v58.fieldName == "MeshId");
                local l_status_2, l_result_2 = pcall(function()
                    return l_UGCValidationService_0:GetMeshTriCount(v58.instance[v58.fieldName]);
                end);
                if l_status_2 then
                    v56 = v56 + l_result_2;
                else
                    v2.reportFailure(v2.ErrorType.validateDescendantMeshMetrics_FailedToLoadMesh);
                    return false, (("Failed to load mesh data for %*.%* (%*)"):format(v58.instance.Name, v58.fieldName, v58.id));
                end;
            end;
        end;
        return true, nil, v56;
    end)();
    if v61 then
        if v55 < v63 then
            v2.reportFailure(v2.ErrorType.validateDescendantMeshMetrics_TooManyTriangles);
            return false, {
                (("%* cannot have more than %* triangles in render meshes"):format(v53.Name, v55))
            };
        else
            return true;
        end;
    else
        if v54 then
            error(v62);
        end;
        v2.reportFailure(v2.ErrorType.validateDescendantMeshMetrics_FailedToCalculateTriangles);
        return false, {
            v62
        };
    end;
end;
local function v71(v65, v66)
    local v67, v68, v69, v70 = v16(v65, v66);
    if v67 then
        if (v69 + (v70 - v69) / 2).Magnitude > 0.001 then
            v2.reportFailure(v2.ErrorType.validateDescendantMeshMetrics_TooFarFromOrigin);
            return false, {
                string.format("Bounds for the mesh '%s' are not centered at the origin. The max allowed distance is '%f'", v65.fullName, 0.001)
            };
        else
            return true;
        end;
    else
        return v67, v68;
    end;
end;
local function v78(v72, v73)
    local v74, v75, v76, v77 = v16(v72.MeshId, v73);
    if v74 then
        if (v76 + (v77 - v76) / 2).Magnitude > 0.001 then
            v2.reportFailure(v2.ErrorType.validateDescendantMeshMetrics_TooFarFromOrigin);
            return false, {
                (("Mesh for MeshPart %* has been built too far from the origin"):format(v72.Name))
            };
        else
            return true;
        end;
    else
        return v74, v75;
    end;
end;
local function v90(v79, v80)
    local l_isServer_1 = v80.isServer;
    assert(v80.assetTypeEnum ~= nil, "assetTypeEnum required in validationContext for validateDescendantMeshMetrics");
    local l_assetTypeEnum_0 = v80.assetTypeEnum;
    local v83 = v14.new();
    local v84 = v15.parse(v79, v3.MESH_CONTENT_ID_FIELDS, v80);
    v83:updateReasons(v51(v84, l_assetTypeEnum_0, v80));
    for _, v86 in v84, nil, nil do
        local v87 = {
            fullName = v86.instance:GetFullName(), 
            fieldName = v86.fieldName, 
            contentId = v86.instance[v86.fieldName], 
            context = v86.instance.Name
        };
        if v25() then
            local v88, v89 = v17(v86.instance, v86.fieldName, v80);
            if v88 then
                v87.editableMesh = v89;
            else
                return false, {
                    string.format("Failed to load mesh for '%s'. Make sure mesh exists and try again.", v86.instance.Name)
                };
            end;
        end;
        if v86.instance.ClassName == "MeshPart" then
            assert(v86.fieldName == "MeshId");
            v83:updateReasons(v71(v87, v80));
            v83:updateReasons(v10(v87, true, v80));
            v83:updateReasons(v31(v86.instance, l_isServer_1));
            if v23() then
                v83:updateReasons(v12(v87, v80));
            end;
        elseif v86.instance.ClassName == "WrapTarget" then
            assert(v86.fieldName == "CageMeshId");
            v87.fullName = v87.fullName .. "OuterCage";
            if v19() then
                v83:updateReasons(v9(v87, v80));
            end;
            v83:updateReasons(v8(v87, v86.instance, v80));
            if v21() then
                v83:updateReasons(v11(v87, v80));
            end;
            if v24() then
                v83:updateReasons(v13(v87, v86.instance, v80));
            end;
            if v22() then
                v83:updateReasons(v12(v87, v80));
            end;
        end;
        if v19() then
            v83:updateReasons(v7(v87, v80));
        end;
    end;
    return v83:getFinalResults();
end;
local function v99(v91, v92, v93)
    local v94 = v14.new();
    local v95 = v15.parse(v91, v3.MESH_CONTENT_ID_FIELDS);
    v94:updateReasons(v64(v95, v92, v93));
    for _, v97 in v95, nil, nil do
        local v98 = string.format("%s.%s ( %s )", v97.instance:GetFullName(), v97.fieldName, v97.id);
        if v97.instance.ClassName == "MeshPart" then
            assert(v97.fieldName == "MeshId");
            v94:updateReasons(v78(v97.instance, v93));
            v94:updateReasons(v10(v97.instance[v97.fieldName], true, v93));
            v94:updateReasons(v31(v97.instance, v93));
            if v23() then
                v94:updateReasons(v12(v97.instance, v97.fieldName, v93));
            end;
        elseif v97.instance.ClassName == "WrapTarget" then
            assert(v97.fieldName == "CageMeshId");
            if v19() then
                v94:updateReasons(v9(v97.instance[v97.fieldName], v98, v93));
            end;
            v94:updateReasons(v8(v97.instance[v97.fieldName], v97.instance, v97.fieldName, v93));
            if v21() then
                v94:updateReasons(v11(v97.instance, v97.fieldName, v93));
            end;
            if v24() then
                v94:updateReasons(v13(v97.instance[v97.fieldName], v97.instance, v97.fieldName, v93));
            end;
            if v22() then
                v94:updateReasons(v12(v97.instance, v97.fieldName, v93));
            end;
        end;
        if v19() then
            v94:updateReasons(v7(v97.instance[v97.fieldName], v98, v93));
        end;
    end;
    return v94:getFinalResults();
end;
if not v18() then
    return v99;
else
    return v90;
end;
