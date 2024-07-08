local l_UGCValidationService_0 = game:GetService("UGCValidationService");
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.Analytics);
local _ = require(l_Parent_0.util.Types);
local v4 = require(l_Parent_0.util.pcallDeferred);
local v5 = require(l_Parent_0.flags.getFFlagUGCValidationShouldYield);
local v6 = require(l_Parent_0.flags.getFFlagUseUGCValidationContext);
local v7 = require(l_Parent_0.flags.getEngineFeatureUGCValidateEditableMeshAndImage);
local function v30(v8, v9, v10, v11)
    local l_assetTypeEnum_0 = v11.assetTypeEnum;
    if not v7() then
        if v10.contentId == "" then
            v2.reportFailure(v2.ErrorType.validateCageMeshIntersection_InvalidRefMeshId);
            return false, {
                string.format("The meshId reference for cage '%s' is invalid or doesn't exist. Please, verify you are using a valid mesh asset and try again.", v10.fullName)
            };
        end;
    elseif not v10.editableMesh then
        v2.reportFailure(v2.ErrorType.validateCageMeshIntersection_InvalidRefMeshId);
        return false, {
            string.format("The meshId reference for cage '%s' is invalid or doesn't exist. Please, verify you are using a valid mesh asset and try again.", v10.fullName)
        };
    end;
    local v13 = nil;
    local v14 = nil;
    local v15 = nil;
    local v16 = nil;
    local v17 = nil;
    if not v7() or not v5() then
        local v18, v19, v20, v21, v22 = pcall(function()
            return l_UGCValidationService_0:ValidateCageMeshIntersection(v8.contentId, v9.contentId, v10.contentId);
        end);
        v13 = v18;
        v14 = v19;
        v15 = v20;
        v16 = v21;
        v17 = v22;
    else
        local v23, v24, v25, v26, v27 = v4(function()
            return l_UGCValidationService_0:ValidateEditableMeshCageMeshIntersection(v8.editableMesh, v9.editableMesh, v10.editableMesh);
        end, v11);
        v13 = v23;
        v14 = v24;
        v15 = v25;
        v16 = v26;
        v17 = v27;
    end;
    if v13 then
        local v28 = {};
        local v29 = true;
        if not v14 then
            v29 = false;
            v2.reportFailure(v2.ErrorType.validateCageMeshIntersection_Intersection);
            table.insert(v28, string.format("There are cage vertices inside the layered accessory mesh '%s', which could lead to interpenetration issues during fitting. You need to edit the cage mesh to fix this intersection issue.", v9.context));
        end;
        if not v15 then
            v29 = false;
            v2.reportFailure(v2.ErrorType.validateCageMeshIntersection_IrrelevantCageModified);
            table.insert(v28, string.format("Outer cage of '%s' has mesh edits on regions that don't correspond to its current asset type '%s' (i.e. edits on the lower leg cages when asset type is set to 'Head'). You need to check the asset type for the layered accessory '%s'.", v9.fullName, l_assetTypeEnum_0.Name, v9.context));
        end;
        if not v16 then
            v29 = false;
            v2.reportFailure(v2.ErrorType.validateCageMeshIntersection_OuterCageFarExtendedFromMesh);
            table.insert(v28, string.format("Outer cage of '%s' has mesh edits that place vertices too far away from the model mesh. You need to edit the cage vertices to be closer to the model.", v9.fullName));
        end;
        if not v17 then
            v29 = false;
            v2.reportFailure(v2.ErrorType.validateCageMeshIntersection_AverageOuterCageToMeshVertDistances);
            table.insert(v28, string.format("The average distance between the layered accessory '%s' and its outer cage is too large. You need to edit the cage mesh to be closer to the accessory.", v9.context));
        end;
        return v29, v28;
    else
        v2.reportFailure(v2.ErrorType.validateCageMeshIntersection_FailedToExecute);
        return false, {
            string.format("Failed to execute cage intersection detection for '%s'. Make sure the cage mesh exists and try again.", v10.fullName)
        };
    end;
end;
local function v41(v31, v32, v33)
    if v33 == "" then
        v2.reportFailure(v2.ErrorType.validateCageMeshIntersection_InvalidRefMeshId);
        return false, {
            "Mesh must contain valid MeshId for CageMeshIntersection checks."
        };
    else
        local v34, v35, v36, v37, v38 = pcall(function()
            return l_UGCValidationService_0:ValidateCageMeshIntersection(v31, v32, v33);
        end);
        if v34 then
            local v39 = {};
            local v40 = true;
            if not v35 then
                v40 = false;
                v2.reportFailure(v2.ErrorType.validateCageMeshIntersection_Intersection);
                table.insert(v39, "There are cage vertices intersect with the clothing mesh, which could lead to interpenetration issues.");
            end;
            if not v36 then
                v40 = false;
                v2.reportFailure(v2.ErrorType.validateCageMeshIntersection_IrrelevantCageModified);
                table.insert(v39, "Some outer cage geometry that is far away from the clothing mesh has been modified.");
            end;
            if not v37 then
                v40 = false;
                v2.reportFailure(v2.ErrorType.validateCageMeshIntersection_OuterCageFarExtendedFromMesh);
                table.insert(v39, "There are outer cage vertex(s) that are too far away from the clothing mesh.");
            end;
            if not v38 then
                v40 = false;
                v2.reportFailure(v2.ErrorType.validateCageMeshIntersection_AverageOuterCageToMeshVertDistances);
                table.insert(v39, "The average distance between the clothing and outer cage is too large.");
            end;
            return v40, v39;
        else
            v2.reportFailure(v2.ErrorType.validateCageMeshIntersection_FailedToExecute);
            return false, {
                "Failed to execute validateCageMeshIntersection check"
            };
        end;
    end;
end;
if not v6() then
    return v41;
else
    return v30;
end;
