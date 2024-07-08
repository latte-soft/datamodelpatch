local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_FaceAnimatorService_0 = game:GetService("FaceAnimatorService");
local l_HttpService_0 = game:GetService("HttpService");
local l_RunService_0 = game:GetService("RunService");
local v5 = require(l_CorePackages_0.Packages.Roact);
local v6 = require(l_CorePackages_0.Packages.RoactRodux);
local v7 = require(l_CorePackages_0.Packages.t);
local v8 = require(l_CorePackages_0.UIBlox);
local l_ExternalEventConnection_0 = v8.Utility.ExternalEventConnection;
local l_Images_0 = v8.App.ImageSet.Images;
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v12 = require(script.Parent.ControlBubble);
local l_default_0 = require(l_Modules_0.VoiceChat.VoiceChatServiceManager).default;
local v14 = require(l_Modules_0.InGameChat.BubbleChat.Constants);
local v15 = require(l_Modules_0.SelfView.publicApi);
local v16 = require(l_Modules_0.SelfView.toggleSelfViewSignal);
local v17 = require(l_Modules_0.SelfView.Analytics).new();
local v18 = require(l_Modules_0.Flags.GetFFlagLocalMutedNilFix);
local v19 = require(l_Modules_0.Flags.GetFFlagMicStatesFix);
local v20 = require(l_Modules_0.VoiceChat.Constants);
local v21 = l_Images_0["icons/controls/video"];
local v22 = l_Images_0["icons/controls/videoOff"];
local v23 = l_Images_0["icons/controls/microphoneMute"];
local v24 = v5.PureComponent:extend("ControlsBubble");
v24.validateProps = v7.strictInterface({
    chatSettings = v7.table, 
    isInsideMaximizeDistance = v7.boolean, 
    isLocalPlayer = v7.boolean, 
    LayoutOrder = v7.optional(v7.number), 
    hasCameraPermissions = v7.boolean, 
    hasMicPermissions = v7.boolean, 
    isShowingDueToEasierUnmuting = v7.optional(v7.boolean)
});
v24.defaultProps = {
    LayoutOrder = 1
};
v24.init = function(v25)
    v25:setState({
        microphoneEnabled = if not v18 then not l_default_0.localMuted else l_default_0.localMuted == false, 
        cameraEnabled = (not not l_FaceAnimatorService_0 and l_FaceAnimatorService_0:IsStarted()) and l_FaceAnimatorService_0.VideoAnimationEnabled
    });
    v25.toggleMic = function()
        if not v25.props.isLocalPlayer then
            l_default_0:ToggleMutePlayer(tonumber(v25.props.userId), if not v25.props.isShowingDueToEasierUnmuting then v20.VOICE_CONTEXT_TYPE.BUBBLE_CHAT else v20.VOICE_CONTEXT_TYPE.EASIER_UNMUTING);
            return ;
        elseif v25.props.hasMicPermissions then
            if v25.props.voiceState == v14.VOICE_STATE.ERROR then
                l_default_0:RejoinPreviousChannel();
                return ;
            elseif v25.props.voiceState == v14.VOICE_STATE.CONNECTING then
                l_default_0:ShowVoiceChatLoadingMessage();
                return ;
            else
                v17:setLastCtx("bubbleChatToggle");
                l_default_0:ToggleMic("LegacyBubbleChatToggle");
                v25:setState({
                    microphoneEnabled = not l_default_0.localMuted
                });
                return ;
            end;
        else
            return ;
        end;
    end;
    v25.updateVideo = function()
        v25:setState({
            cameraEnabled = l_FaceAnimatorService_0.VideoAnimationEnabled
        });
    end;
    v25.toggleVideo = function()
        if v25.props.hasCameraPermissions then
            if l_FaceAnimatorService_0 and l_FaceAnimatorService_0:IsStarted() then
                l_FaceAnimatorService_0.VideoAnimationEnabled = not l_FaceAnimatorService_0.VideoAnimationEnabled;
                v17:setLastCtx("bubbleChatToggle");
                v25:setState({
                    cameraEnabled = l_FaceAnimatorService_0.VideoAnimationEnabled
                });
                local v26 = v15.getSelfViewIsOpenAndVisible();
                if not (not l_FaceAnimatorService_0.VideoAnimationEnabled or v26) then
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
    v25.muteChangedEvent = function(v27)
        v25:setState({
            microphoneEnabled = not v27
        });
    end;
    local v28, v29 = v5.createBinding(0);
    v25.level = v28;
    v25.updateLevel = v29;
    v28, v29 = v5.createBinding(v25.props.voiceState);
    v25.voiceState = v28;
    v25.updateVoiceState = v29;
    v25.renderStepName = l_HttpService_0:GenerateGUID();
    l_RunService_0:BindToRenderStep(v25.renderStepName, Enum.RenderPriority.First.Value + 1, function()
        v25.updateLevel(math.random());
    end);
    v25.levelIcon = v5.joinBindings({
        v25.voiceState, 
        v25.level
    }):map(function(v30)
        local v31 = v30[1];
        local v32 = v30[2];
        local v33 = if not v25.props.isLocalPlayer then not game:GetEngineFeature("VoiceChatNewSpeakerIcons") and "SpeakerDark" or "SpeakerNew" else "New";
        if not (v31 ~= v14.VOICE_STATE.MUTED) or v31 == v14.VOICE_STATE.LOCAL_MUTED then
            if not v25.props.isLocalPlayer then
                return l_default_0:GetIcon("Muted", v33);
            else
                return "";
            end;
        elseif v31 == v14.VOICE_STATE.CONNECTING then
            return l_default_0:GetIcon("Connecting", v33);
        elseif v31 == v14.VOICE_STATE.INACTIVE then
            return l_default_0:GetIcon("Unmuted0", v33);
        elseif v31 == v14.VOICE_STATE.TALKING then
            return l_default_0:GetIcon("Unmuted" .. tostring(20 * math.floor(0.5 + 5 * v32)), v33);
        else
            return l_default_0:GetIcon("Error", v33);
        end;
    end);
end;
v24.shouldShowCameraIndicator = function(v34)
    if not v34.props.isLocalPlayer or not v34.props.hasCameraPermissions then
        return false;
    else
        return true;
    end;
end;
v24.getMicIcon = function(v35)
    if v35.props.isLocalPlayer then
        if not v19() then
            local v36 = not (v35.state.microphoneEnabled and v35.props.hasMicPermissions);
            local v37 = true;
            if v35.props.voiceState ~= v14.VOICE_STATE.MUTED then
                v37 = v35.props.voiceState == v14.VOICE_STATE.LOCAL_MUTED;
            end;
            if not (not v36 and not v37) then
                return v23, true;
            end;
        else
            local v38 = not v35.props.hasMicPermissions;
            local v39 = true;
            if v35.props.voiceState ~= v14.VOICE_STATE.MUTED then
                v39 = v35.props.voiceState == v14.VOICE_STATE.LOCAL_MUTED;
            end;
            if not (not v38 and not v39) then
                return v23, true;
            end;
        end;
        return v35.levelIcon, false;
    else
        return v35.levelIcon, false;
    end;
end;
v24.didUpdate = function(v40, v41, _)
    if v40.props.voiceState ~= v41.voiceState then
        v40.updateVoiceState(v40.props.voiceState);
    end;
end;
v24.didMount = function(v43)
    v43.updateVoiceState(v43.props.voiceState);
end;
v24.render = function(v44)
    local v45 = v44.props.hasMicPermissions and v44.props.voiceEnabled;
    local v46 = v44:shouldShowCameraIndicator();
    local v47, v48 = v44:getMicIcon();
    local l_chatSettings_0 = v44.props.chatSettings;
    return v5.createElement("Frame", {
        AnchorPoint = Vector2.new(0.5, 1), 
        AutomaticSize = Enum.AutomaticSize.X, 
        Position = UDim2.new(0.5, 0, 1, -8), 
        Size = UDim2.new(0, 0, 0, 25), 
        LayoutOrder = v44.props.LayoutOrder, 
        BackgroundTransparency = 0, 
        BorderSizePixel = 0, 
        BackgroundColor3 = Color3.fromRGB(255, 255, 255), 
        Visible = v45 or v46
    }, {
        Scale = v5.createElement("UIScale", {
            Scale = v44.props.isInsideMaximizeDistance and 1 or 0.75
        }), 
        UICorner = v5.createElement("UICorner", {
            CornerRadius = UDim.new(0, 8)
        }), 
        Container = v5.createElement("Frame", {
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = 0, 
            BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        }, {
            UICorner = l_chatSettings_0.CornerEnabled and v5.createElement("UICorner", {
                CornerRadius = UDim.new(0, 8)
            }), 
            UIListLayout = v5.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                Padding = UDim.new(0, 2)
            }), 
            UIPadding = v5.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 2), 
                PaddingRight = UDim.new(0, 2), 
                PaddingBottom = UDim.new(0, 2), 
                PaddingLeft = UDim.new(0, 2)
            }), 
            MicrophoneBubble = v45 and v5.createElement(v12, {
                LayoutOrder = 1, 
                icon = v47, 
                onActivated = v44.toggleMic, 
                enabled = v44.props.hasMicPermissions, 
                isImageSet = v48, 
                chatSettings = l_chatSettings_0, 
                iconSize = if not v44.props.isLocalPlayer then UDim2.fromOffset(23, 21) else UDim2.fromOffset(14, 18)
            }), 
            CameraBubble = v46 and v5.createElement(v12, {
                LayoutOrder = 2, 
                icon = if not not v44.state.cameraEnabled and v44.props.hasCameraPermissions then v21 else v22, 
                onActivated = v44.toggleVideo, 
                enabled = v44.props.hasCameraPermissions, 
                isImageSet = true, 
                imageSetIcon = if not not v44.state.cameraEnabled and v44.props.hasCameraPermissions then v21 else v22, 
                chatSettings = l_chatSettings_0
            })
        }), 
        Carat = l_chatSettings_0.TailVisible and v5.createElement("ImageLabel", {
            LayoutOrder = 3, 
            AnchorPoint = Vector2.new(0.5, 0), 
            BackgroundTransparency = 1, 
            Position = UDim2.new(0.5, 0, 1, -1), 
            Size = UDim2.fromOffset(12, 8), 
            Image = "rbxasset://textures/ui/InGameChat/Caret.png", 
            BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        }), 
        MuteChangedEvent = v5.createElement(l_ExternalEventConnection_0, {
            event = l_default_0.muteChanged.Event, 
            callback = v44.muteChangedEvent
        }), 
        VideoEnabledChanged = not not l_FaceAnimatorService_0 and v5.createElement(l_ExternalEventConnection_0, {
            event = l_FaceAnimatorService_0:GetPropertyChangedSignal("VideoAnimationEnabled"), 
            callback = v44.updateVideo
        }) or nil
    });
end;
v24.willUnmount = function(v50)
    local l_status_0, _ = pcall(function()
        l_RunService_0:UnbindFromRenderStep(v50.renderStepName);
    end);
    task.spawn(function()
        assert(l_status_0 == true, "Tried to UnbindFromRenderStep with a self.renderStepName that was never bound");
    end);
end;
return v6.connect(function(v53, v54)
    return {
        voiceState = v53.voiceState[v54.userId]
    };
end)(v24);
