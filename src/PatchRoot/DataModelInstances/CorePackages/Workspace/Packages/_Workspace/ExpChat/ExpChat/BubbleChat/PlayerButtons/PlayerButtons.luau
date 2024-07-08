local l_FaceAnimatorService_0 = game:GetService("FaceAnimatorService");
local l_HttpService_0 = game:GetService("HttpService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v4 = require(l_Parent_0.Roact);
local v5 = require(l_Parent_0.RoactRodux);
local v6 = require(l_Parent_0.UIBlox);
local l_Dictionary_0 = require(l_Parent_0.llama).Dictionary;
local l_ExternalEventConnection_0 = v6.Utility.ExternalEventConnection;
local v9 = require(l_script_FirstAncestor_0.Config);
local l_AvatarChatUISettings_0 = v9.AvatarChatUISettings;
local l_Permissions_0 = v9.Permissions;
local v12 = require(l_script_FirstAncestor_0.GlobalFlags);
local v13 = require(script.Parent.ControlBubble);
local v14 = require(l_script_FirstAncestor_0.Flags.GetFFlagVoiceTCSBubbleClickState);
local v15 = game:DefineFastFlag("PreventMicToggleIfGameConsumedEvent", false);
local v16 = v4.PureComponent:extend("PlayerButtons");
v16.defaultProps = {
    LayoutOrder = 1
};
v16.init = function(v17)
    v17:setState({
        cameraEnabled = (not not l_FaceAnimatorService_0 and l_FaceAnimatorService_0:IsStarted()) and l_FaceAnimatorService_0.VideoAnimationEnabled
    });
    v17.toggleMic = function(v18)
        if not v15 or not v18 then
            if not v14() then
                v17.props.onClickedVoiceIndicator(v17.props.userId);
                return ;
            else
                v17.props.onClickedVoiceIndicator(v17.props.userId, v17.props.voiceState);
                return ;
            end;
        else
            return ;
        end;
    end;
    v17.onVideoButtonPressed = function()
        if not v12.DoNotPromptCameraPermissionsOnMount or v17.props.hasCameraPermissions then
            v17:toggleVideo();
        else
            local function v21(v19, _)
                if not v19 then
                    if v17.props.displayCameraDeniedToast then
                        v17.props.displayCameraDeniedToast();
                    end;
                else
                    v17:toggleVideo();
                    if v17.props.setCameraPermissionStateFromControl then
                        v17.props.setCameraPermissionStateFromControl(v19);
                        return ;
                    end;
                end;
            end;
            if v17.props.getPermissions then
                v17.props.getPermissions(v21, l_Permissions_0.CAMERA_ACCESS);
                return ;
            end;
        end;
    end;
    v17.toggleVideo = function()
        v17.props.onClickedCameraIndicator();
    end;
    v17.updateVideo = function()
        v17:setState({
            cameraEnabled = l_FaceAnimatorService_0.VideoAnimationEnabled
        });
    end;
end;
v16.shouldShowCameraIndicator = function(v22)
    return v22.props.isLocalPlayer and v22:getCameraButtonVisibleAtMount();
end;
v16.shouldShowMicOffIndicator = function(v23)
    if not v23.props.isLocalPlayer then
        return false;
    else
        local v24 = true;
        if v23.props.voiceState ~= "Muted" then
            v24 = v23.props.voiceState == "LOCAL_MUTED";
        end;
        if not v12.JoinWithoutMicPermissions then
            return v24 or not v23.props.hasMicPermissions;
        else
            return v24;
        end;
    end;
end;
v16.getCameraButtonVisibleAtMount = function(v25)
    if (not v12.EnableAlwaysAvailableCamera or not v25.props.isCameraOnlyUser) or not v25.props.isCameraOnlyUser() then
        if not v25.props.isCamEnabledForUserAndPlace then
            return false;
        else
            return v25.props.isCamEnabledForUserAndPlace();
        end;
    else
        return false;
    end;
end;
v16.render = function(v26)
    local v27 = v26.props.hasMicPermissions or v26.props.voiceEnabled;
    if v12.JoinWithoutMicPermissions then
        v27 = v26.props.voiceEnabled;
    end;
    local v28 = v26:shouldShowCameraIndicator();
    local v29 = v26:shouldShowMicOffIndicator();
    local v30 = v28 and v27;
    local l_chatSettings_0 = v26.props.chatSettings;
    local v32 = not not v30 and l_AvatarChatUISettings_0.DoubleIconCornerRadiusOffset or l_AvatarChatUISettings_0.SingleIconCornerRadiusOffset;
    local v33 = not not v30 and l_AvatarChatUISettings_0.DoubleIconButtonSize or l_AvatarChatUISettings_0.SingleIconButtonSize;
    local v34 = not v26.props.isLocalPlayer and "speaker" or "microphone";
    local v35 = (not not v26.state.cameraEnabled and v26.props.hasCameraPermissions) and "icons/controls/voice/video_on_light" or "icons/controls/voice/video_off_light";
    if v12.DoNotPromptCameraPermissionsOnMount then
        v35 = (not not v26.state.cameraEnabled and v26:getCameraButtonVisibleAtMount()) and "icons/controls/voice/video_on_light" or "icons/controls/voice/video_off_light";
    end;
    return v4.createElement("Frame", {
        AnchorPoint = Vector2.new(0.5, 1), 
        Position = UDim2.new(0.5, 0, 1, -8), 
        AutomaticSize = Enum.AutomaticSize.X, 
        Size = UDim2.fromOffset(0, l_AvatarChatUISettings_0.FrameHeight), 
        LayoutOrder = v26.props.LayoutOrder, 
        BackgroundTransparency = l_chatSettings_0.BackgroundTransparency, 
        BackgroundColor3 = l_chatSettings_0.BackgroundColor3, 
        Visible = v27 or v28
    }, {
        Scale = v4.createElement("UIScale", {
            Scale = v26.props.isInsideMaximizeDistance and 1 or 0.75
        }), 
        UICorner = v4.createElement("UICorner", {
            CornerRadius = UDim.new(0, v32)
        }), 
        Container = v4.createElement("ImageLabel", l_Dictionary_0.join({
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = 1
        }, l_chatSettings_0.ImageLabel), {
            UICorner = v4.createElement("UICorner", {
                CornerRadius = UDim.new(0, v32)
            }), 
            UIListLayout = v4.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }), 
            MicrophoneBubble = v27 and v4.createElement(v13, {
                LayoutOrder = 1, 
                onActivated = v26.toggleMic, 
                chatSettings = l_chatSettings_0, 
                controlBubbleSize = v33, 
                cornerRadiusOffset = v32, 
                iconAssetName = if not v29 then nil else "icons/controls/voice/microphone_off_light", 
                iconSize = l_AvatarChatUISettings_0.IconSize, 
                iconTransparency = l_AvatarChatUISettings_0.IconTransparency, 
                voiceState = v26.props.voiceState, 
                renderStepName = l_HttpService_0:GenerateGUID(), 
                iconStyle = v34
            }), 
            Divider = (v27 and v28) and v4.createElement("Frame", {
                Size = l_AvatarChatUISettings_0.DividerSize, 
                AnchorPoint = Vector2.new(0.5, 1), 
                BorderSizePixel = 0, 
                LayoutOrder = 2, 
                ZIndex = 1, 
                BackgroundColor3 = l_AvatarChatUISettings_0.DividerColor
            }), 
            CameraBubble = v28 and v4.createElement(v13, {
                LayoutOrder = 3, 
                onActivated = not not v12.DoNotPromptCameraPermissionsOnMount and v26.onVideoButtonPressed or v26.toggleVideo, 
                chatSettings = l_chatSettings_0, 
                cornerRadiusOffset = v32, 
                controlBubbleSize = v33, 
                iconAssetName = v35, 
                iconSize = l_AvatarChatUISettings_0.IconSize, 
                iconTransparency = l_AvatarChatUISettings_0.IconTransparency, 
                iconStyle = v34
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
        }, {
            CaratGradient = l_chatSettings_0.UIGradient and v4.createElement("UIGradient", l_chatSettings_0.UIGradient)
        }), 
        BubbleGradient = l_chatSettings_0.UIGradient and v4.createElement("UIGradient", l_chatSettings_0.UIGradient), 
        VideoEnabledChanged = not not l_FaceAnimatorService_0 and v4.createElement(l_ExternalEventConnection_0, {
            event = l_FaceAnimatorService_0:GetPropertyChangedSignal("VideoAnimationEnabled"), 
            callback = v26.updateVideo
        }) or nil
    });
end;
return v5.connect(function(v36, v37)
    return {
        voiceState = v36.Voice.participants[v37.userId]
    };
end)(v16);
