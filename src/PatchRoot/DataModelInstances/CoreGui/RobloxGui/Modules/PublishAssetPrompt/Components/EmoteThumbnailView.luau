local l_CorePackages_0 = game:GetService("CorePackages");
local l_Players_0 = game:GetService("Players");
local l_RunService_0 = game:GetService("RunService");
local l_EmoteUtility_0 = require(l_CorePackages_0.Thumbnailing).EmoteUtility;
local v4 = require(l_CorePackages_0.Roact);
local v5 = require(l_CorePackages_0.Packages.t);
local v6 = require(script.Parent.EmoteThumbnailParameters);
local v7 = v4.PureComponent:extend("EmoteThumbnailView");
v7.validateProps = v5.strictInterface({
    animationClip = v5.instanceIsA("AnimationClip"), 
    thumbnailParameters = v6.validate, 
    position = v5.optional(v5.UDim2), 
    anchorPoint = v5.optional(v5.Vector2), 
    size = v5.optional(v5.UDim2)
});
v7.updateCameraAndCharacterPose = function(v8)
    if v8.character == nil then
        return ;
    else
        local l_props_0 = v8.props;
        local l_character_0 = v8.character;
        local l_animationClip_0 = l_props_0.animationClip;
        local l_thumbnailParameters_0 = l_props_0.thumbnailParameters;
        local l_thumbnailTime_0 = l_thumbnailParameters_0.thumbnailTime;
        local l_thumbnailKeyframe_0 = l_thumbnailParameters_0.thumbnailKeyframe;
        local l_thumbnailCharacterRotation_0 = l_thumbnailParameters_0.thumbnailCharacterRotation;
        local v16 = nil;
        if not l_animationClip_0:IsA("CurveAnimation") then
            if not l_animationClip_0:IsA("KeyframeSequence") then
                error("Unsupported Animation data:", l_animationClip_0.ClassName);
            else
                v16 = l_EmoteUtility_0.GetThumbnailKeyframe(l_thumbnailKeyframe_0, l_animationClip_0, l_thumbnailCharacterRotation_0);
            end;
        else
            v16 = l_EmoteUtility_0.GetThumbnailKeyframeFromCurve(l_thumbnailTime_0, l_animationClip_0, l_thumbnailCharacterRotation_0);
        end;
        l_EmoteUtility_0.SetPlayerCharacterNeutralPose(l_character_0);
        l_EmoteUtility_0.ApplyKeyframe(l_character_0, v16);
        task.spawn(function()
            l_RunService_0.PreAnimation:Wait();
            l_RunService_0.PostSimulation:Wait();
            local l_Folder_0 = Instance.new("Folder");
            l_Folder_0.Parent = l_character_0;
            l_Folder_0:Destroy();
            local l_l_character_0_ModelCFrame_0 = l_character_0:GetModelCFrame();
            v8.updateCameraCFrameBinding((l_EmoteUtility_0.ThumbnailZoomExtents(l_character_0, 20, l_thumbnailParameters_0.thumbnailHorizontalOffset, l_thumbnailParameters_0.thumbnailVerticalOffset, l_thumbnailParameters_0.thumbnailZoom)));
            v8.updateCameraFocusBinding(l_l_character_0_ModelCFrame_0);
        end);
        return ;
    end;
end;
v7.addCharacterToViewportIfNeeded = function(v19)
    if v19.character ~= nil and v19.character.Parent ~= nil then
        return ;
    else
        if v19.worldModelRef:getValue() and v19.character ~= nil then
            v19.character.Parent = v19.worldModelRef:getValue();
            v19:updateCameraAndCharacterPose();
        end;
        return ;
    end;
end;
v7.init = function(v20)
    v20.cameraRef = v4.createRef();
    v20.worldModelRef = v4.createRef();
    local v21, v22 = v4.createBinding(CFrame.new());
    v20.cameraCFrameBinding = v21;
    v20.updateCameraCFrameBinding = v22;
    v21, v22 = v4.createBinding(CFrame.new());
    v20.cameraFocusBinding = v21;
    v20.updateCameraFocusBinding = v22;
    task.spawn(function()
        local l_status_0, l_result_0 = pcall(function()
            return (l_Players_0:GetHumanoidDescriptionFromOutfitId(1342485078));
        end);
        if not l_status_0 then
            l_result_0 = Instance.new("HumanoidDescription");
        end;
        v20.character = l_Players_0:CreateHumanoidModelFromDescription(l_result_0, Enum.HumanoidRigType.R15);
        v20:addCharacterToViewportIfNeeded();
    end);
end;
v7.render = function(v25)
    return v4.createElement("Frame", {
        BackgroundTransparency = 0, 
        Position = v25.props.position or UDim2.fromScale(0, 0), 
        AnchorPoint = v25.props.anchorPoint or Vector2.new(0, 0), 
        Size = v25.props.size or UDim2.fromScale(1, 1), 
        BackgroundColor3 = Color3.fromRGB(200, 200, 200)
    }, {
        UICorner = v4.createElement("UICorner", {
            CornerRadius = UDim.new(0, 8)
        }), 
        AspectRatioConstraint = v4.createElement("UIAspectRatioConstraint", {
            AspectRatio = 1, 
            AspectType = Enum.AspectType.FitWithinMaxSize, 
            DominantAxis = Enum.DominantAxis.Width
        }), 
        ViewportFrame = v4.createElement("ViewportFrame", {
            Size = UDim2.fromScale(1, 1), 
            Position = UDim2.fromScale(0.5, 0.5), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            ImageColor3 = Color3.new(0, 0, 0), 
            ImageTransparency = 0, 
            BackgroundTransparency = 1, 
            CurrentCamera = v25.cameraRef
        }, {
            Camera = v4.createElement("Camera", {
                CameraType = Enum.CameraType.Scriptable, 
                FieldOfView = 20, 
                CFrame = v25.cameraCFrameBinding, 
                Focus = v25.cameraFocusBinding, 
                [v4.Ref] = v25.cameraRef
            }), 
            WorldModel = v4.createElement("WorldModel", {
                [v4.Ref] = v25.worldModelRef
            })
        })
    });
end;
v7.didMount = function(v26)
    v26:addCharacterToViewportIfNeeded();
end;
v7.didUpdate = function(v27, _)
    v27:updateCameraAndCharacterPose();
end;
return v7;
