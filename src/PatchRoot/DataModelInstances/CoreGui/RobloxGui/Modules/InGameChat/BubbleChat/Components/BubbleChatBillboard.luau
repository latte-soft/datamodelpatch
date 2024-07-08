local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Players_0 = game:GetService("Players");
local l_RunService_0 = game:GetService("RunService");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_StarterGui_0 = game:GetService("StarterGui");
local l_VRService_0 = game:GetService("VRService");
local v7 = require(script.Parent.Parent.Logger)(script.Name);
local v8 = require(l_CorePackages_0.Packages.Roact);
local v9 = require(l_CorePackages_0.Packages.RoactRodux);
local v10 = require(l_CorePackages_0.Packages.t);
local v11 = require(l_CorePackages_0.Packages.Otter);
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.PermissionsProtocol).PermissionsProtocol.default;
local v13 = require(l_RobloxGui_0.Modules.Settings.getCamMicPermissions);
local v14 = require(script.Parent.BubbleChatList);
local v15 = require(script.Parent.ChatBubbleDistant);
local v16 = require(script.Parent.VoiceBubble);
local v17 = require(script.Parent.ControlsBubble);
local v18 = require(l_RobloxGui_0.Modules.VoiceChat.Components.VoiceIndicator);
local v19 = require(script.Parent.Parent.Types);
local v20 = require(script.Parent.Parent.Constants);
local v21 = require(script.Parent.Parent.Helpers.getSettingsForMessage);
local v22 = require(l_RobloxGui_0.Modules.SelfView.selfViewVisibilityUpdatedSignal);
local v23 = require(l_RobloxGui_0.Modules.Chrome.Enabled);
local v24 = require(l_RobloxGui_0.Modules.VoiceChat.Constants);
local l_default_1 = require(l_RobloxGui_0.Modules.VoiceChat.VoiceChatServiceManager).default;
local v26 = require(l_RobloxGui_0.Modules.Flags.GetFFlagEnableVoiceChatSpeakerIcons);
local v27 = require(l_RobloxGui_0.Modules.Flags.GetFFlagMicConnectingToast);
local v28 = require(l_RobloxGui_0.Modules.Flags.GetFFlagEnableVoiceChatManualReconnect);
local v29 = require(l_RobloxGui_0.Modules.Flags.GetFFlagBubbleChatInexistantAdorneeFix);
local v30 = require(l_RobloxGui_0.Modules.Flags.FFlagAvatarChatCoreScriptSupport);
local v31 = require(l_RobloxGui_0.Modules.Flags.FFlagEnableAvatarChatToggleUIUpgradeForLegacyChatService);
local v32 = require(l_RobloxGui_0.Modules.SelfView.publicApi);
local v33 = game:DefineFastInt("BubbleVoiceTimeoutMillis", 1000);
local v34 = game:DefineFastFlag("DebugAllowControlButtonsNoVoiceChat", false);
local v35 = require(l_RobloxGui_0.Modules.Flags.FFlagVRMoveVoiceIndicatorToBottomBar);
local v36 = require(l_RobloxGui_0.Modules.Common.IXPServiceWrapper);
local v37 = game:DefineFastFlag("EasierUnmuting3", false);
local v38 = game:DefineFastFlag("EasierUnmutingBasedOnCamera", false);
local v39 = game:DefineFastFlag("EasierUnmutingHideIfMuted", false);
local v40 = game:DefineFastInt("EasierUnmutingDisplayDistance", 20);
local v41 = game:DefineFastString("EasierUnmutingIXPLayerName", "Voice.UserAgency");
local v42 = game:DefineFastString("EasierUnmutingIXPLayerValue", "VoiceUserAgencyEnabled");
local v43 = game:DefineFastFlag("EasierUnmutingFixNonexistentCharacter", false);
local v44 = require(l_RobloxGui_0.Modules.Flags.getFFlagDoNotPromptCameraPermissionsOnMount);
local v45 = v8.PureComponent:extend("BubbleChatBillboard");
local v46 = {
    dampingRatio = 1, 
    frequency = 4
};
local v47 = nil;
if v31 then
    v47 = require(script.Parent.ControlsBubbleV2);
end;
v45.validateProps = v10.strictInterface({
    userId = v10.string, 
    onFadeOut = v10.optional(v10.callback), 
    voiceEnabled = v10.optional(v10.boolean), 
    bubbleChatEnabled = v10.optional(v10.boolean), 
    chatSettings = v19.IChatSettings, 
    messageIds = v10.optional(v10.array(v10.string)), 
    lastMessage = v10.optional(v19.IMessage), 
    voiceState = v10.optional(v10.string)
});
getEasierUnmutingDistance = function(v48)
    if v48 then
        if not v43 then
            local l_HumanoidRootPart_0 = l_Players_0.LocalPlayer.Character:FindFirstChild("HumanoidRootPart");
            local v50 = workspace.CurrentCamera and workspace.CurrentCamera.CFrame.Position;
            if not v38 and l_HumanoidRootPart_0 then
                return (v48 - l_HumanoidRootPart_0.CFrame.Position).Magnitude;
            elseif v50 then
                return (v48 - v50).Magnitude;
            else
                return nil;
            end;
        else
            local v51 = (l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.Character) and l_Players_0.LocalPlayer.Character:FindFirstChild("HumanoidRootPart");
            local v52 = (v51 and v51.CFrame) and v51.CFrame.Position;
            local v53 = workspace.CurrentCamera and workspace.CurrentCamera.CFrame.Position;
            if not v38 and v52 then
                return (v48 - v52).Magnitude;
            elseif v53 then
                return (v48 - v53).Magnitude;
            else
                return nil;
            end;
        end;
    else
        return nil;
    end;
end;
v45.init = function(v54)
    v54:setState({
        adornee = nil, 
        isInsideRenderDistance = false, 
        isInsideMaximizeDistance = false, 
        savedChatSettings = v54.props.chatSettings, 
        voiceTimedOut = false, 
        voiceStateCounter = 0, 
        lastVoiceState = nil, 
        selfViewOpen = v32.getSelfViewIsOpenAndVisible(), 
        selfViewEnabled = if not v30 then nil else l_StarterGui_0:GetCoreGuiEnabled(Enum.CoreGuiType.All) or l_StarterGui_0:GetCoreGuiEnabled(Enum.CoreGuiType.SelfView), 
        isInsideEasierUnmutingDistance = if not v37 then nil else false, 
        isMuted = (not v37 or not v39) and nil, 
        isInEasierUnmutingTreatment = if not v37 then nil else false, 
        haveLoggedUserExposure = if not v37 then nil else false
    });
    v54.isMounted = false;
    local v55, v56 = v8.createBinding((Vector3.new()));
    v54.offset = v55;
    v54.updateOffset = v56;
    v54.offsetMotor = v11.createSingleMotor(0);
    v54.offsetMotor:onStep(function(v57)
        v54.updateOffset((Vector3.new(0, v57, 0)));
    end);
    v54.offsetGoal = 0;
    v54.onSelfViewVisibilityUpdated = function()
        v54:setState({
            selfViewOpen = v32.getSelfViewIsOpenAndVisible()
        });
    end;
    v54.onLastBubbleFadeOut = function()
        if not (not v54.props.onFadeOut or v54.isFadingOut) then
            v54.isFadingOut = true;
            v54.props.onFadeOut(v54.props.userId);
        end;
        if not (not v54.state.hasMessage or not v54.isMounted) then
            v54:setState({
                hasMessage = false
            });
        end;
    end;
    if v54.props.voiceEnabled then
        v55 = nil;
        v55 = v54.props.userId == tostring(l_Players_0.LocalPlayer.UserId) and function()
            if v28() and v54.props.voiceState == v20.VOICE_STATE.ERROR then
                l_default_1:RejoinPreviousChannel();
                return ;
            elseif v27() and v54.props.voiceState == v20.VOICE_STATE.CONNECTING then
                l_default_1:ShowVoiceChatLoadingMessage();
                return ;
            else
                l_default_1:ToggleMic("LegacyBubbleChat");
                return ;
            end;
        end or function()
            l_default_1:ToggleMutePlayer(tonumber(v54.props.userId), if not v54:isShowingDueToEasierUnmuting() then v24.VOICE_CONTEXT_TYPE.BUBBLE_CHAT else v24.VOICE_CONTEXT_TYPE.EASIER_UNMUTING);
        end;
        v56 = v54.props.userId;
        local v58 = "MicDark";
        if v26() then
            v58 = v56 ~= tostring(l_Players_0.LocalPlayer.UserId) and "SpeakerDark" or "MicDark";
        end;
        local l_v56_0 = v56 --[[ copy: 4 -> 6 ]];
        do
            local l_v55_0, l_v58_0 = v55, v58;
            v54.renderInsert = function()
                return v8.createElement(v18, {
                    onClicked = l_v55_0, 
                    userId = l_v56_0, 
                    iconStyle = l_v58_0
                });
            end;
            v54.insertSize = Vector2.new(28, 28);
        end;
    end;
    v54.onCoreGuiChanged = function()
        local l_l_StarterGui_0_CoreGuiEnabled_0 = l_StarterGui_0:GetCoreGuiEnabled(Enum.CoreGuiType.SelfView);
        if v54.state.selfViewOpen ~= l_l_StarterGui_0_CoreGuiEnabled_0 then
            v54:setState({
                selfViewOpen = l_l_StarterGui_0_CoreGuiEnabled_0
            });
        end;
    end;
    v54.selfViewVisibilityUpdatedSignal = v22:connect(function()
        v54:setState({
            selfViewOpen = v32.getSelfViewIsOpenAndVisible()
        });
    end);
    if v37 then
        v55, v56 = pcall(function()
            return v36:GetLayerData(v41);
        end);
        if not ((not v55 or not v56) or not v56[v42]) then
            v54:setState({
                isInEasierUnmutingTreatment = true
            });
        end;
    end;
    if not ((not v37 or not v54.state.isInEasierUnmutingTreatment) or not v39) then
        v54.participantsUpdateConnection = l_default_1.participantsUpdate.Event:Connect(function(v63)
            local v64 = v63[v54.props.userId];
            if v64 then
                if v64.isMuted ~= v54.state.isMuted then
                    v54:setState({
                        isMuted = v64.isMuted
                    });
                end;
                return ;
            else
                return ;
            end;
        end);
    end;
end;
v45.isShowingDueToEasierUnmuting = function(v65)
    local l_v37_0 = v37;
    if l_v37_0 then
        l_v37_0 = v65.state.isInEasierUnmutingTreatment;
        if l_v37_0 then
            l_v37_0 = false;
            if v65.props.voiceState == v20.VOICE_STATE.LOCAL_MUTED then
                l_v37_0 = v65.state.isInsideEasierUnmutingDistance and not (v39 and v65.state.isMuted);
            end;
        end;
    end;
    return l_v37_0;
end;
v45.checkCounterForTimeout = function(v67, v68)
    if (v67.props.userId ~= tostring(l_Players_0.LocalPlayer.UserId) and v67.state.lastVoiceState ~= v20.VOICE_STATE.TALKING) and v67.state.voiceStateCounter ~= v68 then
        local l_voiceStateCounter_0 = v67.state.voiceStateCounter;
        delay(v33 / 1000, function()
            if not (not (v67.state.voiceStateCounter == l_voiceStateCounter_0) or not v67.isMounted) then
                v67:setState({
                    voiceTimedOut = true
                });
            end;
        end);
    end;
end;
v45.checkCounterForTimeoutWithEasierUnmuting = function(v70, v71)
    local v72 = if not v71 then nil else v71.voiceStateCounter;
    if v37 and v70.state.isInEasierUnmutingTreatment then
        local v73 = v70.props.userId ~= tostring(l_Players_0.LocalPlayer.UserId);
        local v74 = v70.state.voiceStateCounter ~= v72;
        local v75 = false;
        if v70.state.lastVoiceState ~= v20.VOICE_STATE.TALKING then
            v75 = v70.state.lastVoiceState ~= v20.VOICE_STATE.LOCAL_MUTED;
        end;
        if not ((not v73 or not v74) or not v75) then
            local l_voiceStateCounter_1 = v70.state.voiceStateCounter;
            delay(v33 / 1000, function()
                if not (not (v70.state.voiceStateCounter == l_voiceStateCounter_1) or not v70.isMounted) then
                    v70:setState({
                        voiceTimedOut = true
                    });
                end;
            end);
        end;
        return ;
    else
        return v70:checkCounterForTimeout(v72);
    end;
end;
v45.didMount = function(v77)
    v77.isMounted = true;
    local v78 = v77.props.lastMessage and v77.props.lastMessage.adornee;
    v77:setState({
        adornee = v78
    });
    local v79 = v77:getVerticalOffset(v78);
    v77.offsetGoal = v79;
    v77.offsetMotor:setGoal(v11.instant(v79));
    if v30 then
        if not v44() then
            v77:getPermissions();
        else
            v77:getMicPermission();
            v77:getCameraPermissionWithoutRequest();
        end;
    end;
    local v80 = nil;
    if not v78 then
        if tonumber(v77.props.userId) then
            v80 = l_Players_0:GetPlayerByUserId(v77.props.userId);
        end;
    else
        v80 = l_Players_0:GetPlayerFromCharacter(v78);
    end;
    if v80 then
        if v80.Character then
            coroutine.wrap(function()
                v77:onCharacterAdded(v80, v80.Character);
            end)();
        end;
        v77.characterConn = v80.CharacterAdded:Connect(function(v81)
            v77:onCharacterAdded(v80, v81);
        end);
    end;
    v77.heartbeatConn = l_RunService_0.Heartbeat:Connect(function()
        local v82 = v77:getAdorneeInstance(v77.state.adornee);
        if not (not workspace.CurrentCamera or not v82) then
            local v83 = not not v82:IsA("Attachment") and v82.WorldPosition or v82.Position;
            local l_Magnitude_0 = (workspace.CurrentCamera.CFrame.Position - v83).Magnitude;
            local v85 = l_Magnitude_0 < v77.state.savedChatSettings.MaxDistance;
            local v86 = l_Magnitude_0 < v77.state.savedChatSettings.MinimizeDistance;
            local v87 = false;
            if not (not v37 or not v77.state.isInEasierUnmutingTreatment) then
                local v88 = getEasierUnmutingDistance(v83);
                if v88 ~= nil then
                    v87 = v88 < v40;
                end;
            end;
            if not (v86 == v77.state.isInsideMaximizeDistance and v85 == v77.state.isInsideRenderDistance) or not (not v37 or not v77.state.isInEasierUnmutingTreatment) and v87 ~= v77.state.isInsideEasierUnmutingDistance then
                v77:setState({
                    isInsideRenderDistance = v85, 
                    isInsideMaximizeDistance = v86, 
                    isInsideEasierUnmutingDistance = v87
                });
            end;
        end;
        local v89 = v77:getVerticalOffset(v77.state.adornee);
        if v20.BILLBOARD_OFFSET_EPSILON < math.abs(v89 - v77.offsetGoal) then
            v77.offsetGoal = v89;
            v77.offsetMotor:setGoal(v11.spring(v89, v46));
        end;
    end);
    if not v37 or not v77.state.isInEasierUnmutingTreatment then
        v77:checkCounterForTimeout(nil);
    else
        v77:checkCounterForTimeoutWithEasierUnmuting(nil);
    end;
end;
v45.willUnmount = function(v90)
    v7:trace("Unmounting billboards for {}", v90.state.shortId);
    v90.isMounted = false;
    if v90.characterConn then
        v90.characterConn:Disconnect();
        v90.characterConn = nil;
    end;
    if v90.heartbeatConn then
        v90.heartbeatConn:Disconnect();
        v90.heartbeatConn = nil;
    end;
    if v90.humanoidDiedConn then
        v90.humanoidDiedConn:Disconnect();
        v90.humanoidDiedConn = nil;
    end;
    v90.offsetMotor:destroy();
    if v90.selfViewVisibilityUpdatedSignal then
        v90.selfViewVisibilityUpdatedSignal:disconnect();
        v90.selfViewVisibilityUpdatedSignal = nil;
    end;
    if not (((not v37 or not v90.state.isInEasierUnmutingTreatment) or not v39) or not v90.participantsUpdateConnection) then
        v90.participantsUpdateConnection:Disconnect();
        v90.participantsUpdateConnection = nil;
    end;
end;
local function v96(...)
    local l_BindableEvent_0 = Instance.new("BindableEvent");
    local v92 = {
        ...
    };
    local function v94(...)
        for v93 = 1, #v92 do
            v92[v93]:Disconnect();
        end;
        return l_BindableEvent_0:Fire(...);
    end;
    for v95 = 1, #v92 do
        v92[v95] = v92[v95]:Connect(v94);
    end;
    return l_BindableEvent_0.Event:Wait();
end;
local function v102(v97, v98, v99)
    for _, v101 in ipairs(v97:GetChildren()) do
        if not (not (v101.Name == v98) or not v101:IsA(v99)) then
            return v101;
        end;
    end;
end;
v45.onCharacterAdded = function(v103, v104, v105)
    if not v105.Parent then
        v96(v105.AncestryChanged, v104.CharacterAdded);
    end;
    if v104.Character == v105 and v105.Parent then
        local l_Humanoid_0 = v105:FindFirstChildOfClass("Humanoid");
        while not (not v105:IsDescendantOf(game) or l_Humanoid_0) do
            v96(v105.ChildAdded, v105.AncestryChanged, v104.CharacterAdded);
            l_Humanoid_0 = v105:FindFirstChildOfClass("Humanoid");
        end;
        if v104.Character == v105 and v105:IsDescendantOf(game) then
            local v107 = nil;
            v107 = if not v29() then v105:FindFirstChild("HumanoidRootPart") else v105.PrimaryPart;
            while not (not v105:IsDescendantOf(game) or v107) do
                v96(v105.ChildAdded, v105.AncestryChanged, v104.CharacterAdded);
                if not v29() then
                    v107 = v105:FindFirstChild("HumanoidRootPart");
                else
                    v107 = v105.PrimaryPart;
                end;
            end;
            if not (not (not (not v107 or not v105:IsDescendantOf(game)) and v104.Character == v105) or not v103.isMounted) then
                v103:setState({
                    adornee = l_Humanoid_0.Health == 0 and v102(v105, "Head", "BasePart") or v105
                });
                if v103.humanoidDiedConn then
                    v103.humanoidDiedConn:Disconnect();
                    v103.humanoidDiedConn = nil;
                end;
                v103.humanoidDiedConn = l_Humanoid_0.Died:Connect(function()
                    v103:setState({
                        adornee = v102(v105, "Head", "BasePart") or v105
                    });
                end);
            end;
            return ;
        else
            v7:debug("Mismatched or unparented character in onCharacterAdded for {}", v103.state.shortId);
            return ;
        end;
    else
        v7:debug("Mismatched or unparented character in onCharacterAdded for {}", v103.state.shortId);
        return ;
    end;
end;
v45.getVerticalOffset = function(v108, v109)
    if not v109 or not v109:IsA("Model") then
        if not v109 or not v109:IsA("BasePart") then
            return 0;
        else
            return v109.Size.Y / 2;
        end;
    else
        local l_v109_BoundingBox_0, v111 = v109:GetBoundingBox();
        local v112 = v108:getAdorneeInstance(v109);
        if v112 then
            if not v112:IsA("BasePart") then
                return 0;
            else
                return v111.Y / 2 - l_v109_BoundingBox_0:PointToObjectSpace(v112.Position).Y;
            end;
        else
            return v111.Y / 2;
        end;
    end;
end;
v45.getAdorneeInstance = function(v113, v114)
    if v114 then
        if not v114:IsA("Model") then
            if not (not v114:IsA("BasePart") and not v114:IsA("Attachment")) then
                return v114;
            end;
        else
            local l_v114_FirstChild_0 = v114:FindFirstChild(v113.state.savedChatSettings.AdorneeName, true);
            if v29() then
                l_v114_FirstChild_0 = l_v114_FirstChild_0 or v114.PrimaryPart;
            end;
            if not (not (not l_v114_FirstChild_0 or l_v114_FirstChild_0:IsA("BasePart")) and not l_v114_FirstChild_0:IsA("Attachment")) then
                return l_v114_FirstChild_0;
            end;
        end;
        return ;
    else
        return ;
    end;
end;
v45.getPermissions = function(v116)
    return v13(function(v117)
        v116:setState({
            hasCameraPermissions = v117.hasCameraPermissions, 
            hasMicPermissions = v117.hasMicPermissions
        });
    end, nil, nil, "BubbleChatBillboard.getPermissions");
end;
v45.getMicPermission = function(v118)
    v13(function(v119)
        v118:setState({
            hasMicPermissions = v119.hasMicPermissions
        });
    end, {
        l_default_0.Permissions.MICROPHONE_ACCESS
    }, nil, "BubbleChatBillboard.getMicPermission");
end;
v45.getCameraPermissionWithoutRequest = function(v120)
    v13(function(v121)
        v120:setState({
            hasCameraPermissions = v121.hasCameraPermissions
        });
    end, {
        l_default_0.Permissions.CAMERA_ACCESS
    }, true);
end;
v45.setCameraPermissionStateFromControl = function(v122, v123)
    v122:setState({
        hasCameraPermissions = v123
    });
end;
v45.getRenderVoiceAndCameraBubble = function(v124)
    if (v124.props.voiceEnabled or v34) or v30 then
        if not (v124.props.userId == tostring(l_Players_0.LocalPlayer.UserId)) then
            if (v124.props.voiceEnabled and not v124.state.voiceTimedOut) and ((not v124.props.bubbleChatEnabled or not v124.props.messageIds) or #v124.props.messageIds == 0) then
                return true;
            else
                return false;
            end;
        elseif not (v35 and l_VRService_0.VREnabled) and not v23() then
            if v124.state.selfViewOpen then
                return false;
            else
                return true;
            end;
        else
            return false;
        end;
    else
        return false;
    end;
end;
v45.shouldRenderCarat = function(v125)
    return v125.props.chatSettings.TailVisible and not v125:getRenderVoiceAndCameraBubble();
end;
v45.render = function(v126)
    local v127 = v126:getAdorneeInstance(v126.state.adornee);
    local v128 = v126.props.userId == tostring(l_Players_0.LocalPlayer.UserId);
    local l_savedChatSettings_0 = v126.state.savedChatSettings;
    if v127 then
        if v126.state.isInsideRenderDistance then
            if not (not (not v37 or not v126.state.isInEasierUnmutingTreatment) and v126.props.voiceState == v20.VOICE_STATE.LOCAL_MUTED) or v126.state.isInsideEasierUnmutingDistance and (not v39 or not v126.state.isMuted) then
                local v130 = {};
                local v131 = nil;
                local v132 = v126.props.voiceEnabled and not v126.state.voiceTimedOut;
                if not (not v30 or not v128) then
                    v132 = v132 and not v126.state.selfViewOpen;
                end;
                if not (not (v35 and l_VRService_0.VREnabled) and not v23() or not v128) then
                    v132 = false;
                end;
                if not v30 then
                    if v132 and ((not v126.props.bubbleChatEnabled or not v126.props.messageIds) or #v126.props.messageIds == 0) then
                        v130.VoiceBubble = v8.createElement(v16, {
                            chatSettings = l_savedChatSettings_0, 
                            renderInsert = v126.renderInsert, 
                            insertSize = v126.insertSize, 
                            isDistant = not v126.state.isInsideMaximizeDistance
                        });
                    end;
                elseif v126:getRenderVoiceAndCameraBubble() then
                    local v134 = {
                        chatSettings = l_savedChatSettings_0, 
                        isInsideMaximizeDistance = v126.state.isInsideMaximizeDistance, 
                        LayoutOrder = 2, 
                        isLocalPlayer = v128, 
                        hasCameraPermissions = v126.state.hasCameraPermissions, 
                        hasMicPermissions = v126.state.hasMicPermissions, 
                        userId = v126.props.userId, 
                        voiceEnabled = v126.props.voiceEnabled, 
                        setCameraPermissionStateFromControl = function(v133)
                            if v44() then
                                v126:setCameraPermissionStateFromControl(v133);
                            end;
                        end, 
                        isShowingDueToEasierUnmuting = v126:isShowingDueToEasierUnmuting()
                    };
                    v130.VoiceAndCameraBubble = not not v31 and v8.createElement(v47, v134) or v8.createElement(v17, v134);
                    v130.listLayout = v8.createElement("UIListLayout", {
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        VerticalAlignment = Enum.VerticalAlignment.Bottom, 
                        Padding = UDim.new(0, 8)
                    });
                    v130.padding = v8.createElement("UIPadding", {
                        PaddingBottom = UDim.new(0, 8)
                    });
                end;
                if v126.state.hasMessage then
                    if not v126.state.isInsideMaximizeDistance then
                        v130.DistantBubble = v8.createElement(v15, {
                            fadingOut = not v126.props.messageIds or #v126.props.messageIds == 0, 
                            onFadeOut = v126.onLastBubbleFadeOut, 
                            chatSettings = l_savedChatSettings_0, 
                            renderInsert = v132 and v126.renderInsert, 
                            insertSize = v126.insertSize
                        });
                    else
                        v130.BubbleChatList = v8.createElement(v14, {
                            userId = v126.props.userId, 
                            isVisible = v126.state.isInsideMaximizeDistance, 
                            onLastBubbleFadeOut = v126.onLastBubbleFadeOut, 
                            chatSettings = l_savedChatSettings_0, 
                            renderFirstInsert = if not v30 and v132 then v126.renderInsert else nil, 
                            insertSize = v126.insertSize, 
                            showCarat = v126:shouldRenderCarat()
                        });
                    end;
                end;
                v131 = v132;
                if v30 then
                    v131 = v126:getRenderVoiceAndCameraBubble();
                end;
                return v8.createElement("BillboardGui", {
                    Adornee = v127, 
                    Active = v131, 
                    Size = UDim2.fromOffset(500, 200), 
                    SizeOffset = Vector2.new(0, 0.5), 
                    StudsOffset = (not not v128 and l_savedChatSettings_0.LocalPlayerStudsOffset or Vector3.new(0, 1, 0.1)) + Vector3.new(0, l_savedChatSettings_0.VerticalStudsOffset, 0), 
                    StudsOffsetWorldSpace = v126.offset, 
                    ResetOnSpawn = false
                }, v130);
            else
                v7:trace("Unmute toggle not applicable for {}", v126.state.shortId);
                return ;
            end;
        else
            v7:trace("Not in range for {}", v126.state.shortId);
            return ;
        end;
    else
        v7:trace("No adornee for {}", v126.state.shortId);
        return ;
    end;
end;
v45.didUpdate = function(v135, _, v137)
    if not (not (not v135.props.messageIds or #v135.props.messageIds == 0) or v135.state.isInsideRenderDistance) then
        v135.onLastBubbleFadeOut();
    end;
    if v135.props.messageIds and #v135.props.messageIds > 0 then
        v135.isFadingOut = false;
    end;
    if not v37 or not v135.state.isInEasierUnmutingTreatment then
        v135:checkCounterForTimeout(v137.voiceStateCounter);
    else
        v135:checkCounterForTimeoutWithEasierUnmuting(v137);
    end;
    local v138 = v135.props.userId == tostring(l_Players_0.LocalPlayer.UserId);
    if not ((not v37 or not v138) or v135.state.haveLoggedUserExposure) and (not (v135.props.voiceState ~= v20.VOICE_STATE.INACTIVE and v135.props.voiceState ~= v20.VOICE_STATE.TALKING) or v135.props.voiceState == v20.VOICE_STATE.MUTED) then
        v36:LogUserLayerExposure(v41);
        v135:setState({
            haveLoggedUserExposure = true
        });
    end;
end;
v45.getDerivedStateFromProps = function(v139, v140)
    local v141 = "..." .. string.sub(tostring(v139.userId), -4);
    local v142 = (not v140.hasMessage and v139.messageIds) and #v139.messageIds > 0;
    local v143 = nil;
    local v144 = nil;
    local v145 = nil;
    if v140.lastVoiceState ~= v139.voiceState then
        v144 = (v140.voiceStateCounter or 0) + 1;
        v145 = false;
        v143 = v139.voiceState;
    end;
    return {
        hasMessage = v142 or nil, 
        savedChatSettings = v139.lastMessage and v139.chatSettings, 
        shortId = v141, 
        voiceStateCounter = v144, 
        voiceTimedOut = v145, 
        lastVoiceState = v143
    };
end;
return v9.connect(function(v146, v147)
    local v148 = v146.userMessages[v147.userId];
    local l_v148_0 = v148;
    if l_v148_0 then
        l_v148_0 = false;
        if #v148 >= 1 then
            l_v148_0 = v148[#v148];
        end;
    end;
    local v150 = l_v148_0 and v146.messages[l_v148_0];
    return {
        chatSettings = v21(v146.chatSettings, v150), 
        messageIds = v148, 
        lastMessage = v150, 
        voiceState = v146.voiceState[v147.userId]
    };
end)(v45);
