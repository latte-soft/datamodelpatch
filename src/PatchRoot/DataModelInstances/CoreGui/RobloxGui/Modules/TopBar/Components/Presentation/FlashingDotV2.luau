local l_RunService_0 = game:GetService("RunService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_VideoCaptureService_0 = game:GetService("VideoCaptureService");
local l_FaceAnimatorService_0 = game:GetService("FaceAnimatorService");
local v5 = require(l_CorePackages_0.Roact);
local v6 = require(l_CorePackages_0.UIBlox);
local v7 = require(l_CorePackages_0.Packages.t);
local l_ExternalEventConnection_0 = v6.Utility.ExternalEventConnection;
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local l_default_0 = require(l_Modules_0.VoiceChat.VoiceChatServiceManager).default;
local v11 = require(l_Modules_0.Flags.FFlagAvatarChatCoreScriptSupport);
local v12 = require(l_CoreGui_0.RobloxGui.Modules.Settings.cameraDevicePermissionGrantedSignal);
local v13 = require(l_CoreGui_0.RobloxGui.Modules.Flags.getFFlagDoNotPromptCameraPermissionsOnMount);
local v14 = v5.PureComponent:extend("FlashingDot");
local function _(v15, v16, v17)
    return v15 + (v16 - v15) * v17;
end;
v14.validateProps = v7.strictInterface({});
v14.init = function(v19)
    v19:setState({
        Visible = false, 
        isUsingMic = false
    });
    v19.prevTime = 1.5707963267948966;
    v19.prevSinTime = 1;
    local v20, v21 = v5.createBinding(0);
    v19.transparencyBinding = v20;
    v19.updateTransparencyBinding = v21;
    v19.checkNewVisibility = function()
        local v22 = false;
        if l_default_0.localMuted ~= nil then
            v22 = not l_default_0.localMuted;
        end;
        local v23 = l_FaceAnimatorService_0.VideoAnimationEnabled and l_VideoCaptureService_0.Active;
        if v13() then
            v23 = l_FaceAnimatorService_0:IsStarted() and l_FaceAnimatorService_0.VideoAnimationEnabled;
        end;
        local v24 = v22 or v23;
        local v25 = v19.state.Visible ~= v24;
        local v26 = v11 and v19.state.isUsingMic ~= v22;
        if not (not v25 and not v26) then
            v19:setState({
                Visible = v24, 
                isUsingMic = v22
            });
        end;
    end;
    v19.animationConnection = function(v27)
        local v28 = v19.prevTime + v27;
        local v29 = math.sin(v28 * 3);
        v19.updateTransparencyBinding(0.5 + -0.5 * math.abs(v19.prevSinTime));
        v19.prevTime = v28;
        v19.prevSinTime = v29;
    end;
    if v13() then
        v19.teardownCameraPermissionGrantedListener = function()
            if v19.cameraPermissionGrantedListener then
                v19.cameraPermissionGrantedListener:disconnect();
                v19.cameraPermissionGrantedListener = nil;
            end;
        end;
        v19.cameraPermissionGrantedListener = v12:connect(function()
            v19.checkNewVisibility();
        end);
    end;
end;
v14.didMount = function(v30)
    v30.checkNewVisibility();
end;
v14.willUnmount = function(v31)
    if v31.teardownCameraPermissionGrantedListener then
        v31.teardownCameraPermissionGrantedListener();
    end;
end;
v14.render = function(v32)
    local v33 = nil;
    local v34 = UDim2.fromOffset(4, 4);
    if v11 then
        local v35 = l_FaceAnimatorService_0.VideoAnimationEnabled and l_VideoCaptureService_0.Active;
        if v13() then
            v35 = l_FaceAnimatorService_0:IsStarted() and l_FaceAnimatorService_0.VideoAnimationEnabled;
        end;
        if not v32.state.isUsingMic then
            if v35 then
                v33 = "rbxasset://textures/SelfView/SelfView_icon_indicator_off.png";
                v34 = UDim2.fromOffset(12, 12);
            end;
        else
            v33 = "rbxasset://textures/AnimationEditor/FaceCaptureUI/FlashingDot.png";
        end;
    end;
    return v5.createElement("Frame", {
        AnchorPoint = Vector2.new(1, 0), 
        Position = UDim2.new(1, -4, 0, 3), 
        Size = UDim2.fromOffset(4, 4), 
        ZIndex = 2, 
        BorderSizePixel = 0, 
        BackgroundTransparency = 1, 
        Visible = v32.state.Visible
    }, {
        FlashingDot = v5.createElement("ImageLabel", {
            BackgroundTransparency = 1, 
            AnchorPoint = if not v11 then nil else Vector2.new(0.5, 0.5), 
            Position = if not v11 then nil else UDim2.fromScale(0.5, 0.5), 
            Size = v34, 
            Image = not v11 and "rbxasset://textures/AnimationEditor/FaceCaptureUI/FlashingDot.png" or v33, 
            ImageTransparency = v32.transparencyBinding, 
            LayoutOrder = 2
        }), 
        MuteChangedEvent = v5.createElement(l_ExternalEventConnection_0, {
            event = l_default_0.muteChanged.Event, 
            callback = v32.checkNewVisibility
        }), 
        CameraChangedEvent = v5.createElement(l_ExternalEventConnection_0, {
            event = l_FaceAnimatorService_0:GetPropertyChangedSignal("VideoAnimationEnabled"), 
            callback = v32.checkNewVisibility
        }), 
        AnimationConnection = if not v32.state.Visible then nil else v5.createElement(l_ExternalEventConnection_0, {
            event = l_RunService_0.RenderStepped, 
            callback = v32.animationConnection
        })
    });
end;
return v14;
