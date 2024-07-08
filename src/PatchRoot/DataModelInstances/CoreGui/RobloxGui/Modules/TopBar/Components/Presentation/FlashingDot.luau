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
local v11 = require(l_Modules_0.Settings.getCamMicPermissions);
local v12 = require(l_Modules_0.Flags.FFlagAvatarChatCoreScriptSupport);
local v13 = v5.PureComponent:extend("FlashingDot");
local function _(v14, v15, v16)
    return v14 + (v15 - v14) * v16;
end;
v13.validateProps = v7.strictInterface({});
v13.init = function(v18)
    v18:setState({
        Visible = false, 
        isUsingMic = false, 
        hasMicPermissions = false, 
        hasCameraPermissions = false
    });
    v18.prevTime = 1.5707963267948966;
    v18.prevSinTime = 1;
    local v19, v20 = v5.createBinding(0);
    v18.transparencyBinding = v19;
    v18.updateTransparencyBinding = v20;
    v18.checkNewVisibility = function()
        local l_hasMicPermissions_0 = v18.state.hasMicPermissions;
        if l_hasMicPermissions_0 then
            l_hasMicPermissions_0 = false;
            if l_default_0.localMuted ~= nil then
                l_hasMicPermissions_0 = not l_default_0.localMuted;
            end;
        end;
        local v22 = l_hasMicPermissions_0 or (v18.state.hasCameraPermissions and l_FaceAnimatorService_0.VideoAnimationEnabled) and l_VideoCaptureService_0.Active;
        local v23 = v18.state.Visible ~= v22;
        local v24 = v12 and v18.state.isUsingMic ~= l_hasMicPermissions_0;
        if not (not v23 and not v24) then
            v18:setState({
                Visible = v22, 
                isUsingMic = l_hasMicPermissions_0
            });
        end;
    end;
    v18.animationConnection = function(v25)
        local v26 = v18.prevTime + v25;
        local v27 = math.sin(v26 * 3);
        v18.updateTransparencyBinding(0.5 + -0.5 * math.abs(v18.prevSinTime));
        v18.prevTime = v26;
        v18.prevSinTime = v27;
    end;
end;
v13.didMount = function(v28)
    v28.isMounted = true;
    v11(function(v29)
        if v28.isMounted then
            v28:setState({
                hasCameraPermissions = v29.hasCameraPermissions, 
                hasMicPermissions = v29.hasMicPermissions
            });
            return ;
        else
            return ;
        end;
    end, nil, nil, "FlashingDot.didMount");
    v28.checkNewVisibility();
end;
v13.didUpdate = function(v30, v31, _)
    if not (v30.state.hasMicPermissions == v31.hasMicPermissions) or v30.state.hasCameraPermissions ~= v31.hasCameraPermissions then
        v30.checkNewVisibility();
    end;
end;
v13.render = function(v33)
    local v34 = nil;
    local v35 = UDim2.fromOffset(4, 4);
    if v12 then
        local v36 = (v33.state.hasCameraPermissions and l_FaceAnimatorService_0.VideoAnimationEnabled) and l_VideoCaptureService_0.Active;
        if not v33.state.isUsingMic then
            if v36 then
                v34 = "rbxasset://textures/SelfView/SelfView_icon_indicator_off.png";
                v35 = UDim2.fromOffset(12, 12);
            end;
        else
            v34 = "rbxasset://textures/AnimationEditor/FaceCaptureUI/FlashingDot.png";
        end;
    end;
    return v5.createElement("Frame", {
        AnchorPoint = Vector2.new(1, 0), 
        Position = UDim2.new(1, -4, 0, 3), 
        Size = UDim2.fromOffset(4, 4), 
        ZIndex = 2, 
        BorderSizePixel = 0, 
        BackgroundTransparency = 1, 
        Visible = v33.state.Visible
    }, {
        FlashingDot = v5.createElement("ImageLabel", {
            BackgroundTransparency = 1, 
            AnchorPoint = if not v12 then nil else Vector2.new(0.5, 0.5), 
            Position = if not v12 then nil else UDim2.fromScale(0.5, 0.5), 
            Size = v35, 
            Image = not v12 and "rbxasset://textures/AnimationEditor/FaceCaptureUI/FlashingDot.png" or v34, 
            ImageTransparency = v33.transparencyBinding, 
            LayoutOrder = 2
        }), 
        MuteChangedEvent = v5.createElement(l_ExternalEventConnection_0, {
            event = l_default_0.muteChanged.Event, 
            callback = v33.checkNewVisibility
        }), 
        CameraChangedEvent = v5.createElement(l_ExternalEventConnection_0, {
            event = l_FaceAnimatorService_0:GetPropertyChangedSignal("VideoAnimationEnabled"), 
            callback = v33.checkNewVisibility
        }), 
        AnimationConnection = if not v33.state.Visible then nil else v5.createElement(l_ExternalEventConnection_0, {
            event = l_RunService_0.RenderStepped, 
            callback = v33.animationConnection
        })
    });
end;
v13.willUnmount = function(v37)
    v37.isMounted = false;
end;
return v13;
