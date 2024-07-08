local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_FaceAnimatorService_0 = game:GetService("FaceAnimatorService");
local l_HttpService_0 = game:GetService("HttpService");
local v4 = require(l_CorePackages_0.Packages.Roact);
local v5 = require(l_CorePackages_0.Packages.RoactRodux);
local v6 = require(l_CorePackages_0.Packages.t);
local v7 = require(l_CorePackages_0.UIBlox);
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.PermissionsProtocol).PermissionsProtocol.default;
local l_ExternalEventConnection_0 = v7.Utility.ExternalEventConnection;
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v12 = require(script.Parent.ControlBubbleV2);
local l_default_1 = require(l_Modules_0.VoiceChat.VoiceChatServiceManager).default;
local v14 = require(l_Modules_0.InGameChat.BubbleChat.Constants);
local v15 = require(l_Modules_0.SelfView.publicApi);
local v16 = require(l_Modules_0.SelfView.toggleSelfViewSignal);
local v17 = require(l_Modules_0.SelfView.Analytics).new();
local v18 = require(l_Modules_0.Flags.GetFFlagLocalMutedNilFix);
local v19 = require(l_Modules_0.VoiceChat.Constants);
local v20 = require(l_RobloxGui_0.Modules.Settings.getCamMicPermissions);
local v21 = require(l_RobloxGui_0.Modules.Settings.isCamEnabledForUserAndPlace);
local v22 = require(l_RobloxGui_0.Modules.InGameChat.BubbleChat.Helpers.displayCameraDeniedToast);
local v23 = require(l_RobloxGui_0.Modules.Settings.isCameraOnlyUser);
local v24 = require(l_RobloxGui_0.Modules.Flags.getFFlagDoNotPromptCameraPermissionsOnMount);
local v25 = require(l_RobloxGui_0.Modules.Flags.getFFlagEnableAlwaysAvailableCamera);
local v26 = require(l_RobloxGui_0.Modules.Flags.getFFlagLegacyConnectingMicStateFix);
local l_AVATAR_CHAT_UI_SETTINGS_0 = v14.AVATAR_CHAT_UI_SETTINGS;
local v28 = v4.PureComponent:extend("ControlsBubble");
v28.validateProps = v6.strictInterface({
    chatSettings = v6.table, 
    isInsideMaximizeDistance = v6.boolean, 
    isLocalPlayer = v6.boolean, 
    LayoutOrder = v6.optional(v6.number), 
    hasCameraPermissions = v6.boolean, 
    hasMicPermissions = v6.boolean, 
    isShowingDueToEasierUnmuting = v6.optional(v6.boolean)
});
v28.defaultProps = {
    LayoutOrder = 1
};
v28.init = function(v29)
    v29:setState({
        microphoneEnabled = if not v18 then not l_default_1.localMuted else l_default_1.localMuted == false, 
        cameraEnabled = (not not l_FaceAnimatorService_0 and l_FaceAnimatorService_0:IsStarted()) and l_FaceAnimatorService_0.VideoAnimationEnabled
    });
    v29.toggleMic = function()
        if not v29.props.isLocalPlayer then
            l_default_1:ToggleMutePlayer(tonumber(v29.props.userId), if not v29.props.isShowingDueToEasierUnmuting then v19.VOICE_CONTEXT_TYPE.BUBBLE_CHAT else v19.VOICE_CONTEXT_TYPE.EASIER_UNMUTING);
            return ;
        elseif v29.props.hasMicPermissions then
            if v29.props.voiceState == v14.VOICE_STATE.ERROR then
                l_default_1:RejoinPreviousChannel();
                return ;
            elseif v29.props.voiceState == v14.VOICE_STATE.CONNECTING then
                l_default_1:ShowVoiceChatLoadingMessage();
                return ;
            else
                v17:setLastCtx("bubbleChatToggle");
                l_default_1:ToggleMic("LegacyBubbleChatToggle");
                v29:setState({
                    microphoneEnabled = not l_default_1.localMuted
                });
                return ;
            end;
        else
            return ;
        end;
    end;
    v29.updateVideo = function()
        v29:setState({
            cameraEnabled = l_FaceAnimatorService_0.VideoAnimationEnabled
        });
    end;
    v29.onVideoButtonPressed = function()
        if not v24() or v29.props.hasCameraPermissions then
            v29:toggleVideo();
            return ;
        else
            v20(function(v30)
                if not v30.hasCameraPermissions then
                    v22();
                    return ;
                else
                    v29:toggleVideo();
                    v29.props.setCameraPermissionStateFromControl(v30.hasCameraPermissions);
                    return ;
                end;
            end, {
                l_default_0.Permissions.CAMERA_ACCESS
            });
            return ;
        end;
    end;
    v29.toggleVideo = function()
        if v24() or v29.props.hasCameraPermissions then
            if l_FaceAnimatorService_0 and l_FaceAnimatorService_0:IsStarted() then
                l_FaceAnimatorService_0.VideoAnimationEnabled = not l_FaceAnimatorService_0.VideoAnimationEnabled;
                v17:setLastCtx("bubbleChatToggle");
                v29:setState({
                    cameraEnabled = l_FaceAnimatorService_0.VideoAnimationEnabled
                });
                local v31 = v15.getSelfViewIsOpenAndVisible();
                if not (not l_FaceAnimatorService_0.VideoAnimationEnabled or v31) then
                    v16:fire();
                end;
                return ;
            else
                return ;
            end;
        else
            return ;
        end;
    end;
    v29.muteChangedEvent = function(v32)
        v29:setState({
            microphoneEnabled = not v32
        });
    end;
end;
v28.shouldShowCameraIndicator = function(v33)
    if not v33.props.isLocalPlayer or not v33:getCameraButtonVisibleAtMount() then
        return false;
    else
        return true;
    end;
end;
v28.shouldShowMicOffIndicator = function(v34)
    if v34.props.isLocalPlayer then
        local v35 = nil;
        v35 = if not v26() then not (v34.state.microphoneEnabled and v34.props.hasMicPermissions) else not v34.props.hasMicPermissions;
        local v36 = true;
        if v34.props.voiceState ~= v14.VOICE_STATE.MUTED then
            v36 = v34.props.voiceState == v14.VOICE_STATE.LOCAL_MUTED;
        end;
        if not (not v35 and not v36) then
            return true;
        end;
    end;
    return false;
end;
v28.getCameraButtonVisibleAtMount = function(_)
    if not v25() or not v23() then
        return v21();
    else
        return false;
    end;
end;
v28.render = function(v38)
    local v39 = v38.props.hasMicPermissions and v38.props.voiceEnabled;
    local v40 = v38:shouldShowCameraIndicator();
    local v41 = v38:shouldShowMicOffIndicator();
    local v42 = v40 and v39;
    local l_chatSettings_0 = v38.props.chatSettings;
    local v44 = not not v42 and l_AVATAR_CHAT_UI_SETTINGS_0.DoubleIconCornerRadiusOffset or l_AVATAR_CHAT_UI_SETTINGS_0.SingleIconCornerRadiusOffset;
    local v45 = not not v42 and l_AVATAR_CHAT_UI_SETTINGS_0.DoubleIconButtonSize or l_AVATAR_CHAT_UI_SETTINGS_0.SingleIconButtonSize;
    local v46 = not v38.props.isLocalPlayer and "speaker" or "microphone";
    local v47 = (not not v38.state.cameraEnabled and v38.props.hasCameraPermissions) and "icons/controls/voice/video_on_light" or "icons/controls/voice/video_off_light";
    if v24() then
        v47 = (not not v38.state.cameraEnabled and v38:getCameraButtonVisibleAtMount()) and "icons/controls/voice/video_on_light" or "icons/controls/voice/video_off_light";
    end;
    return v4.createElement("Frame", {
        AnchorPoint = Vector2.new(0.5, 1), 
        Position = UDim2.new(0.5, 0, 1, -8), 
        AutomaticSize = Enum.AutomaticSize.X, 
        Size = UDim2.fromOffset(0, l_AVATAR_CHAT_UI_SETTINGS_0.FrameHeight), 
        LayoutOrder = v38.props.LayoutOrder, 
        BackgroundTransparency = l_chatSettings_0.BackgroundTransparency, 
        BackgroundColor3 = l_chatSettings_0.BackgroundColor3, 
        Visible = v39 or v40
    }, {
        Scale = v4.createElement("UIScale", {
            Scale = v38.props.isInsideMaximizeDistance and 1 or 0.75
        }), 
        UICorner = v4.createElement("UICorner", {
            CornerRadius = UDim.new(0, v44)
        }), 
        Container = v4.createElement("Frame", {
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = 1
        }, {
            UICorner = l_chatSettings_0.CornerEnabled and v4.createElement("UICorner", {
                CornerRadius = UDim.new(0, v44)
            }), 
            UIListLayout = v4.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }), 
            MicrophoneBubble = v39 and v4.createElement(v12, {
                LayoutOrder = 1, 
                onActivated = v38.toggleMic, 
                chatSettings = l_chatSettings_0, 
                controlBubbleSize = v45, 
                cornerRadiusOffset = v44, 
                iconAssetName = if not v41 then nil else "icons/controls/voice/microphone_off_light", 
                iconSize = l_AVATAR_CHAT_UI_SETTINGS_0.IconSize, 
                iconTransparency = l_AVATAR_CHAT_UI_SETTINGS_0.IconTransparency, 
                voiceState = v38.props.voiceState, 
                renderStepName = l_HttpService_0:GenerateGUID(), 
                iconStyle = v46
            }), 
            Divider = (v39 and v40) and v4.createElement("Frame", {
                Size = l_AVATAR_CHAT_UI_SETTINGS_0.DividerSize, 
                AnchorPoint = Vector2.new(0.5, 1), 
                BorderSizePixel = 0, 
                LayoutOrder = 2, 
                ZIndex = 1, 
                BackgroundColor3 = l_AVATAR_CHAT_UI_SETTINGS_0.DividerColor
            }), 
            CameraBubble = v40 and v4.createElement(v12, {
                LayoutOrder = 3, 
                onActivated = not not v24() and v38.onVideoButtonPressed or v38.toggleVideo, 
                chatSettings = l_chatSettings_0, 
                cornerRadiusOffset = v44, 
                controlBubbleSize = v45, 
                iconAssetName = v47, 
                iconSize = l_AVATAR_CHAT_UI_SETTINGS_0.IconSize, 
                iconTransparency = l_AVATAR_CHAT_UI_SETTINGS_0.IconTransparency, 
                iconStyle = v46
            })
        }), 
        Carat = l_chatSettings_0.TailVisible and v4.createElement("ImageLabel", {
            LayoutOrder = 3, 
            AnchorPoint = Vector2.new(0.5, 0), 
            BackgroundTransparency = 1, 
            Position = UDim2.new(0.5, 0, 1, -1), 
            Size = UDim2.fromOffset(12, 8), 
            Image = "rbxasset://textures/ui/InGameChat/Caret.png", 
            ImageColor3 = l_chatSettings_0.BackgroundColor3, 
            ImageTransparency = l_chatSettings_0.BackgroundTransparency
        }), 
        MuteChangedEvent = v4.createElement(l_ExternalEventConnection_0, {
            event = l_default_1.muteChanged.Event, 
            callback = v38.muteChangedEvent
        }), 
        VideoEnabledChanged = not not l_FaceAnimatorService_0 and v4.createElement(l_ExternalEventConnection_0, {
            event = l_FaceAnimatorService_0:GetPropertyChangedSignal("VideoAnimationEnabled"), 
            callback = v38.updateVideo
        }) or nil
    });
end;
return v5.connect(function(v48, v49)
    return {
        voiceState = v48.voiceState[v49.userId]
    };
end)(v28);
