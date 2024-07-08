local l_UGCValidationService_0 = game:GetService("UGCValidationService");
local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v3 = require(l_Parent_0.util.getEditableMeshFromContext);
local v4 = require(l_Parent_0.flags.getFFlagUseUGCValidationContext);
local v5 = require(l_Parent_0.flags.getEngineFeatureUGCValidateEditableMeshAndImage);
local v6 = require(l_Parent_0.flags.getFFlagUGCValidationFixResetPhysicsError);
local v7 = require(l_Parent_0.Analytics);
local function v17(v8, v9)
    if game:GetEngineFeature("EngineResetCollisionFidelity") then
        for _, v11 in v8, nil, nil do
            local l_v11_Descendants_0 = v11:GetDescendants();
            table.insert(l_v11_Descendants_0, 1, v11);
            for _, v14 in l_v11_Descendants_0, nil, nil do
                if v14:IsA("MeshPart") then
                    if not v5() then
                        if not v6() then
                            l_UGCValidationService_0:ResetCollisionFidelity(v14, v14.CollisionFidelity);
                        elseif not pcall(function()
                            l_UGCValidationService_0:ResetCollisionFidelity(v14, v14.CollisionFidelity);
                        end) then
                            if v9.isServer then
                                error("Failed to load mesh data");
                            end;
                            v7.reportFailure(v7.ErrorType.resetPhysicsData_FailedToLoadMesh);
                            return false, "Failed to load mesh data";
                        end;
                    else
                        local v15, v16 = v3(v14, "MeshId", v9);
                        if v15 then
                            if not v6() then
                                l_UGCValidationService_0:ResetCollisionFidelityWithEditableMeshDataLua(v14, v16, v14.CollisionFidelity);
                            elseif not pcall(function()
                                l_UGCValidationService_0:ResetCollisionFidelityWithEditableMeshDataLua(v14, v16, v14.CollisionFidelity);
                            end) then
                                if v9.isServer then
                                    error("Failed to load mesh data");
                                end;
                                v7.reportFailure(v7.ErrorType.resetPhysicsData_FailedToLoadMesh);
                                return false, "Failed to load mesh data";
                            end;
                        else
                            return false, "Failed to load mesh data";
                        end;
                    end;
                end;
            end;
        end;
        return true;
    else
        return false, "EngineResetCollisionFidelity is not enabled";
    end;
end;
local function v25(v18, v19)
    if game:GetEngineFeature("EngineResetCollisionFidelity") then
        for _, v21 in v18, nil, nil do
            local l_v21_Descendants_0 = v21:GetDescendants();
            table.insert(l_v21_Descendants_0, 1, v21);
            for _, v24 in l_v21_Descendants_0, nil, nil do
                if v24:IsA("MeshPart") then
                    if not v6() then
                        l_UGCValidationService_0:ResetCollisionFidelity(v24, v24.CollisionFidelity);
                    elseif not pcall(function()
                        l_UGCValidationService_0:ResetCollisionFidelity(v24, v24.CollisionFidelity);
                    end) then
                        if v19 then
                            error("Failed to load mesh data");
                        end;
                        v7.reportFailure(v7.ErrorType.resetPhysicsData_FailedToLoadMesh);
                        return false, "Failed to load mesh data";
                    end;
                end;
            end;
        end;
        if not v6() then
            return nil;
        else
            return true;
        end;
    elseif not v6() then
        return nil;
    else
        return true;
    end;
end;
if not v4() then
    return v25;
else
    return v17;
end;
