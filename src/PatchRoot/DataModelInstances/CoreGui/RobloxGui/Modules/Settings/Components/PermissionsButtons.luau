local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_FaceAnimatorService_0 = game:GetService("FaceAnimatorService");
local l_StarterGui_0 = game:GetService("StarterGui");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_VideoCaptureService_0 = game:GetService("VideoCaptureService");
local v6 = require(l_CorePackages_0.Roact);
local v7 = require(l_CorePackages_0.UIBlox);
local v8 = require(l_CorePackages_0.Packages.t);
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.PermissionsProtocol).PermissionsProtocol.default;
local v10 = require(l_RobloxGui_0.Modules.SelfView.toggleSelfViewSignal);
local v11 = require(l_RobloxGui_0.Modules.SelfView.selfViewVisibilityUpdatedSignal);
local v12 = require(l_RobloxGui_0.Modules.Settings.getCamMicPermissions);
local v13 = require(l_RobloxGui_0.Modules.Settings.isCamEnabledForUserAndPlace);
local v14 = require(l_RobloxGui_0.Modules.InGameChat.BubbleChat.Helpers.displayCameraDeniedToast);
local v15 = require(l_RobloxGui_0.Modules.SelfView.publicApi);
local l_ExternalEventConnection_0 = v7.Utility.ExternalEventConnection;
local l_Images_0 = v7.App.ImageSet.Images;
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v19 = require(l_Modules_0.Settings.Components.PermissionButton);
local v20 = require(l_Modules_0.Settings.Components.RecordingIndicator);
local l_default_1 = require(l_Modules_0.VoiceChat.VoiceChatServiceManager).default;
local v22 = require(l_Modules_0.VoiceChat.Constants);
local v23 = require(l_RobloxGui_0.Modules.Logger):new(script.Name);
local v24 = require(l_RobloxGui_0.Modules.Flags.GetFFlagInvertMuteAllPermissionButton);
local v25 = require(l_RobloxGui_0.Modules.Flags.FFlagAvatarChatCoreScriptSupport);
local v26 = require(l_RobloxGui_0.Modules.Flags.GetFFlagUpdateSelfieViewOnBan);
local v27 = require(l_RobloxGui_0.Modules.Flags.GetFFlagShowMicConnectingIconAndToast);
local v28 = require(l_RobloxGui_0.Modules.Flags.FFlagMuteNonFriendsEvent);
local v29 = require(l_RobloxGui_0.Modules.Flags.getFFlagDoNotPromptCameraPermissionsOnMount);
local v30 = require(l_RobloxGui_0.Modules.Flags.GetFFlagRemoveInGameChatBubbleChatReferences);
local v31 = require(l_RobloxGui_0.Modules.Flags.GetFFlagJoinWithoutMicPermissions);
if v30() then
    v14 = require(l_RobloxGui_0.Modules.VoiceChat.Helpers.displayCameraDeniedToast);
end;
local v32 = require(l_RobloxGui_0.Modules.SelfView.Analytics).new();
local v33 = v6.PureComponent:extend("PermissionsButtons");
local v34 = l_Images_0["icons/controls/video"];
local v35 = l_Images_0["icons/controls/videoOff"];
local v36 = l_Images_0["icons/controls/microphone"];
local v37 = l_Images_0["icons/controls/microphoneMute"];
local v38 = l_Images_0["icons/controls/selfie"];
local v39 = l_Images_0["icons/controls/selfieOff"];
local v40 = l_Images_0["icons/controls/headphone"];
local v41 = l_Images_0["icons/controls/headphoneDeafen"];
v33.validateProps = v8.strictInterface({
    isPortrait = v8.boolean, 
    isSmallTouchScreen = v8.boolean, 
    isTenFootInterface = v8.boolean, 
    ZIndex = v8.number, 
    LayoutOrder = v8.number, 
    shouldFillScreen = v8.boolean, 
    selfViewOpen = v8.boolean, 
    useNewMenuTheme = v8.boolean
});
local function v43(v42)
    return v6.createElement("Frame", {
        LayoutOrder = v42, 
        Size = UDim2.new(0, 2, 0, 24), 
        BorderSizePixel = 0, 
        BackgroundTransparency = 0.2
    }, {
        UICorner = v6.createElement("UICorner", {
            CornerRadius = UDim.new(0.5, 0)
        })
    });
end;
v33.init = function(v44)
    local v45 = ((l_FaceAnimatorService_0 and l_FaceAnimatorService_0:IsStarted()) and l_FaceAnimatorService_0.VideoAnimationEnabled) and l_VideoCaptureService_0.Active;
    local v46 = l_default_1.localMuted ~= nil and (not l_default_1.localMuted or false);
    local v47 = (v25 and l_StarterGui_0:GetCoreGuiEnabled(Enum.CoreGuiType.SelfView)) and (v44.state.hasCameraPermissions or v44.state.hasMicPermissions);
    if v29() then
        v47 = (v25 and l_StarterGui_0:GetCoreGuiEnabled(Enum.CoreGuiType.SelfView)) and ((v13() or v44.state.hasMicPermissions) or v44.state.hasCameraPermissions);
    end;
    v44:setState({
        allPlayersMuted = false, 
        microphoneEnabled = v46, 
        isVoiceConnecting = l_default_1.localMuted == nil, 
        voiceServiceInitialized = false, 
        cameraEnabled = v45, 
        selfViewOpen = v44.props.selfViewOpen, 
        showSelfView = v47, 
        hasCameraPermissions = false, 
        hasMicPermissions = false
    });
    if v27() then
        l_default_1:asyncInit():andThen(function()
            if l_default_1:getService() then
                v44:setState({
                    voiceServiceInitialized = true
                });
            end;
        end):catch(function()
            v23:warning("VoiceChatServiceManager failed to initialize");
        end);
    end;
    v44.selfViewVisibilityUpdatedSignal = v11:connect(function()
        v44:setState({
            selfViewOpen = v15.getSelfViewIsOpenAndVisible()
        });
    end);
    v44.toggleMuteAll = function()
        if l_default_1:getService() then
            local v48 = not v44.state.allPlayersMuted;
            l_default_1:MuteAll(v48, v22.VOICE_CONTEXT_TYPE.IN_GAME_MENU);
            v44:setState({
                allPlayersMuted = v48
            });
            return ;
        else
            return ;
        end;
    end;
    v44.toggleMuteAllIcon = function(v49)
        v44:setState({
            allPlayersMuted = v49
        });
    end;
    v44.toggleMic = function()
        if not v27() or not v44.state.isVoiceConnecting then
            if l_default_1:getService() then
                l_default_1:ToggleMic("InGameMenuPermissionsBar");
                v32:setLastCtx("inExperienceEscapeMenu");
                v44:setState({
                    microphoneEnabled = not l_default_1.localMuted
                });
                return ;
            else
                return ;
            end;
        else
            l_default_1:ShowVoiceChatLoadingMessage();
            return ;
        end;
    end;
    v44.toggleVideo = function()
        if l_FaceAnimatorService_0 and l_FaceAnimatorService_0:IsStarted() then
            l_FaceAnimatorService_0.VideoAnimationEnabled = not l_FaceAnimatorService_0.VideoAnimationEnabled;
            v32:setLastCtx("inExperienceEscapeMenu");
            v44:setState({
                cameraEnabled = l_FaceAnimatorService_0.VideoAnimationEnabled
            });
            return ;
        else
            return ;
        end;
    end;
    v44.onVideoButtonPressed = function()
        if not v29() or v44.state.hasCameraPermissions then
            v44:toggleVideo();
            return ;
        else
            v12(function(v50)
                v44:setState({
                    hasCameraPermissions = v50.hasCameraPermissions
                });
                if not v50.hasCameraPermissions then
                    v14();
                    return ;
                else
                    v44:toggleVideo();
                    return ;
                end;
            end, {
                l_default_0.Permissions.CAMERA_ACCESS
            });
            return ;
        end;
    end;
    v44.toggleSelfView = function()
        v10:fire();
        v44:setState({
            selfViewOpen = not v44.state.selfViewOpen
        });
    end;
    v44.muteChangedEvent = function(v51)
        v44:setState({
            microphoneEnabled = not v51
        });
    end;
    v44.onSelfViewVisibilityUpdated = function()
        v44:setState({
            selfViewOpen = v15.getSelfViewIsOpenAndVisible()
        });
    end;
    v44.onCoreGuiChanged = function()
        local l_l_StarterGui_0_CoreGuiEnabled_0 = l_StarterGui_0:GetCoreGuiEnabled(Enum.CoreGuiType.SelfView);
        if v44.state.showSelfView ~= l_l_StarterGui_0_CoreGuiEnabled_0 then
            local v53 = (v25 and l_l_StarterGui_0_CoreGuiEnabled_0) and (v44.state.hasCameraPermissions or v44.state.hasMicPermissions);
            if v29() then
                v53 = (v25 and l_StarterGui_0:GetCoreGuiEnabled(Enum.CoreGuiType.SelfView)) and ((v13() or v44.state.hasMicPermissions) or v44.state.hasCameraPermissions);
            end;
            v44:setState({
                showSelfView = v53
            });
        end;
    end;
    v44.updateVideoCaptureEnabled = function()
        v44:setState({
            cameraEnabled = l_FaceAnimatorService_0.VideoAnimationEnabled
        });
    end;
    if v27() then
        v44.onVoiceStateChange = function(_, v55)
            if not (l_default_1:GetVoiceStateFromEnum(v55) == l_default_1.VOICE_STATE.CONNECTING or not v44.state.isVoiceConnecting) then
                v44:setState({
                    isVoiceConnecting = false
                });
            end;
        end;
    end;
end;
v33.getPermissions = function(v56)
    v12(function(v57)
        v56:setState({
            hasCameraPermissions = v57.hasCameraPermissions, 
            hasMicPermissions = v57.hasMicPermissions
        });
    end, nil, nil, "PermissionsButtons.getPermissions");
end;
v33.getMicPermission = function(v58)
    v12(function(v59)
        v58:setState({
            hasMicPermissions = v59.hasMicPermissions
        });
    end, {
        l_default_0.Permissions.MICROPHONE_ACCESS
    }, nil, "PermissionsButtons.getMicPermission");
end;
v33.getCameraPermissionWithoutRequest = function(v60)
    v12(function(v61)
        v60:setState({
            hasCameraPermissions = v61.hasCameraPermissions
        });
    end, {
        l_default_0.Permissions.CAMERA_ACCESS
    }, true);
end;
v33.getCameraButtonVisibleAtMount = function(_)
    return v13();
end;
v33.didUpdate = function(v63, _, v65)
    local l_l_StarterGui_0_CoreGuiEnabled_1 = l_StarterGui_0:GetCoreGuiEnabled(Enum.CoreGuiType.SelfView);
    if not (v63.state.hasCameraPermissions == v65.hasCameraPermissions) or v63.state.hasMicPermissions ~= v65.hasMicPermissions then
        local v67 = (v25 and l_l_StarterGui_0_CoreGuiEnabled_1) and (v63.state.hasCameraPermissions or v63.state.hasMicPermissions);
        if v29() then
            v67 = (v25 and l_StarterGui_0:GetCoreGuiEnabled(Enum.CoreGuiType.SelfView)) and ((v13() or v63.state.hasMicPermissions) or v63.state.hasCameraPermissions);
        end;
        v63:setState({
            showSelfView = v67
        });
    end;
end;
v33.didMount = function(v68)
    if not v29() then
        v68:getPermissions();
        return ;
    else
        v68:getMicPermission();
        v68:getCameraPermissionWithoutRequest();
        return ;
    end;
end;
v33.isShowingPermissionButtons = function(v69)
    if not v29() then
        return (v69.state.hasMicPermissions or v69.state.hasCameraPermissions) or v69.state.showSelfView;
    else
        return ((v69.state.hasMicPermissions or v69.state.hasCameraPermissions) or v69.state.showSelfView) or v69:getCameraButtonVisibleAtMount();
    end;
end;
v33.render = function(v70)
    local l_hasMicPermissions_0 = v70.state.hasMicPermissions;
    if v26() then
        l_hasMicPermissions_0 = v70.state.hasMicPermissions and not l_default_1:VoiceChatEnded();
    end;
    if v31() then
        l_hasMicPermissions_0 = v70.state.voiceServiceInitialized and not l_default_1:VoiceChatEnded();
    end;
    local l_hasCameraPermissions_0 = v70.state.hasCameraPermissions;
    if v29() then
        l_hasCameraPermissions_0 = v70:getCameraButtonVisibleAtMount();
    end;
    local v73 = if not v24() then v70.state.allPlayersMuted else not v70.state.allPlayersMuted;
    local v74 = not (v70.props.isPortrait or v70.props.isTenFootInterface) and not v70.props.isSmallTouchScreen or v70.props.useNewMenuTheme;
    local v75 = (not v27() or not v70.state.isVoiceConnecting) and l_hasMicPermissions_0;
    local l_v36_0 = v36;
    local v77 = nil;
    if not v27() or not v70.state.isVoiceConnecting then
        if not v70.state.microphoneEnabled then
            l_v36_0 = v37;
        end;
    else
        l_v36_0 = l_default_1:GetIcon("Connecting", "New");
        v77 = {
            Size = UDim2.fromOffset(14, 22), 
            Position = UDim2.fromOffset(9, 4)
        };
    end;
    return v70:isShowingPermissionButtons() and v6.createElement("Frame", {
        AutomaticSize = Enum.AutomaticSize.XY, 
        ZIndex = v70.props.ZIndex, 
        BackgroundTransparency = 1, 
        Position = UDim2.new(0, 0, 0, 0), 
        Size = UDim2.new(not v70.props.shouldFillScreen and 0 or 1, 0, 0, 0), 
        AnchorPoint = if not v74 then Vector2.new(0.5, 0.5) else Vector2.new(0, 0), 
        LayoutOrder = v70.props.LayoutOrder, 
        Visible = not v70.props.isTenFootInterface
    }, {
        UIPaddingPermissionsContainer = v6.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, not v70.props.isSmallTouchScreen and 74 or 54), 
            PaddingTop = UDim.new(0, 4)
        }), 
        UIListLayout = v6.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, not v70.props.isSmallTouchScreen and 24 or 10)
        }), 
        Divider1 = v43(1), 
        Container = v6.createElement("Frame", {
            AutomaticSize = Enum.AutomaticSize.X, 
            Size = UDim2.fromOffset(0, 38), 
            BackgroundTransparency = 1, 
            ClipsDescendants = true, 
            LayoutOrder = 2
        }, {
            UIListLayoutPermissionsContainer = v6.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, not v70.props.isSmallTouchScreen and 24 or 10)
            }), 
            if not v26() then v6.createElement(v19, {
                LayoutOrder = 1, 
                image = if not v73 then v41 else v40, 
                callback = v70.toggleMuteAll, 
                useNewMenuTheme = v70.props.useNewMenuTheme
            }) else l_hasMicPermissions_0 and v6.createElement(v19, {
                LayoutOrder = 1, 
                image = if not v73 then v41 else v40, 
                callback = v70.toggleMuteAll, 
                useNewMenuTheme = v70.props.useNewMenuTheme
            }), 
            ToggleMicButton = l_hasMicPermissions_0 and v6.createElement(v19, {
                LayoutOrder = 2, 
                image = l_v36_0, 
                callback = v70.toggleMic, 
                useNewMenuTheme = v70.props.useNewMenuTheme, 
                imageLabelProps = v77
            }), 
            EnableVideoButton = l_hasCameraPermissions_0 and v6.createElement(v19, {
                LayoutOrder = 3, 
                image = if not v70.state.cameraEnabled then v35 else v34, 
                callback = if not v29() then v70.toggleVideo else v70.onVideoButtonPressed, 
                useNewMenuTheme = v70.props.useNewMenuTheme
            }), 
            EnableSelfViewButton = v70.state.showSelfView and v6.createElement(v19, {
                LayoutOrder = 4, 
                image = if not v70.state.selfViewOpen then v39 else v38, 
                callback = v70.toggleSelfView, 
                useNewMenuTheme = v70.props.useNewMenuTheme
            })
        }), 
        Divider2 = v43(5), 
        RecordingIndicator = v75 and v6.createElement(v20, {
            micOn = v70.state.microphoneEnabled, 
            hasMicPermissions = v70.state.hasMicPermissions, 
            isSmallTouchScreen = v70.props.isSmallTouchScreen
        }), 
        MuteChangedEvent = v6.createElement(l_ExternalEventConnection_0, {
            event = l_default_1.muteChanged.Event, 
            callback = v70.muteChangedEvent
        }), 
        SelfViewChangedEvent = v6.createElement(l_ExternalEventConnection_0, {
            event = l_StarterGui_0.CoreGuiChangedSignal, 
            callback = v70.onCoreGuiChanged
        }), 
        MuteAllChangedEvent = v6.createElement(l_ExternalEventConnection_0, {
            event = l_default_1.muteAllChanged.Event, 
            callback = v70.toggleMuteAllIcon
        }), 
        VideoCaptureEnabledEvent = v6.createElement(l_ExternalEventConnection_0, {
            event = l_FaceAnimatorService_0:GetPropertyChangedSignal("VideoAnimationEnabled"), 
            callback = v70.updateVideoCaptureEnabled
        }), 
        VoiceStateChangeEvent = if not not v27() and v70.state.voiceServiceInitialized then v6.createElement(l_ExternalEventConnection_0, {
            event = l_default_1:getService().StateChanged, 
            callback = v70.onVoiceStateChange
        }) else nil, 
        MuteNonFriendsEvent = if not v28 then nil else v6.createElement(l_ExternalEventConnection_0, {
            event = l_default_1.mutedNonFriends.Event, 
            callback = function()
                v70.toggleMuteAllIcon(false);
            end
        })
    });
end;
v33.willUnmount = function(v78)
    if v78.selfViewVisibilityUpdatedSignal then
        v78.selfViewVisibilityUpdatedSignal:disconnect();
        v78.selfViewVisibilityUpdatedSignal = nil;
    end;
end;
return v33;
