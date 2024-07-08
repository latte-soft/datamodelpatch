local l_Players_0 = game:GetService("Players");
local l_UGCValidationService_0 = game:GetService("UGCValidationService");
local l_Parent_0 = script.Parent.Parent;
local v3 = require(l_Parent_0.flags.getEngineFeatureEngineUGCValidateBodyParts);
local v4 = require(l_Parent_0.flags.getEngineFeatureEngineUGCValidateTextureBorder);
local v5 = require(l_Parent_0.flags.getEngineFeatureViewportFrameSnapshotEngineFeature);
local v6 = require(l_Parent_0.flags.getFIntDynamicHeadBorderSize);
local v7 = require(l_Parent_0.flags.getFFlagUseThumbnailerUtil);
local v8 = require(l_Parent_0.util.setupDynamicHead);
local v9 = require(l_Parent_0.util.Thumbnailer);
local v10 = {
    LeftArm = 11714033534, 
    LeftLeg = 11714035598, 
    RightArm = 11714037276, 
    RightLeg = 11714039415, 
    Torso = 11714041015
};
local v11 = {
    "Head", 
    "Torso", 
    "LeftLeg", 
    "RightLeg", 
    "RightArm", 
    "LeftArm"
};
local v12 = {
    "ChinRaiser", 
    "ChinRaiserUpperLip", 
    "Corrugator", 
    "EyesLookDown", 
    "EyesLookLeft", 
    "EyesLookRight", 
    "EyesLookUp", 
    "FlatPucker", 
    "Funneler", 
    "JawDrop", 
    "JawLeft", 
    "JawRight", 
    "LeftBrowLowerer", 
    "LeftCheekPuff", 
    "LeftCheekRaiser", 
    "LeftDimpler", 
    "LeftEyeClosed", 
    "LeftEyeUpperLidRaiser", 
    "LeftInnerBrowRaiser", 
    "LeftLipCornerDown", 
    "LeftLipCornerPuller", 
    "LeftLipStretcher", 
    "LeftLowerLipDepressor", 
    "LeftNoseWrinkler", 
    "LeftOuterBrowRaiser", 
    "LeftUpperLipRaiser", 
    "LipPresser", 
    "LipsTogether", 
    "LowerLipSuck", 
    "MouthLeft", 
    "MouthRight", 
    "Pucker", 
    "RightBrowLowerer", 
    "RightCheekPuff", 
    "RightCheekRaiser", 
    "RightDimpler", 
    "RightEyeClosed", 
    "RightEyeUpperLidRaiser", 
    "RightInnerBrowRaiser", 
    "RightLipCornerDown", 
    "RightLipCornerPuller", 
    "RightLipStretcher", 
    "RightLowerLipDepressor", 
    "RightNoseWrinkler", 
    "RightOuterBrowRaiser", 
    "RightUpperLipRaiser", 
    "TongueDown", 
    "TongueOut", 
    "TongueUp", 
    "UpperLipSuck"
};
local v13 = {
    Vector3.new(0, 0, -1), 
    Vector3.new(0, 1, 0), 
    (Vector3.new(1, 0, 0))
};
local v14 = Color3.fromRGB(163, 162, 165);
assert(true);
local v15 = v6();
local function v19(v16)
    for _, v18 in v16:GetChildren() do
        if v18:IsA("MeshPart") and v18.Name ~= "Head" then
            v18.Transparency = 1;
        end;
    end;
end;
local function _(v20, v21)
    v20:FindFirstChild("Head"):Destroy();
    v21.Parent = v20;
    v20:FindFirstChild("Humanoid"):BuildRigFromAttachments();
end;
local _ = function(v23)
    local l_Head_0 = v23:FindFirstChild("Head");
    if l_Head_0 then
        local l_FaceControls_0 = l_Head_0:FindFirstChild("FaceControls");
        if l_FaceControls_0 then
            for _, v27 in v12, nil, nil do
                l_FaceControls_0[v27] = 1;
            end;
            return true;
        else
            return false;
        end;
    else
        return false;
    end;
end;
local function v51()
    local l_HumanoidDescription_0 = Instance.new("HumanoidDescription");
    for _, v31 in v11, nil, nil do
        l_HumanoidDescription_0[v31 .. "Color"] = v14;
    end;
    local l_l_Players_0_HumanoidModelFromDescription_0 = l_Players_0:CreateHumanoidModelFromDescription(l_HumanoidDescription_0, Enum.HumanoidRigType.R15);
    l_l_Players_0_HumanoidModelFromDescription_0:FindFirstChild("Humanoid").DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None;
    local function _(v33, v34)
        return game:GetObjectsAllOrNone("https://assetdelivery.roblox.com/v1/asset/?id=" .. tostring(v34) .. "&expectedAssetType=" .. v33);
    end;
    local _ = function(v36, v37)
        for _, v39 in pairs(v36) do
            if v39.Name == v37 then
                return v39;
            end;
        end;
        return nil;
    end;
    for v41, v42 in v10, nil, nil do
        local l_game_ObjectsAllOrNone_0 = game:GetObjectsAllOrNone("https://assetdelivery.roblox.com/v1/asset/?id=" .. tostring(v42) .. "&expectedAssetType=" .. v41);
        if l_game_ObjectsAllOrNone_0 then
            local v44;
            for _, v46 in pairs(l_game_ObjectsAllOrNone_0) do
                if v46.Name == "R15ArtistIntent" then
                    v44 = v46;
                    goto label0 --[[  true, false  ]];
                end;
            end;
            v44 = nil;
            ::label0::;
            if v44 then
                for _, v48 in v44:GetChildren() do
                    local l_SurfaceAppearance_0 = v48:FindFirstChildWhichIsA("SurfaceAppearance");
                    if l_SurfaceAppearance_0 then
                        l_SurfaceAppearance_0:Destroy();
                    end;
                    local l_l_l_Players_0_HumanoidModelFromDescription_0_FirstChild_0 = l_l_Players_0_HumanoidModelFromDescription_0:FindFirstChild(v48.Name);
                    if l_l_l_Players_0_HumanoidModelFromDescription_0_FirstChild_0 then
                        l_l_l_Players_0_HumanoidModelFromDescription_0_FirstChild_0:Destroy();
                    end;
                    v48.Parent = l_l_Players_0_HumanoidModelFromDescription_0;
                end;
            else
                return nil;
            end;
        else
            return nil;
        end;
    end;
    return l_l_Players_0_HumanoidModelFromDescription_0;
end;
local function v55()
    local v52 = Instance.new("ScreenGui", game:GetService("CoreGui"));
    local v53 = Instance.new("ViewportFrame", v52);
    v53.BackgroundTransparency = 1;
    v53.BorderSizePixel = 0;
    local v54 = Instance.new("WorldModel", v53);
    v53.Size = UDim2.fromOffset(100, 100);
    return v52, v54, v53;
end;
local function v65(v56, v57)
    local v58 = nil;
    local v59 = nil;
    for _, v61 in v56:GetDescendants() do
        if not (not (v61.Name == "Head") or not v61:IsA("MeshPart")) then
            v58 = v61.CFrame.Position;
            v59 = v61.Size;
            break;
        end;
    end;
    if v58 then
        local v62 = Vector3.new(1, 1, 1) - Vector3.new(math.abs(v57.X), math.abs(v57.Y), (math.abs(v57.Z)));
        local l_Camera_0 = Instance.new("Camera");
        local v64 = v59 * v62;
        l_Camera_0.CFrame = CFrame.lookAt((v58 + v57 * (math.max(v64.X, v64.Y, v64.Z) / 0.7002075382097097)) + (v57 * v59) / 2, v58);
        l_Camera_0.FieldOfView = 70;
        return l_Camera_0;
    else
        return nil;
    end;
end;
local function v71(v66)
    local v67, _ = game:GetService("ThumbnailGenerator"):Click("Png", 100, 100, true);
    if v67 then
        local l_status_0, l_result_0 = pcall(function()
            return l_UGCValidationService_0:ValidateTextureAlphaByteString(v67, v15);
        end);
        if l_status_0 then
            if l_result_0 then
                return true;
            else
                return false, nil, {
                    string.format("DynamicHead (%s) when emoting surpasses the expected bounding box", v66)
                };
            end;
        else
            return false, string.format("Failed to read data from snapshot of DynamicHead (%s)", v66);
        end;
    else
        return false, string.format("Unable to capture snapshot of DynamicHead (%s)", v66);
    end;
end;
local function v78(v72, v73)
    local l_status_1, l_result_1 = pcall(function()
        task.wait(1);
        return v73:CaptureSnapshotAsync();
    end);
    if l_status_1 then
        local l_status_2, l_result_2 = pcall(function()
            return l_UGCValidationService_0:ValidateTextureAlpha(l_result_1, v15);
        end);
        if l_status_2 then
            if l_result_2 then
                return true;
            else
                return false, {
                    string.format("DynamicHead (%s) when emoting surpasses the expected bounding box", v72)
                };
            end;
        else
            return false, {
                "Failed to read data from snapshot of DynamicHead (%s)"
            };
        end;
    else
        return false, {
            string.format("Unable to capture snapshot of DynamicHead (%s)", v72)
        };
    end;
end;
local function v101(v79, v80)
    if not (not v3() or not v4()) and (v80 or v5()) then
        local v81 = nil;
        local v82 = nil;
        local v83 = nil;
        if not v80 then
            local v84, v85, v86 = v55();
            v81 = v84;
            v82 = v85;
            v83 = v86;
            assert(v81, "screenGui is always created");
        end;
        local v87 = v51();
        if not v87 then
            if v81 then
                v81:Destroy();
            end;
            error("couldn't create character");
        end;
        if v80 then
            v87.Parent = workspace;
        else
            v87.Parent = v82;
        end;
        local v88 = v79:Clone();
        v87:FindFirstChild("Head"):Destroy();
        v88.Parent = v87;
        v87:FindFirstChild("Humanoid"):BuildRigFromAttachments();
        v19(v87);
        local l_Head_1 = v87:FindFirstChild("Head");
        if l_Head_1 then
            local l_FaceControls_1 = l_Head_1:FindFirstChild("FaceControls");
            if l_FaceControls_1 then
                for _, v92 in v12, nil, nil do
                    l_FaceControls_1[v92] = 1;
                end;
                v88 = true;
            else
                v88 = false;
            end;
        else
            v88 = false;
        end;
        if not v88 then
            if v81 then
                v81:Destroy();
            end;
            error("could not apply mood");
        end;
        for _, v94 in v13, nil, nil do
            local v95 = v65(v87, v94);
            if v95 then
                if not v80 then
                    v95.Parent = v83;
                    v83.CurrentCamera = v95;
                else
                    v95.Name = "ThumbnailCamera";
                    v95.Parent = workspace:GetChildren()[1];
                end;
                if not v80 then
                    local v96, v97 = v78(v79.MeshId, v83);
                    if not v96 then
                        v81:Destroy();
                        return false, v97;
                    end;
                else
                    local v98, v99, v100 = v71(v79.MeshId);
                    if not v98 then
                        v95:Destroy();
                        v87:Destroy();
                        if not v99 then
                            assert(v100, "should be failure reasons if validation failed without errors");
                            return false, v100;
                        else
                            error(v99);
                        end;
                    end;
                end;
                v95:Destroy();
            else
                if v87 then
                    v87:Destroy();
                end;
                if v81 then
                    v81:Destroy();
                end;
                return false, {
                    string.format("Unable to setup camera for DynamicHead (%s)", v79.MeshId)
                };
            end;
        end;
        if v80 then
            v87:Destroy();
        else
            v81:Destroy();
        end;
        return true;
    else
        return true;
    end;
end;
return function(v102, v103)
    if v7() then
        if not (not v3() or not v4()) and (v103 or v5()) then
            local v104 = v102:Clone();
            local v105 = v8(v104);
            if not v105 then
                error("couldn't create character");
            end;
            local l_Head_2 = v105:FindFirstChild("Head");
            local v107;
            if l_Head_2 then
                local l_FaceControls_2 = l_Head_2:FindFirstChild("FaceControls");
                if l_FaceControls_2 then
                    for _, v110 in v12, nil, nil do
                        l_FaceControls_2[v110] = 1;
                    end;
                    v107 = true;
                else
                    v107 = false;
                end;
            else
                v107 = false;
            end;
            if not v107 then
                error("could not apply mood");
            end;
            l_Head_2 = v9.new(v103, 70, Vector2.new(100, 100));
            l_Head_2:init(v104);
            for _, v112 in v13, nil, nil do
                local v113 = v104.Size * (Vector3.new(1, 1, 1) - Vector3.new(math.abs(v112.X), math.abs(v112.Y), (math.abs(v112.Z))));
                l_Head_2:setCamera(0.5, math.max(v113.X, v113.Y, v113.Z), v112);
                local v114, v115 = l_Head_2:takeSnapshot();
                if not v114 then
                    l_Head_2:cleanup();
                    local v116 = string.format("Unable to capture snapshot of DynamicHead (%s)", v102.MeshId);
                    if not v103 then
                        return false, {
                            v116
                        };
                    else
                        error(v116);
                    end;
                end;
                local v117 = nil;
                local v118 = nil;
                if not v103 then
                    local l_status_3, l_result_3 = pcall(function()
                        return l_UGCValidationService_0:ValidateTextureAlpha(v115, v15);
                    end);
                    v117 = l_status_3;
                    v118 = l_result_3;
                else
                    local l_status_4, l_result_4 = pcall(function()
                        return l_UGCValidationService_0:ValidateTextureAlphaByteString(v115, v15);
                    end);
                    v117 = l_status_4;
                    v118 = l_result_4;
                end;
                if not v117 then
                    l_Head_2:cleanup();
                    local v123 = string.format("Failed to read data from snapshot of DynamicHead (%s)", v102.MeshId);
                    if not v103 then
                        return false, {
                            v123
                        };
                    else
                        error(v123);
                    end;
                end;
                if not v118 then
                    l_Head_2:cleanup();
                    return false, {
                        string.format("DynamicHead (%s) when emoting surpasses the expected bounding box", v102.MeshId)
                    };
                end;
            end;
            l_Head_2:cleanup();
            return true;
        else
            return true;
        end;
    else
        return v101(v102, v103);
    end;
end;
