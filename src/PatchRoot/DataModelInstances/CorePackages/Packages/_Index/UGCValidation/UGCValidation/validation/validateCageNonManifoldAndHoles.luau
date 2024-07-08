local l_UGCValidationService_0 = game:GetService("UGCValidationService");
local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v3 = require(l_Parent_0.Analytics);
local v4 = require(l_Parent_0.flags.getFFlagUseUGCValidationContext);
local v5 = require(l_Parent_0.flags.getEngineFeatureUGCValidateEditableMeshAndImage);
local function v18(v6)
    local v7 = nil;
    local v8 = nil;
    local v9 = nil;
    if not v5() then
        local v10, v11, v12 = pcall(function()
            return l_UGCValidationService_0:ValidateCageNonManifoldAndHoles(v6.contentId);
        end);
        v7 = v10;
        v8 = v11;
        v9 = v12;
    else
        local v13, v14, v15 = pcall(function()
            return l_UGCValidationService_0:ValidateEditableMeshCageNonManifoldAndHoles(v6.editableMesh);
        end);
        v7 = v13;
        v8 = v14;
        v9 = v15;
    end;
    if v7 then
        local v16 = {};
        local v17 = true;
        if not v8 then
            v17 = false;
            v3.reportFailure(v3.ErrorType.validateCageNonManifoldAndHoles_NonManifold);
            table.insert(v16, string.format("'%s' is non-manifold (i.e. there are edges with 3 or more incident faces). Some vertices are likely too close and welded together as a single vertex causing edges to collapse into a non-manifold. You need to edit the cage mesh so that vertices aren't too close together.", v6.fullName));
        end;
        if not v9 then
            v17 = false;
            v3.reportFailure(v3.ErrorType.validateCageNonManifoldAndHoles_CageHoles);
            table.insert(v16, string.format("'%s' is not watertight (i.e. detected holes in the mesh). You need to edit the mesh and close the holes (may leave eyes and mouth areas open when applicable).", v6.fullName));
        end;
        return v17, v16;
    else
        v3.reportFailure(v3.ErrorType.validateCageNonManifoldAndHoles_FailedToExecute);
        return false, {
            string.format("Failed to execute cage non-manifold check for '%s'. Make sure cage mesh exists and try again.", v6.fullName)
        };
    end;
end;
local function v26(v19, v20)
    local v21, v22, v23 = pcall(function()
        return l_UGCValidationService_0:ValidateCageNonManifoldAndHoles(v19);
    end);
    if v21 then
        local v24 = {};
        local v25 = true;
        if not v22 then
            v25 = false;
            v3.reportFailure(v3.ErrorType.validateCageNonManifoldAndHoles_NonManifold);
            table.insert(v24, string.format("%s has non-manifold geometry, which can cause deformation issues.", v20));
        end;
        if not v23 then
            v25 = false;
            v3.reportFailure(v3.ErrorType.validateCageNonManifoldAndHoles_CageHoles);
            table.insert(v24, string.format("%s is not watertight, meaning there are holes in it.", v20));
        end;
        return v25, v24;
    else
        v3.reportFailure(v3.ErrorType.validateCageNonManifoldAndHoles_FailedToExecute);
        return false, {
            "Failed to execute validateCageNonManifoldAndHoles check"
        };
    end;
end;
if not v4() then
    return v26;
else
    return v18;
end;
