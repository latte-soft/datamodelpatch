local l_AnimationClipProvider_0 = game:GetService("AnimationClipProvider");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_GuiService_0 = game:GetService("GuiService");
local l_Players_0 = game:GetService("Players");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_RunService_0 = game:GetService("RunService");
local v8 = require(l_CorePackages_0.Roact);
local v9 = require(l_CorePackages_0.Packages.t);
local v10 = require(l_CorePackages_0.UIBlox);
local l_ShimmerPanel_0 = v10.App.Loading.ShimmerPanel;
local l_EmptyState_0 = v10.App.Indicator.EmptyState;
local l_IconButton_0 = v10.App.Button.IconButton;
local l_IconSize_0 = v10.App.ImageSet.Enum.IconSize;
local l_Button_0 = v10.App.Button.Button;
local l_ButtonType_0 = v10.App.Button.Enum.ButtonType;
local l_StandardButtonSize_0 = v10.App.Button.Enum.StandardButtonSize;
local l_ShortcutBar_0 = v10.App.Navigation.ShortcutBar;
local l_InputType_0 = v10.Core.Enums.InputType;
local l_getInputGroup_0 = require(l_CorePackages_0.Workspace.Packages.InputType).getInputGroup;
local l_ExternalEventConnection_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).ExternalEventConnection;
local l_InputTypeConstants_0 = require(l_CorePackages_0.Workspace.Packages.InputType).InputTypeConstants;
local l_GamepadUtils_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Utils.GamepadUtils;
local v24 = require(l_CoreGui_0:WaitForChild("RobloxGui").Modules.RobloxTranslator);
local v25 = require(script.Parent.InteractionFrame);
local v26 = require(script.Parent.Parent.Parent.Constants);
local l_Images_0 = v10.App.ImageSet.Images;
local v28 = l_Images_0["icons/actions/previewShrink"];
local l_FFlagUIBloxUseInputResponsiveShortcutBarChanges_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).UIBlox.FFlagUIBloxUseInputResponsiveShortcutBarChanges;
local v30 = require(script.Parent.Parent.Parent.FFlagPublishAvatarPromptEnabled);
local v31 = Vector3.new(0, 1, 0);
local v32 = Vector3.new(1, 0, 0);
local v33 = {
    LOADING = "loading", 
    SUCCESSFULLY_LOADED = "successfullyLoaded", 
    FAILED_TO_LOAD = "failedToLoad"
};
local v34 = v8.PureComponent:extend("PreviewViewport");
v34.validateProps = v9.strictInterface({
    asset = v9.union(v9.instanceOf("Model"), v9.instanceIsA("AnimationClip")), 
    closePreviewView = v9.callback
});
local function _(v35)
    return l_getInputGroup_0(v35) == l_InputTypeConstants_0.Gamepad;
end;
v34.init = function(v37)
    v37:setState({
        loadingState = v33.LOADING, 
        isGamepad = l_getInputGroup_0((l_UserInputService_0:GetLastInputType())) == l_InputTypeConstants_0.Gamepad
    });
    v37.ref = v8.createRef();
    v37.zoomFactor = 1;
    v37.cameraDegreesAngle = Vector2.new(0, 0);
    v37.cameraPanInPixels = Vector2.new(0, 0);
    v37.cameraRef = v8.createRef();
    v37.worldModelRef = v8.createRef();
    local v38, v39 = v8.createBinding(CFrame.new());
    v37.cameraCFrameBinding = v38;
    v37.updateCameraCFrameBinding = v39;
    v38, v39 = v8.createBinding(CFrame.new());
    v37.cameraFocusBinding = v38;
    v37.updateCameraFocusBinding = v39;
    v37.panByPixels = function(v40)
        v37.cameraPanInPixels = v37.cameraPanInPixels + v40;
        v37:clampOffsets();
        v37:updateCameraPosition();
    end;
    v37.rotateByPixels = function(v41)
        v37.cameraDegreesAngle = Vector2.new(v37.cameraDegreesAngle.X - v41.Y, v37.cameraDegreesAngle.Y - v41.X);
        v37:clampOffsets();
        v37:updateCameraPosition();
    end;
    v37.storeInput = function(_, v43, v44)
        v37.inputState = v43;
        v37.inputObject = v44;
        return Enum.ContextActionResult.Sink;
    end;
    v37.rotateByRadians = function(v45)
        if v37.model:FindFirstChild("HumanoidRootPart") then
            v37.cameraDegreesAngle = Vector2.new(v37.cameraDegreesAngle.X % 360, (v37.cameraDegreesAngle.Y + (-v45 * 180) / 3.141592653589793) % 360);
            v37:updateCameraPosition();
            return ;
        else
            return ;
        end;
    end;
    v37.setAngularVelocityByPixels = function(_)
    end;
    v37.zoomToPoint = function(v47, v48)
        local v49 = 0.9 ^ v47;
        local v50 = v37.zoomFactor * v49;
        if v50 ~= math.clamp(v50, 0.3, 10) then
            return ;
        else
            v37.zoomFactor = v50;
            if not (v30 and not v48) then
                local v51 = ((v48 - (v37.absolutePosition + v37.absoluteSize / 2)) * Vector2.new(1, -1)) * -1;
                v37.cameraPanInPixels = v51 - (v51 - v37.cameraPanInPixels) * v49;
            end;
            v37:clampOffsets();
            v37:updateCameraPosition();
            return ;
        end;
    end;
    v37.onRetryLoading = function()
        v37:processAsset();
    end;
end;
v34.setLoadingState = function(v52, v53)
    v52:setState({
        loadingState = v53
    });
end;
v34.clampOffsets = function(v54)
    v54.zoomFactor = math.clamp(v54.zoomFactor, 0.3, 10);
    local v55 = -80;
    if not (not v54.props.asset or not v54.props.asset:IsA("AnimationClip")) then
        v55 = v54:angleToMakeBasePlateParallel();
    end;
    v54.cameraDegreesAngle = Vector2.new(math.clamp(v54.cameraDegreesAngle.X, v55, 80), v54.cameraDegreesAngle.Y);
    local v56 = math.max(((v54.zoomFactor * v54.modelExtentsSize.X) / 2) / v54:pointsToPixelsFactor(), v54.absoluteSize.X / 2);
    local v57 = math.max(((v54.zoomFactor * v54.modelExtentsSize.Y) / 2) / v54:pointsToPixelsFactor(), v54.absoluteSize.Y / 2);
    v54.cameraPanInPixels = Vector2.new(math.clamp(v54.cameraPanInPixels.X, -v56, v56), (math.clamp(v54.cameraPanInPixels.Y, -v57, v57)));
end;
v34.angleToMakeBasePlateParallel = function(v58)
    return -math.deg((math.asin((math.clamp((v58.modelExtentsSize.Y / 2 + (v58:pointsToPixelsFactor() / v58.zoomFactor) * v58.cameraPanInPixels.Y) / (v58.cameraDistance / v58.zoomFactor), -0.99, 0.99)))));
end;
v34.processAsset = function(v59)
    local l_asset_0 = v59.props.asset;
    if l_asset_0 then
        if not l_asset_0:IsA("AnimationClip") then
            if l_asset_0:IsA("Model") then
                v59.model = l_asset_0:Clone();
                v59.model.Parent = nil;
                v59:addModelToViewportIfNeeded();
                v59:setLoadingState(v33.SUCCESSFULLY_LOADED);
            end;
            return ;
        else
            v59:setLoadingState(v33.LOADING);
            task.spawn(function()
                local l_status_0, l_result_0 = pcall(function()
                    return (l_Players_0:GetHumanoidDescriptionFromOutfitId(1342485078));
                end);
                local v63 = nil;
                if l_status_0 then
                    v63 = l_Players_0:CreateHumanoidModelFromDescription(l_result_0, Enum.HumanoidRigType.R15);
                end;
                if not v59.isMounted or l_asset_0 ~= v59.props.asset then
                    return ;
                elseif v63 then
                    v59.model = v63;
                    v59:addModelToViewportIfNeeded();
                    local v64 = l_AnimationClipProvider_0:RegisterActiveAnimationClip(l_asset_0);
                    v59.animation = Instance.new("Animation");
                    v59.animation.AnimationId = v64;
                    local l_Humanoid_0 = v59.model:FindFirstChildWhichIsA("Humanoid");
                    if l_Humanoid_0 then
                        l_Humanoid_0:LoadAnimation(v59.animation):Play();
                    end;
                    v59:setLoadingState(v33.SUCCESSFULLY_LOADED);
                    return ;
                else
                    v59:setLoadingState(v33.FAILED_TO_LOAD);
                    return ;
                end;
            end);
            return ;
        end;
    else
        return ;
    end;
end;
v34.addModelToViewportIfNeeded = function(v66)
    if v66.model ~= nil and v66.model.Parent ~= nil then
        return ;
    else
        if v66.worldModelRef:getValue() and v66.model ~= nil then
            v66.model.Parent = v66.worldModelRef:getValue();
            v66:resetCameraPosition();
            if not (not v66.props.asset or not v66.props.asset:IsA("AnimationClip")) then
                v66.baseplate = Instance.new("Part");
                v66.baseplate.Size = Vector3.new(8, 0.5, 8);
                v66.baseplate.Transparency = 0.6;
                v66.baseplate.Parent = v66.worldModelRef:getValue();
                v66.baseplate.Position = (v66.modelCFrame.Position + Vector3.new(0, -v66.modelExtentsSize.Y / 2, 0)) + Vector3.new(0, -0.25, 0);
            end;
        end;
        return ;
    end;
end;
local function _(v67, v68)
    return (math.max(v68.X, v68.Y) / 2) * (1 / math.tan(math.rad(v67) / 2)) + v68.Z / 2;
end;
local function _(v70, v71, v72)
    return CFrame.fromAxisAngle(v72, v71):VectorToWorldSpace(v70);
end;
v34.resetCameraPosition = function(v74)
    if v74.model then
        v74.modelCFrame = v74.model:GetModelCFrame();
        v74.initialLookVector = v74.modelCFrame.lookVector;
        local l_HumanoidRootPart_0 = v74.model:FindFirstChild("HumanoidRootPart");
        if l_HumanoidRootPart_0 then
            v74.initialLookVector = l_HumanoidRootPart_0.CFrame.lookVector;
        end;
        v74.modelExtentsSize = v74.model:GetExtentsSize();
        local l_modelExtentsSize_0 = v74.modelExtentsSize;
        v74.cameraDistance = (math.max(l_modelExtentsSize_0.X, l_modelExtentsSize_0.Y) / 2) * 3.7320508075688776 + l_modelExtentsSize_0.Z / 2;
        if not v74.props.asset or not v74.props.asset:IsA("AnimationClip") then
            v74.cameraDegreesAngle = Vector2.new(5, 20);
            v74.zoomFactor = 1;
        else
            v74.cameraDegreesAngle = Vector2.new(0, 0);
            v74.zoomFactor = 0.75;
        end;
        v74.cameraPanInPixels = Vector2.new(0, 0);
        v74:updateCameraPosition();
        return ;
    else
        return ;
    end;
end;
v34.pointsToPixelsFactor = function(v77)
    if not (((v77.absoluteSize ~= nil and v77.modelExtentsSize ~= nil) and v77.absoluteSize.Y ~= 0) and v77.modelExtentsSize.Y ~= 0) or v77.modelExtentsSize.X == 0 then
        return 1;
    else
        return math.max(v77.modelExtentsSize.X, v77.modelExtentsSize.Y) / v77.absoluteSize.Y;
    end;
end;
v34.updateCameraPosition = function(v78)
    if not (v78.absoluteSize ~= nil) or v78.cameraDistance == nil then
        return ;
    else
        local v79 = CFrame.new(v78.modelCFrame.p + CFrame.fromAxisAngle(v31, (math.rad(v78.cameraDegreesAngle.Y))):VectorToWorldSpace((CFrame.fromAxisAngle(v32, (math.rad(v78.cameraDegreesAngle.X))):VectorToWorldSpace(v78.initialLookVector))) * (v78.cameraDistance / v78.zoomFactor), v78.modelCFrame.p);
        local v80 = v78:pointsToPixelsFactor() / v78.zoomFactor;
        v78.updateCameraCFrameBinding((v79 + (v79.UpVector * v80) * v78.cameraPanInPixels.Y) + (v79.RightVector * v80) * v78.cameraPanInPixels.X);
        v78.updateCameraFocusBinding(v78.modelCFrame);
        return ;
    end;
end;
local v81 = {
    resetViewButtonText = v24:FormatByKey("CoreScripts.AssetPreviewView.Action.ResetView"), 
    loadingFailedText = v24:FormatByKey("CoreScripts.AssetPreviewView.Label.LoadingFailed")
};
v34.render = function(v82)
    local l_loadingState_0 = v82.state.loadingState;
    local v84 = {
        {
            icon = {
                [l_InputType_0.MouseAndKeyboard] = l_Images_0["icons/controls/mouse/scroll"], 
                [l_InputType_0.Gamepad] = l_Images_0["icons/controls/keys/xboxRSVertical"]
            }, 
            text = "Zoom"
        }, 
        {
            icon = {
                [l_InputType_0.MouseAndKeyboard] = l_Images_0["icons/controls/mouse/clickLeft"], 
                [l_InputType_0.Gamepad] = l_Images_0["icons/controls/keys/xboxRSHorizontal"]
            }, 
            text = "Rotate"
        }, 
        {
            icon = {
                [l_InputType_0.MouseAndKeyboard] = l_Images_0["icons/controls/mouse/clickRight"]
            }, 
            text = "Pan"
        }, 
        {
            icon = {
                [l_InputType_0.Gamepad] = l_Images_0["icons/controls/keys/xboxY"]
            }, 
            text = "Reset View"
        }, 
        {
            icon = {
                [l_InputType_0.Gamepad] = l_Images_0["icons/controls/keys/xboxB"]
            }, 
            text = "Close"
        }
    };
    local l_createElement_0 = v8.createElement;
    local v86 = "Frame";
    local v89 = {
        BackgroundTransparency = 1, 
        Size = UDim2.fromScale(1, 1), 
        Position = UDim2.fromScale(0.5, 0.5), 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        [v8.Ref] = v82.ref, 
        [v8.Change.AbsoluteSize] = function(v87)
            v82.absoluteSize = v87.AbsoluteSize;
            v82:updateCameraPosition();
        end, 
        [v8.Change.AbsolutePosition] = function(v88)
            v82.absolutePosition = v88.absolutePosition + l_GuiService_0:GetGuiInset();
        end
    };
    local v91 = {
        LastInputTypeConnection = v8.createElement(l_ExternalEventConnection_0, {
            event = l_UserInputService_0.LastInputTypeChanged, 
            callback = function(v90)
                v82:setState({
                    isGamepad = l_getInputGroup_0(v90) == l_InputTypeConstants_0.Gamepad
                });
            end
        }) or nil
    };
    local v92 = false;
    if l_loadingState_0 == v33.SUCCESSFULLY_LOADED then
        v92 = not v82.state.isGamepad and v8.createElement(l_Button_0, {
            buttonType = l_ButtonType_0.PrimarySystem, 
            standardSize = l_StandardButtonSize_0.XSmall, 
            position = UDim2.new(0, 20, 1, -20), 
            anchorPoint = Vector2.new(0, 1), 
            text = v81.resetViewButtonText, 
            onActivated = function()
                v82:resetCameraPosition();
            end
        });
    end;
    v91.ResetViewButton = v92;
    v91.ShrinkPreviewButton = if not not v30 and v82.state.isGamepad then nil else v8.createElement(l_IconButton_0, {
        position = UDim2.new(1, -20, 1, -20), 
        anchorPoint = Vector2.new(1, 1), 
        icon = v28, 
        iconSize = l_IconSize_0.Medium, 
        onActivated = function()
            v82.props.closePreviewView();
        end
    });
    v91.TooltipHint = if (not not l_FFlagUIBloxUseInputResponsiveShortcutBarChanges_0 and v30) and v82.props.asset:IsA("Model") then v8.createElement(l_ShortcutBar_0, {
        position = UDim2.fromScale(0.5, 0.9), 
        anchorPoint = Vector2.new(0.5, 1), 
        transitionDelaySeconds = 2, 
        items = v84
    }) else nil;
    v92 = false;
    if l_loadingState_0 == v33.LOADING then
        v92 = v8.createElement(l_ShimmerPanel_0, {
            Size = UDim2.fromScale(1, 1), 
            Position = UDim2.fromScale(0.5, 0.5), 
            AnchorPoint = Vector2.new(0.5, 0.5)
        });
    end;
    v91.ShimmerFrame = v92;
    v92 = false;
    if l_loadingState_0 == v33.FAILED_TO_LOAD then
        v92 = v8.createElement(l_EmptyState_0, {
            text = v81.loadingFailedText, 
            size = UDim2.fromScale(1, 1), 
            onActivated = v82.onRetryLoading
        });
    end;
    v91.LoadingFailed = v92;
    v91.InteractionFrame = v8.createElement(v25, {
        ZIndex = -1, 
        Size = UDim2.fromScale(1, 1), 
        Visible = l_loadingState_0 == v33.SUCCESSFULLY_LOADED, 
        panByPixels = v82.panByPixels, 
        rotateByPixels = v82.rotateByPixels, 
        setAngularVelocityByPixels = v82.setAngularVelocityByPixels, 
        zoomToPoint = v82.zoomToPoint
    }, {
        ViewportFrame = v8.createElement("ViewportFrame", {
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(1, 1), 
            Position = UDim2.fromScale(0.5, 0.5), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            LightColor = v26.ViewportLightColor, 
            Ambient = v26.ViewportLightAmbient, 
            LightDirection = v26.ViewportLightDirection, 
            CurrentCamera = v82.cameraRef
        }, {
            Camera = v8.createElement("Camera", {
                CameraType = Enum.CameraType.Scriptable, 
                FieldOfView = 30, 
                CFrame = v82.cameraCFrameBinding, 
                Focus = v82.cameraFocusBinding, 
                [v8.Ref] = v82.cameraRef
            }), 
            WorldModel = v8.createElement("WorldModel", {
                [v8.Ref] = v82.worldModelRef
            })
        })
    });
    return l_createElement_0(v86, v89, v91);
end;
v34.setUpGamepad = function(v93)
    l_ContextActionService_0:UnbindCoreAction("PreviewViewportClose");
    l_ContextActionService_0:UnbindCoreAction("PreviewViewportReset");
    l_ContextActionService_0:UnbindCoreAction("PreviewViewportRotateAndZoom");
    l_ContextActionService_0:BindCoreAction("PreviewViewportClose", v93.props.closePreviewView, false, Enum.KeyCode.ButtonB);
    l_ContextActionService_0:BindCoreAction("PreviewViewportReset", function()
        v93:resetCameraPosition();
    end, false, Enum.KeyCode.ButtonY);
    l_ContextActionService_0:BindCoreAction("PreviewViewportRotateAndZoom", v93.storeInput, false, Enum.KeyCode.Thumbstick2);
    v93.gamePadConnection = l_RunService_0.RenderStepped:Connect(function(v94)
        if not (not (v93.inputState == Enum.UserInputState.Change) or not v93.inputObject) then
            l_GamepadUtils_0.rotateAndZoom(v93.inputObject, v94, v93.setAngularVelocityByPixels, v93.rotateByRadians, v93.zoomToPoint);
        end;
    end);
end;
v34.didMount = function(v95)
    local l_l_GuiService_0_GuiInset_0 = l_GuiService_0:GetGuiInset();
    v95.isMounted = true;
    v95.absolutePosition = v95.ref.current.AbsolutePosition + l_l_GuiService_0_GuiInset_0;
    v95:processAsset();
    if v30 then
        v95:setUpGamepad();
    end;
end;
v34.cleanupGamepad = function(v97)
    l_ContextActionService_0:UnbindCoreAction("PreviewViewportClose");
    l_ContextActionService_0:UnbindCoreAction("PreviewViewportReset");
    l_ContextActionService_0:UnbindCoreAction("PreviewViewportRotateAndZoom");
    if v97.gamePadConnection then
        v97.gamePadConnection:Disconnect();
    end;
end;
v34.willUnmount = function(v98)
    v98.isMounted = false;
    if v30 then
        v98:cleanupGamepad();
    end;
end;
v34.didUpdate = function(v99, v100)
    if v99.props.asset ~= v100.asset then
        if v99.model ~= nil then
            v99.model.Parent = nil;
            v99.model = nil;
        end;
        if v99.baseplate ~= nil then
            v99.baseplate.Parent = nil;
            v99.baseplate:Destroy();
        end;
        v99:processAsset();
    end;
end;
return v34;
