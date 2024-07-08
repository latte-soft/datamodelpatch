local l_UGCValidationService_0 = game:GetService("UGCValidationService");
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.Analytics);
local v3 = require(l_Parent_0.util.FailureReasonsAccumulator);
local v4 = require(l_Parent_0.flags.getFFlagUseUGCValidationContext);
local v5 = require(l_Parent_0.flags.getEngineFeatureEngineUGCValidateBodyParts);
local v6 = require(l_Parent_0.flags.getEngineFeatureUGCValidateGetInactiveControls);
local v7 = require(l_Parent_0.flags.getFFlagUGCValidateTestInactiveControls);
local l_game_EngineFeature_0 = game:GetEngineFeature("UGCValidateCompareTextureOverlap");
local v9 = require(l_Parent_0.flags.getEngineFeatureViewportFrameSnapshotEngineFeature);
local v10 = game:DefineFastInt("UGCValidateFacsDataOperationalThreshold", 200) * 0.001;
local v11 = require(l_Parent_0.util.setupDynamicHead);
local v12 = require(l_Parent_0.util.Thumbnailer);
local _ = require(l_Parent_0.util.Types);
local v14 = {
    "LipsTogether", 
    "Pucker", 
    "LeftLipStretcher", 
    "RightLipStretcher", 
    "LeftLipCornerPuller", 
    "RightLipCornerPuller", 
    "LeftUpperLipRaiser", 
    "RightUpperLipRaiser", 
    "LeftLowerLipDepressor", 
    "RightLowerLipDepressor", 
    "JawDrop", 
    "LeftEyeClosed", 
    "RightEyeClosed", 
    "EyesLookRight", 
    "EyesLookLeft", 
    "EyesLookUp", 
    "EyesLookDown"
};
local function v18(v15, v16)
    local v17 = nil;
    v17 = not v4() and "Failed to retrieve mesh data to validate dynamic head" or string.format("Failed to load model for dynamic head '%s'. Make sure model exists and try again.", v16);
    if v15 then
        error(v17);
    end;
    v2.reportFailure(v2.ErrorType.validateDynamicHeadMeshPartFormat_FailedToLoadMesh);
    return false, {
        v17
    };
end;
local v19 = Vector3.new(0, 0, -1);
local function v40(v20, v21)
    if v21 or v9() then
        local v22 = v20:Clone();
        if v11(v22) then
            local v23 = v12.new(v21, 1, Vector2.new(100, 100));
            v23:init(v22);
            v23:setCamera(1, math.max(v22.Size.X, v22.Size.Y), v19);
            local v24, v25 = v23:takeSnapshot();
            local l_FaceControls_0 = v22:FindFirstChild("FaceControls");
            if l_FaceControls_0 then
                for _, v28 in v14, nil, nil do
                    l_FaceControls_0[v28] = 1;
                end;
                local v29, v30 = v23:takeSnapshot();
                if v24 and v29 then
                    local v31 = nil;
                    local v32 = nil;
                    if not v21 then
                        local l_status_0, l_result_0 = pcall(function()
                            return l_UGCValidationService_0:CompareTextureOverlapTextureId(v25, v30);
                        end);
                        v31 = l_status_0;
                        v32 = l_result_0;
                    else
                        local l_status_1, l_result_1 = pcall(function()
                            return l_UGCValidationService_0:CompareTextureOverlapByteString(v25, v30);
                        end);
                        v31 = l_status_1;
                        v32 = l_result_1;
                    end;
                    v23:cleanup();
                    if not v31 or #v32 < 2 then
                        local v37 = string.format("Failed to read data from snapshot of DynamicHead (%s)", v20.MeshId);
                        if not v21 then
                            return false, {
                                v37
                            };
                        else
                            error(v37);
                        end;
                    end;
                    local v38 = v32[1] / v32[2];
                    if v38 < v10 then
                        return false, {
                            string.format("DynamicHead (%s) did not pass threshold (%f < %f) for percent change when emoting", v20.MeshId, v38, v10)
                        };
                    else
                        return true;
                    end;
                else
                    local v39 = string.format("Unable to capture snapshot of DynamicHead (%s)", v20.MeshId);
                    if v21 then
                        error(v39);
                    end;
                    return false, {
                        v39
                    };
                end;
            else
                v23:cleanup();
                return false, {
                    "No FaceControls founds"
                };
            end;
        else
            return false, {
                string.format("Unable to setup body for DynamicHead (%s)", v20.MeshId)
            };
        end;
    else
        return true;
    end;
end;
local function v52(v41, v42)
    if v5() then
        local l_isServer_0 = v42.isServer;
        local v44 = not not v42.bypassFlags and v42.bypassFlags.skipSnapshot;
        local l_status_2, l_result_2 = pcall(function()
            return l_UGCValidationService_0:ValidateDynamicHeadMesh(v41.MeshId);
        end);
        if l_status_2 then
            if l_result_2 then
                l_status_2 = v3.new();
                if not (not v6() or not v7()) then
                    local v47, v48;
                    l_result_2, v47, v48 = pcall(function()
                        return l_UGCValidationService_0:GetDynamicHeadMeshInactiveControls(v41.MeshId, v14);
                    end);
                    if not l_result_2 then
                        if string.find(v47, "Download Error") == 1 then
                            if not v4() then
                                return v18(l_isServer_0);
                            else
                                return v18(l_isServer_0, v41.Name);
                            end;
                        else
                            assert(false, v47);
                        end;
                    end;
                    local v49 = #v47 == 0;
                    local v50 = #v48 == 0;
                    if not (v49 and v50) then
                        v2.reportFailure(v2.ErrorType.validateDynamicHeadMeshPartFormat_ValidateDynamicHeadMeshControls);
                        l_status_2:updateReasons(v49, {
                            (("%*.MeshId (%*) is missing FACS controls: %*"):format(v41.Name, v41.MeshId, (table.concat(v47, ", "))))
                        });
                        l_status_2:updateReasons(v50, {
                            (("%*.MeshId (%*) has inactive FACS controls: %*"):format(v41.Name, v41.MeshId, (table.concat(v48, ", "))))
                        });
                    end;
                end;
                if not (not l_game_EngineFeature_0 or v44) then
                    local v51;
                    l_result_2, v51 = v40(v41, l_isServer_0);
                    l_status_2:updateReasons(l_result_2, v51);
                end;
                return l_status_2:getFinalResults();
            else
                v2.reportFailure(v2.ErrorType.validateDynamicHeadMeshPartFormat_ValidateDynamicHeadMesh);
                if not v4() then
                    return false, {
                        (("%*.MeshId (%*) is not correctly set-up to be a dynamic head mesh as it has no FACS information"):format(v41.Name, v41.MeshId))
                    };
                else
                    return false, {
                        string.format("Failed validation for dynamic head '%s' due to missing FACS information. You need to provide FACS controls for at least 17 poses (see documentation).", v41.Name)
                    };
                end;
            end;
        elseif not v4() then
            return v18(l_isServer_0);
        else
            return v18(l_isServer_0, v41.Name);
        end;
    else
        return true;
    end;
end;
local function v63(v53, v54, v55)
    if v5() then
        local l_status_3, l_result_3 = pcall(function()
            return l_UGCValidationService_0:ValidateDynamicHeadMesh(v53.MeshId);
        end);
        if l_status_3 then
            if l_result_3 then
                l_status_3 = v3.new();
                if not (not v6() or not v7()) then
                    local v58, v59;
                    l_result_3, v58, v59 = pcall(function()
                        return l_UGCValidationService_0:GetDynamicHeadMeshInactiveControls(v53.MeshId, v14);
                    end);
                    if not l_result_3 then
                        if string.find(v58, "Download Error") == 1 then
                            return v18(v54);
                        else
                            assert(false, v58);
                        end;
                    end;
                    local v60 = #v58 == 0;
                    local v61 = #v59 == 0;
                    if not (v60 and v61) then
                        v2.reportFailure(v2.ErrorType.validateDynamicHeadMeshPartFormat_ValidateDynamicHeadMeshControls);
                        l_status_3:updateReasons(v60, {
                            (("%*.MeshId (%*) is missing FACS controls: %*"):format(v53.Name, v53.MeshId, (table.concat(v58, ", "))))
                        });
                        l_status_3:updateReasons(v61, {
                            (("%*.MeshId (%*) has inactive FACS controls: %*"):format(v53.Name, v53.MeshId, (table.concat(v59, ", "))))
                        });
                    end;
                end;
                if not (not l_game_EngineFeature_0 or v55) then
                    local v62;
                    l_result_3, v62 = v40(v53, v54);
                    l_status_3:updateReasons(l_result_3, v62);
                end;
                return l_status_3:getFinalResults();
            else
                v2.reportFailure(v2.ErrorType.validateDynamicHeadMeshPartFormat_ValidateDynamicHeadMesh);
                return false, {
                    (("%*.MeshId (%*) is not correctly set-up to be a dynamic head mesh as it has no FACS information"):format(v53.Name, v53.MeshId))
                };
            end;
        else
            return v18(v54);
        end;
    else
        return true;
    end;
end;
if not v4() then
    return v63;
else
    return v52;
end;
