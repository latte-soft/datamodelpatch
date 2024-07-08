local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.flags.getEngineFeatureEngineUGCValidateTransparency);
local v2 = require(l_Parent_0.flags.getFFlagUGCValidationValidateTransparencyClient);
local v3 = require(l_Parent_0.flags.getFFlagUGCValidationValidateTransparencyServer);
local v4 = require(l_Parent_0.flags.getEngineFeatureViewportFrameSnapshotEngineFeature);
local v5 = require(l_Parent_0.flags.getFFlagUseThumbnailerUtil);
local v6 = game:DefineFastInt("UGCValidationHeadThreshold", 30);
local v7 = game:DefineFastInt("UGCValidationTorsoThresholdFront", 50);
local v8 = game:DefineFastInt("UGCValidationTorsoThresholdBack", 48);
local v9 = game:DefineFastInt("UGCValidationTorsoThresholdSide", 46);
local v10 = game:DefineFastInt("UGCValidationLeftArmThresholdFront", 35);
local v11 = game:DefineFastInt("UGCValidationLeftArmThresholdBack", 33);
local v12 = game:DefineFastInt("UGCValidationLeftArmThresholdSide", 50);
local v13 = game:DefineFastInt("UGCValidationRightArmThresholdFront", 35);
local v14 = game:DefineFastInt("UGCValidationRightArmThresholdBack", 33);
local v15 = game:DefineFastInt("UGCValidationRightArmThresholdSide", 50);
local v16 = game:DefineFastInt("UGCValidationLeftLegThresholdFront", 50);
local v17 = game:DefineFastInt("UGCValidationLeftLegThresholdBack", 50);
local v18 = game:DefineFastInt("UGCValidationLeftLegThresholdSide", 46);
local v19 = game:DefineFastInt("UGCValidationRightLegThresholdFront", 50);
local v20 = game:DefineFastInt("UGCValidationRightLegThresholdBack", 50);
local v21 = game:DefineFastInt("UGCValidationRightLegThresholdSide", 48);
local l_UGCValidationService_0 = game:GetService("UGCValidationService");
local _ = require(l_Parent_0.util.Types);
local v24 = require(l_Parent_0.util.AssetTraversalUtils);
local v25 = require(l_Parent_0.ConstantsInterface);
local v26 = require(l_Parent_0.util.Thumbnailer);
local v27 = require(l_Parent_0.util.setupTransparentPartSize);
local v28 = {
    Vector3.new(0, 0, -1), 
    Vector3.new(0, 0, 1), 
    (Vector3.new(1, 0, 0))
};
local v29 = Color3.fromRGB(0, 0, 0);
local v30 = Color3.fromRGB(7, 32, 91);
local v31 = {
    [Enum.AssetType.DynamicHead] = {
        [v28[1]] = v6 / 100, 
        [v28[2]] = v6 / 100, 
        [v28[3]] = v6 / 100
    }, 
    [Enum.AssetType.Torso] = {
        [v28[1]] = v7 / 100, 
        [v28[2]] = v8 / 100, 
        [v28[3]] = v9 / 100
    }, 
    [Enum.AssetType.LeftArm] = {
        [v28[1]] = v10 / 100, 
        [v28[2]] = v11 / 100, 
        [v28[3]] = v12 / 100
    }, 
    [Enum.AssetType.RightArm] = {
        [v28[1]] = v13 / 100, 
        [v28[2]] = v14 / 100, 
        [v28[3]] = v15 / 100
    }, 
    [Enum.AssetType.LeftLeg] = {
        [v28[1]] = v16 / 100, 
        [v28[2]] = v17 / 100, 
        [v28[3]] = v18 / 100
    }, 
    [Enum.AssetType.RightLeg] = {
        [v28[1]] = v19 / 100, 
        [v28[2]] = v20 / 100, 
        [v28[3]] = v21 / 100
    }
};
local function v35()
    local v32 = Instance.new("ScreenGui", game:GetService("CoreGui"));
    local v33 = Instance.new("ViewportFrame", v32);
    v33.BackgroundTransparency = 1;
    v33.BorderSizePixel = 0;
    v33.BackgroundColor3 = v29;
    local v34 = Instance.new("WorldModel", v33);
    v33.Size = UDim2.fromOffset(100, 100);
    return v32, v34, v33;
end;
local function v43(v36, v37)
    local v38 = nil;
    local v39 = nil;
    v38 = v36.CFrame.Position;
    v39 = v36.Size;
    if v38 then
        local v40 = Vector3.new(1, 1, 1) - Vector3.new(math.abs(v37.X), math.abs(v37.Y), (math.abs(v37.Z)));
        local l_Camera_0 = Instance.new("Camera");
        local v42 = v39 * v40;
        l_Camera_0.CFrame = CFrame.lookAt((v38 + v37 * ((math.max(v42.X, v42.Y, v42.Z) / 1.9) / 0.7002075382097097)) + (v37 * v39) / 2, v38);
        l_Camera_0.FieldOfView = 70;
        return l_Camera_0;
    else
        return nil;
    end;
end;
local function v52(v44, v45)
    local v46, _ = game:GetService("ThumbnailGenerator"):Click("Png", 100, 100, true);
    if v46 then
        local l_status_0, l_result_0 = pcall(function()
            return l_UGCValidationService_0:ValidateImageTransparencyThresholdByteString(v46, v31[v44][v45]);
        end);
        if l_status_0 then
            if l_result_0 then
                return true;
            else
                return false, {
                    (string.format("%s is too transparent. Please fill in more of the mesh.", v44.Name))
                };
            end;
        else
            local v50 = string.format("Failed to read data from snapshot of (%s)", v44.Name);
            error(v50);
            return false, {
                v50
            };
        end;
    else
        local v51 = string.format("Unable to capture snapshot of %s", v44.Name);
        error(v51);
        return false, {
            v51
        };
    end;
end;
local function v60(v53, v54, v55)
    local l_status_1, l_result_1 = pcall(function()
        task.wait(1);
        return v55:CaptureSnapshotAsync();
    end);
    if l_status_1 then
        local l_status_2, l_result_2 = pcall(function()
            return l_UGCValidationService_0:ValidateImageTransparencyThresholdTextureID(l_result_1, v31[v53][v54]);
        end);
        if l_status_2 then
            if l_result_2 then
                return true;
            else
                return false, {
                    (string.format("%s is too transparent. Please fill in more of the mesh.", v53.Name))
                };
            end;
        else
            return false, {
                (string.format("Failed to read data from snapshot of (%s)", v53.Name))
            };
        end;
    else
        return false, {
            string.format("Unable to capture snapshot of %s", v53.Name)
        };
    end;
end;
local function v95(v61, v62, v63)
    if (not v61 or not v62) or v63 == nil then
        return true;
    elseif v1() then
        if not v63 or v3() then
            if v63 or v2() and v4() then
                local v64 = v61:Clone();
                local v65 = nil;
                local v66 = nil;
                local v67 = nil;
                if not v63 then
                    local v68, v69, v70 = v35();
                    v65 = v68;
                    v66 = v69;
                    v67 = v70;
                end;
                local v71 = {};
                local l_MeshPart_0 = Instance.new("MeshPart");
                l_MeshPart_0.Parent = not not v63 and workspace or v66;
                l_MeshPart_0.CanCollide = false;
                l_MeshPart_0.Transparency = 0.5;
                l_MeshPart_0.Color = v30;
                if Enum.AssetType.DynamicHead == v62 then
                    v24.calculateBounds(v62, v64, CFrame.new(), v71);
                    v64.Parent = if not v63 then v66 else workspace;
                    l_MeshPart_0.Parent = if not v63 then v66 else workspace;
                    l_MeshPart_0.Position = v64.Position;
                    l_MeshPart_0.Size = v64.Size;
                else
                    local v73 = v24.assetHierarchy[v62];
                    v24.traverseHierarchy(nil, v64, v62, nil, CFrame.new(), v73.root, v73, v71);
                    local function v74(v75, v76, v77, v78, v79)
                        local l_v75_FirstChild_0 = v75:FindFirstChild(v78);
                        local l_v77_0 = v77;
                        if v76 then
                            local l_v75_FirstChild_1 = v75:FindFirstChild(v76);
                            local v83 = v25.getRigAttachmentToParent(v62, v78);
                            l_v77_0 = (l_v77_0 * l_v75_FirstChild_1:FindFirstChild(v83).CFrame) * l_v75_FirstChild_0:FindFirstChild(v83).CFrame:Inverse();
                        end;
                        l_v75_FirstChild_0.CFrame = l_v77_0;
                        if v79.children then
                            for v84, v85 in v79.children, nil, nil do
                                v74(v75, v78, l_v77_0, v84, v85);
                            end;
                        end;
                    end;
                    v64.Parent = if not v63 then v66 else workspace;
                    v74(v64, nil, CFrame.new(), v73.root, v73);
                    local v86 = Vector3.new();
                    local v87 = Vector3.new();
                    v86 = if not v71.maxOverall then Vector3.new() else v71.maxOverall;
                    v87 = if not v71.minOverall then Vector3.new() else v71.minOverall;
                    if not (v71.minOverall ~= nil) or v71.maxOverall == nil then
                        return false, {
                            "Errored out trying to determine size of asset"
                        };
                    else
                        l_MeshPart_0.Size = Vector3.new(v86.X - v87.X, v86.Y - v87.Y, v86.Z - v87.Z);
                        l_MeshPart_0.Position = Vector3.new(v87.X + l_MeshPart_0.Size.X / 2, v87.Y + l_MeshPart_0.Size.Y / 2, v87.Z + l_MeshPart_0.Size.Z / 2);
                    end;
                end;
                for _, v89 in v28, nil, nil do
                    local v90 = v43(l_MeshPart_0, v89);
                    if v90 then
                        if not v63 then
                            v90.Parent = v67;
                            v67.CurrentCamera = v90;
                        else
                            v90.Name = "ThumbnailCamera";
                            v90.Parent = workspace:GetChildren()[1];
                        end;
                        if not v63 then
                            local v91, v92 = v60(v62, v89, v67);
                            if not v91 then
                                v65:Destroy();
                                v64:Destroy();
                                l_MeshPart_0:Destroy();
                                return false, v92;
                            end;
                        else
                            local v93, v94 = v52(v62, v89);
                            if not v93 then
                                v64:Destroy();
                                l_MeshPart_0:Destroy();
                                return false, v94;
                            end;
                        end;
                        v90:Destroy();
                    else
                        if not v63 then
                            v65:Destroy();
                        end;
                        v64:Destroy();
                        l_MeshPart_0:Destroy();
                        return false, {
                            string.format("Unable to setup camera for Part (%s)", v62.Name)
                        };
                    end;
                end;
                if not v63 then
                    v65:Destroy();
                end;
                v64:Destroy();
                l_MeshPart_0:Destroy();
                return true;
            else
                return true;
            end;
        else
            return true;
        end;
    else
        return true;
    end;
end;
return function(v96, v97, v98)
    if v5() then
        if v96 then
            if v1() then
                local v99 = not not v98 or false;
                if not v99 or v3() then
                    if v99 or v2() and v4() then
                        local v100 = v96:Clone();
                        local l_MeshPart_1 = Instance.new("MeshPart");
                        l_MeshPart_1.CanCollide = false;
                        l_MeshPart_1.Transparency = 0.5;
                        l_MeshPart_1.Color = v30;
                        if v27(l_MeshPart_1, v100, v97) then
                            local l_Folder_0 = Instance.new("Folder");
                            l_MeshPart_1.Parent = l_Folder_0;
                            v100.Parent = l_Folder_0;
                            local v103 = v26.new(v99, 70, Vector2.new(100, 100));
                            v103:init(l_MeshPart_1);
                            for _, v105 in v28, nil, nil do
                                local v106 = l_MeshPart_1.Size * (Vector3.new(1, 1, 1) - Vector3.new(math.abs(v105.X), math.abs(v105.Y), (math.abs(v105.Z))));
                                v103:setCamera(0.95, math.max(v106.X, v106.Y, v106.Z), v105);
                                local v107, v108 = v103:takeSnapshot();
                                if not v107 then
                                    v103:cleanup();
                                    local v109 = string.format("Unable to capture snapshot of %s", v97.Name);
                                    if not v99 then
                                        return false, {
                                            v109
                                        };
                                    else
                                        error(v109);
                                    end;
                                end;
                                local v110 = nil;
                                local v111 = nil;
                                if not v99 then
                                    local l_status_3, l_result_3 = pcall(function()
                                        return l_UGCValidationService_0:ValidateImageTransparencyThresholdTextureID(v108, v31[v97][v105]);
                                    end);
                                    v110 = l_status_3;
                                    v111 = l_result_3;
                                else
                                    local l_status_4, l_result_4 = pcall(function()
                                        return l_UGCValidationService_0:ValidateImageTransparencyThresholdByteString(v108, v31[v97][v105]);
                                    end);
                                    v110 = l_status_4;
                                    v111 = l_result_4;
                                end;
                                if not v110 then
                                    v103:cleanup();
                                    local v116 = string.format("Failed to read data from snapshot of (%s)", v97.Name);
                                    if not v99 then
                                        return false, {
                                            v116
                                        };
                                    else
                                        error(v116);
                                    end;
                                end;
                                if not v111 then
                                    v103:cleanup();
                                    return false, {
                                        string.format("%s is too transparent. Please fill in more of the mesh.", v97.Name)
                                    };
                                end;
                            end;
                            v103:cleanup();
                            return true;
                        else
                            return false, {
                                "Error getting part sizes "
                            };
                        end;
                    else
                        return true;
                    end;
                else
                    return true;
                end;
            else
                return true;
            end;
        else
            return true;
        end;
    else
        return v95(v96, v97, v98);
    end;
end;
