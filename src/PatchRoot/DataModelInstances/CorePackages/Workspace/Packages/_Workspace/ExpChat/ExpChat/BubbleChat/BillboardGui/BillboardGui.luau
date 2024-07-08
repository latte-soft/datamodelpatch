local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local v1 = require(l_script_FirstAncestor_0.Logger):new("ExpChat/" .. script.Name);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.Roact);
local v4 = require(l_Parent_0.RoactRodux);
local l_List_0 = require(l_Parent_0.llama).List;
local v6 = require(l_Parent_0.Otter);
local l_Players_0 = game:GetService("Players");
local l_RunService_0 = game:GetService("RunService");
local l_StarterGui_0 = game:GetService("StarterGui");
local l_VRService_0 = game:GetService("VRService");
local v11 = require(l_script_FirstAncestor_0.memoize);
local l_script_FirstAncestor_1 = script:FindFirstAncestor("BubbleChat");
local v13 = require(l_script_FirstAncestor_1.VoiceIndicator);
local v14 = require(l_script_FirstAncestor_1.BlankBubble);
local v15 = require(l_script_FirstAncestor_1.BubbleChatList);
local v16 = require(l_script_FirstAncestor_1.ChatBubbleDistant);
local v17 = require(l_script_FirstAncestor_0.GlobalFlags);
local v18 = require(l_script_FirstAncestor_1.Helpers.getSettingsForMessage);
local v19 = game:DefineFastFlag("SelfViewNoApi", false);
local v20 = require(l_script_FirstAncestor_0.Flags.getFFlagHideLocalPlayerControlBubbleForVR);
local v21 = require(l_script_FirstAncestor_1.PlayerButtons);
local v22 = require(l_script_FirstAncestor_0.IXPServiceWrapper);
local v23 = game:DefineFastFlag("EasierUnmutingTCS4", false);
local v24 = game:DefineFastFlag("EasierUnmutingBasedOnCameraTCS", false);
local v25 = game:DefineFastFlag("EasierUnmutingHideIfMutedTCS", false);
local v26 = game:DefineFastInt("EasierUnmutingDisplayDistanceTCS", 20);
local v27 = game:DefineFastString("EasierUnmutingIXPLayerNameTCS", "Voice.UserAgency");
local v28 = game:DefineFastString("EasierUnmutingIXPLayerValueTCS", "VoiceUserAgencyEnabled");
local v29 = game:DefineFastFlag("FixTimestampNowComparisonForChatMessages", false);
local v30 = require(l_script_FirstAncestor_0.Flags.getFFlagEnableExperienceChatOptimizations);
local v31 = game:DefineFastInt("ExperienceChatHeartbeatIncrement", 5);
local v32 = require(l_script_FirstAncestor_0.Flags.getFFlagFixBubbleChatTailVisible);
local v33 = Vector2.new(28, 28);
local v34 = v3.PureComponent:extend("BubbleChatBillboard");
local v35 = {
    dampingRatio = 1, 
    frequency = 4
};
getEasierUnmutingDistance = function(v36, v37)
    local v38 = workspace.CurrentCamera and workspace.CurrentCamera.CFrame.Position;
    if (not v24 and v37 or not v36) or not v38 then
        if not v36 or not v37 then
            return nil;
        else
            return (v36 - v37).Magnitude;
        end;
    else
        return (v36 - v38).Magnitude;
    end;
end;
v34.isShowingDueToEasierUnmuting = function(v39)
    local l_v23_0 = v23;
    if l_v23_0 then
        l_v23_0 = v39.state.isInEasierUnmutingTreatment;
        if l_v23_0 then
            l_v23_0 = false;
            if v39.props.voiceState == "LOCAL_MUTED" then
                l_v23_0 = v39.state.isInsideEasierUnmutingDistance and not (v25 and v39.props.isMuted);
            end;
        end;
    end;
    return l_v23_0;
end;
v34.init = function(v41)
    local v42 = nil;
    local v43 = nil;
    if v17.AvatarChatEnabled then
        v42 = v41.props.selfViewListenerChanged.getSelfViewVisibility();
        v43 = (v19 or l_StarterGui_0:GetCoreGuiEnabled(Enum.CoreGuiType.All)) or l_StarterGui_0:GetCoreGuiEnabled(Enum.CoreGuiType.SelfView);
    end;
    v41:setState({
        isInsideRenderDistance = false, 
        isInsideMaximizeDistance = false, 
        isInsideEasierUnmutingDistance = if not v23 then nil else false, 
        savedChatSettings = v41.props.chatSettings, 
        selfViewOpen = v42, 
        selfViewEnabled = v43, 
        voiceTimedOut = false, 
        voiceStateCounter = 0, 
        lastVoiceState = nil, 
        isInEasierUnmutingTreatment = if not v23 then nil else false, 
        haveLoggedUserExposure = if not v23 then nil else false
    });
    v41.isMounted = false;
    local v44, v45 = v3.createBinding((Vector3.new()));
    v41.offset = v44;
    v41.updateOffset = v45;
    v41.offsetMotor = v6.createSingleMotor(0);
    v41.offsetMotor:onStep(function(v46)
        v41.updateOffset((Vector3.new(0, v46, 0)));
    end);
    v41.offsetGoal = 0;
    if v30() then
        v41.heartbeatCount = 0;
    end;
    v41.onLastBubbleFadeOut = function()
        if not (not v41.props.onFadeOut or v41.isFadingOut) then
            v41.isFadingOut = true;
            v41.props.onFadeOut(v41.props.userId);
        end;
    end;
    v41.wrappedOnClickVoiceIndicator = function(v47, v48)
        return v41.props.onClickedVoiceIndicator(v47, v48, not v41:isShowingDueToEasierUnmuting() and "bubblechat" or "easierunmuting");
    end;
    v44 = l_Players_0.LocalPlayer;
    v45 = not v44 and "SpeakerDark" or (v41.props.userId ~= tostring(v44.UserId) and "SpeakerDark" or "MicDark");
    v41.renderInsert = function()
        return v3.createElement(v13, {
            userId = v41.props.userId, 
            getIcon = v41.props.getIconVoiceIndicator, 
            onClicked = v41.wrappedOnClickVoiceIndicator, 
            iconStyle = v45
        });
    end;
    if v17.AvatarChatEnabled then
        local l_selfViewVisibilityUpdatedSignal_0 = v41.props.selfViewListenerChanged.selfViewVisibilityUpdatedSignal;
        local l_getSelfViewVisibility_0 = v41.props.selfViewListenerChanged.getSelfViewVisibility;
        local l_l_getSelfViewVisibility_0_0 = l_getSelfViewVisibility_0 --[[ copy: 6 -> 7 ]];
        v41.selfViewConnection = l_selfViewVisibilityUpdatedSignal_0:connect(function()
            v41:setState({
                selfViewOpen = l_l_getSelfViewVisibility_0_0()
            });
        end);
    end;
    if v23 then
        local l_status_0, l_result_0 = pcall(function()
            return v22:GetLayerData(v27);
        end);
        if not ((not l_status_0 or not l_result_0) or not l_result_0[v28]) then
            v41:setState({
                isInEasierUnmutingTreatment = true
            });
        end;
    end;
end;
v34.checkCounterForTimeout = function(v54, v55)
    if ((l_Players_0.LocalPlayer and v54.props.userId ~= tostring(l_Players_0.LocalPlayer.UserId)) and v54.state.lastVoiceState ~= "Talking") and v54.state.voiceStateCounter ~= v55 then
        local l_voiceStateCounter_0 = v54.state.voiceStateCounter;
        delay(1, function()
            if not (not (v54.state.voiceStateCounter == l_voiceStateCounter_0) or not v54.isMounted) then
                v54:setState({
                    voiceTimedOut = true
                });
            end;
        end);
    end;
end;
v34.checkCounterForTimeoutWithEasierUnmuting = function(v57, v58)
    local v59 = if not v58 then nil else v58.voiceStateCounter;
    if v23 and v57.state.isInEasierUnmutingTreatment then
        local v60 = not not l_Players_0.LocalPlayer and v57.props.userId ~= tostring(l_Players_0.LocalPlayer.UserId);
        local v61 = v57.state.voiceStateCounter ~= v59;
        local v62 = false;
        if v57.state.lastVoiceState ~= "Talking" then
            v62 = v57.state.lastVoiceState ~= "LOCAL_MUTED";
        end;
        if not ((not v60 or not v61) or not v62) then
            local l_voiceStateCounter_1 = v57.state.voiceStateCounter;
            delay(1, function()
                if not (not (v57.state.voiceStateCounter == l_voiceStateCounter_1) or not v57.isMounted) then
                    v57:setState({
                        voiceTimedOut = true
                    });
                end;
            end);
        end;
        return ;
    else
        return v57:checkCounterForTimeout(v59);
    end;
end;
v34.getVerticalOffset = function(v64)
    local l_adornee_0 = v64.props.adornee;
    if not l_adornee_0 or not l_adornee_0:IsA("Model") then
        if not l_adornee_0 or not l_adornee_0:IsA("BasePart") then
            return 0;
        else
            return l_adornee_0.Size.Y / 2;
        end;
    else
        local l_l_adornee_0_BoundingBox_0, v67 = l_adornee_0:GetBoundingBox();
        local v68 = getAdorneeInstance(v64.props.adornee, v64.state.savedChatSettings.AdorneeName);
        if v68 then
            if not v68:IsA("BasePart") then
                return 0;
            else
                return v67.Y / 2 - l_l_adornee_0_BoundingBox_0:PointToObjectSpace(v68.Position).Y;
            end;
        else
            return v67.Y / 2;
        end;
    end;
end;
getAdorneeInstance = function(v69, v70)
    if v69 then
        if not v69:IsA("Model") then
            if not (not v69:IsA("BasePart") and not v69:IsA("Attachment")) then
                return v69;
            end;
        else
            local v71 = v69:FindFirstChild(v70, true) or v69.PrimaryPart;
            if not (not (not v71 or v71:IsA("BasePart")) and not v71:IsA("Attachment")) then
                return v71;
            end;
        end;
        return nil;
    else
        return nil;
    end;
end;
v34.shouldRenderCaret = function(v72)
    return v72.state.savedChatSettings.TailVisible and not v72:shouldRenderPlayerButtons();
end;
v34.shouldRenderPlayerButtons = function(v73)
    if not v32() or v73.props.voiceEnabled then
        if not (not not l_Players_0.LocalPlayer and v73.props.userId == tostring(l_Players_0.LocalPlayer.UserId)) then
            local v74 = not v73.state.filteredMessages or #v73.state.filteredMessages == 0;
            if not (v73.props.voiceEnabled and not v73.state.voiceTimedOut) or v73.props.isBubbleChatEnabled and not v74 then
                return false;
            else
                return true;
            end;
        elseif not (v20() and l_VRService_0.VREnabled) and not v17.ChromeEnabled then
            if v73.state.selfViewOpen then
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
v34.render = function(v75)
    local v76 = getAdorneeInstance(v75.props.adornee, v75.state.savedChatSettings.AdorneeName);
    local v77 = not not l_Players_0.LocalPlayer and v75.props.userId == tostring(l_Players_0.LocalPlayer.UserId);
    local l_savedChatSettings_0 = v75.state.savedChatSettings;
    if v76 then
        if v75.state.isInsideRenderDistance then
            if not (not (not v23 or not v75.state.isInEasierUnmutingTreatment) and v75.props.voiceState == "LOCAL_MUTED") or v75.state.isInsideEasierUnmutingDistance and (not v25 or not v75.props.isMuted) then
                local v79 = {};
                local v80 = v75.state.filteredMessages and #v75.state.filteredMessages > 0;
                local v81 = v75.props.voiceEnabled and not v75.state.voiceTimedOut;
                if not (not v17.AvatarChatEnabled or not v77) then
                    v81 = v81 and not v75.state.selfViewOpen;
                end;
                if not (not v17.ChromeEnabled or not v77) then
                    v81 = false;
                end;
                local v82 = v81 and not v17.AvatarChatEnabled;
                local v83 = if not v81 then nil else v75.renderInsert;
                local l_v33_0 = v33;
                local l_clientSettings_0 = v75.props.clientSettings;
                if not v17.AvatarChatEnabled and not v17.ChromeEnabled then
                    if v81 and v80 == false then
                        v79.VoiceBubble = v3.createElement(v14, {
                            chatSettings = l_savedChatSettings_0, 
                            userId = v75.props.userId, 
                            renderInsert = v83, 
                            insertSize = l_v33_0, 
                            isDistant = not v75.state.isInsideMaximizeDistance, 
                            clientSettings = l_clientSettings_0
                        });
                    end;
                elseif v75:shouldRenderPlayerButtons() then
                    v79.PlayerButtons = v3.createElement(v21, {
                        chatSettings = v75.props.chatSettings, 
                        isInsideMaximizeDistance = v75.state.isInsideMaximizeDistance, 
                        LayoutOrder = 2, 
                        isLocalPlayer = v77, 
                        userId = v75.props.userId, 
                        getIcon = v75.props.getIconVoiceIndicator, 
                        hasCameraPermissions = v75.props.hasCameraPermissions, 
                        hasMicPermissions = v75.props.hasMicPermissions, 
                        onClickedVoiceIndicator = v75.wrappedOnClickVoiceIndicator, 
                        onClickedCameraIndicator = v75.props.onClickedCameraIndicator, 
                        voiceEnabled = v75.props.voiceEnabled, 
                        displayCameraDeniedToast = v75.props.displayCameraDeniedToast, 
                        isCamEnabledForUserAndPlace = v75.props.isCamEnabledForUserAndPlace, 
                        setCameraPermissionStateFromControl = v75.props.setCameraPermissionStateFromControl, 
                        getPermissions = v75.props.getPermissions, 
                        isCameraOnlyUser = v75.props.isCameraOnlyUser, 
                        isVoiceServiceInitialized = v75.props.isVoiceServiceInitialized
                    });
                    v79.listLayout = v3.createElement("UIListLayout", {
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        VerticalAlignment = Enum.VerticalAlignment.Bottom, 
                        Padding = UDim.new(0, 8)
                    });
                    v79.padding = v3.createElement("UIPadding", {
                        PaddingBottom = UDim.new(0, 8)
                    });
                end;
                local v86 = if not v32() then nil else v75:shouldRenderCaret();
                if not v75.state.isInsideMaximizeDistance then
                    if v80 then
                        v79.DistantBubble = v3.createElement(v16, {
                            fadingOut = not v75.state.filteredMessages or #v75.state.filteredMessages == 0, 
                            onFadeOut = v75.onLastBubbleFadeOut, 
                            chatSettings = l_savedChatSettings_0, 
                            renderInsert = if not v82 then nil else v83, 
                            insertSize = l_v33_0, 
                            clientSettings = l_clientSettings_0, 
                            showCaret = v86
                        });
                    end;
                else
                    v79.BubbleChatList = v3.createElement(v15, {
                        userId = v75.props.userId, 
                        isVisible = v75.state.isInsideMaximizeDistance, 
                        onLastBubbleFadeOut = v75.onLastBubbleFadeOut, 
                        chatSettings = l_savedChatSettings_0, 
                        renderFirstInsert = if not v82 then nil else v83, 
                        insertSize = l_v33_0, 
                        messages = v75.state.filteredMessages, 
                        clientSettings = l_clientSettings_0, 
                        isTextChatServiceOn = v75.props.isTextChatServiceOn, 
                        showCaret = v86
                    });
                end;
                return v3.createElement("BillboardGui", {
                    Adornee = v76, 
                    Active = if not v17.AvatarChatEnabled then v81 else v75:shouldRenderPlayerButtons(), 
                    Size = UDim2.fromOffset(500, 200), 
                    SizeOffset = Vector2.new(0, 0.5), 
                    StudsOffset = (not not v77 and l_savedChatSettings_0.LocalPlayerStudsOffset or Vector3.new(0, 1, 0.1)) + Vector3.new(0, l_savedChatSettings_0.VerticalStudsOffset, 0), 
                    StudsOffsetWorldSpace = v75.offset, 
                    ResetOnSpawn = false
                }, v79);
            else
                v1:trace("Unmute toggle not applicable for {}", v75.state.shortId);
                return ;
            end;
        else
            v1:trace("Not in range for {}", v75.state.shortId);
            return ;
        end;
    else
        v1:trace("No adornee for {}", v75.state.shortId);
        return ;
    end;
end;
v34.didUpdate = function(v87, _, v89)
    if not (not (not v87.state.filteredMessages or #v87.state.filteredMessages == 0) or v87.state.isInsideRenderDistance) then
        v87.onLastBubbleFadeOut();
    end;
    if v87.state.filteredMessages and #v87.state.filteredMessages > 0 then
        v87.isFadingOut = false;
    end;
    if not v23 or not v87.state.isInEasierUnmutingTreatment then
        v87:checkCounterForTimeout(v89.voiceStateCounter);
    else
        v87:checkCounterForTimeoutWithEasierUnmuting(v89);
    end;
    local v90 = v87.props.userId == tostring(not l_Players_0.LocalPlayer and 0 or l_Players_0.LocalPlayer.UserId);
    if not ((not v23 or not v90) or v87.state.haveLoggedUserExposure) and (not (v87.props.voiceState ~= "Inactive" and v87.props.voiceState ~= "Talking") or v87.props.voiceState == "Muted") then
        v22:LogUserLayerExposure(v27);
        v87:setState({
            haveLoggedUserExposure = true
        });
    end;
end;
local function v98(v91, v92, v93)
    local v94 = not not v29 and workspace:GetServerTimeNow() * 1000 or DateTime.now().UnixTimestampMillis;
    return l_List_0.filter(v91, function(v95, v96)
        if not v95.isVisibleInBubbleChat then
            return false;
        else
            local v97 = false;
            if #v91 - v93 < v96 then
                v97 = v94 - v95.timestamp.UnixTimestampMillis < v92;
            end;
            return v97;
        end;
    end);
end;
v34.didMount = function(v99)
    v99.isMounted = true;
    local v100 = v99:getVerticalOffset();
    v99.offsetGoal = v100;
    v99.offsetMotor:setGoal(v6.instant(v100));
    v99.heartbeatConn = l_RunService_0.Heartbeat:Connect(function()
        if not (not v30() or v99.props.tests_skipHeartbeatCheck) then
            if v99.heartbeatCount < v31 then
                local l_v99_0 = v99;
                l_v99_0.heartbeatCount = l_v99_0.heartbeatCount + 1;
                return ;
            else
                v99.heartbeatCount = 0;
            end;
        end;
        local v102 = getAdorneeInstance(v99.props.adornee, v99.state.savedChatSettings.AdorneeName);
        if not (not workspace.CurrentCamera or not v102) then
            local v103 = if not v102:IsA("Attachment") then v102.Position else v102.WorldPosition;
            local l_Magnitude_0 = (workspace.CurrentCamera.CFrame.Position - v103).Magnitude;
            local v105 = l_Magnitude_0 < v99.state.savedChatSettings.MaxDistance;
            local v106 = l_Magnitude_0 < v99.state.savedChatSettings.MinimizeDistance;
            local v107 = false;
            if not (not v23 or not v99.state.isInEasierUnmutingTreatment) then
                local v108 = nil;
                local v109 = getAdorneeInstance(v99.props.localAdornee, v99.state.savedChatSettings.AdorneeName);
                if v109 then
                    v108 = if not v109:IsA("Attachment") then v109.Position else v109.WorldPosition;
                end;
                local v110 = getEasierUnmutingDistance(v103, v108);
                if v110 ~= nil then
                    v107 = v110 < v26;
                end;
            end;
            if not (v106 == v99.state.isInsideMaximizeDistance and v105 == v99.state.isInsideRenderDistance) or not (not v23 or not v99.state.isInEasierUnmutingTreatment) and v107 ~= v99.state.isInsideEasierUnmutingDistance then
                v99:setState({
                    isInsideRenderDistance = v105, 
                    isInsideMaximizeDistance = v106, 
                    isInsideEasierUnmutingDistance = v107
                });
            end;
        end;
        local v111 = v99:getVerticalOffset();
        if math.abs(v111 - v99.offsetGoal) > 0.5 then
            v99.offsetGoal = v111;
            v99.offsetMotor:setGoal(v6.spring(v111, v35));
        end;
        local v112 = not not v29 and workspace:GetServerTimeNow() * 1000 or DateTime.now().UnixTimestampMillis;
        local v113 = v99.state.savedChatSettings.BubbleDuration * 1000;
        for _, v115 in ipairs(v99.state.filteredMessages) do
            if v113 <= v112 - v115.timestamp.UnixTimestampMillis then
                v99:setState(function(v116)
                    return {
                        filteredMessages = v98(v116.filteredMessages, v113, v99.props.chatSettings.MaxBubbles)
                    };
                end);
                return ;
            end;
        end;
    end);
    if not v23 or not v99.state.isInEasierUnmutingTreatment then
        v99:checkCounterForTimeout(nil);
        return ;
    else
        v99:checkCounterForTimeoutWithEasierUnmuting(nil);
        return ;
    end;
end;
v34.willUnmount = function(v117)
    v1:trace("Unmounting billboards for {}", v117.state.shortId);
    v117.isMounted = false;
    if v117.characterConn then
        v117.characterConn:Disconnect();
        v117.characterConn = nil;
    end;
    if v117.heartbeatConn then
        v117.heartbeatConn:Disconnect();
        v117.heartbeatConn = nil;
    end;
    if v117.humanoidDiedConn then
        v117.humanoidDiedConn:Disconnect();
        v117.humanoidDiedConn = nil;
    end;
    if v117.selfViewConnection then
        v117.selfViewConnection:disconnect();
        v117.selfViewConnection = nil;
    end;
    v117.offsetMotor:destroy();
end;
v34.getDerivedStateFromProps = function(v118, v119)
    local v120 = "..." .. string.sub(tostring(v118.userId), -4);
    local v121 = nil;
    local v122 = nil;
    local v123 = nil;
    if v119.lastVoiceState ~= v118.voiceState then
        v122 = (v119.voiceStateCounter or 0) + 1;
        v123 = false;
        v121 = v118.voiceState;
    end;
    return {
        savedChatSettings = v118.lastMessage and v118.chatSettings, 
        shortId = v120, 
        filteredMessages = v98(v118.messages, v119.savedChatSettings.BubbleDuration * 1000, v119.savedChatSettings.MaxBubbles), 
        voiceStateCounter = v122, 
        voiceTimedOut = v123, 
        lastVoiceState = v121
    };
end;
local v127 = v11(function(v124, v125)
    return l_List_0.map(v124.bubbleMessagesInOrderBySenderId[v125] or {}, function(v126)
        return v124.byMessageId[v126];
    end);
end);
return v4.connect(function(v128, v129)
    local v130 = v127(v128.Messages, v129.userId);
    local v131 = v130[#v130];
    local v132 = not l_Players_0.LocalPlayer and "" or tostring(l_Players_0.LocalPlayer.UserId);
    local _ = nil;
    return {
        messages = v130, 
        lastMessage = v131, 
        chatSettings = if not v129.isTextChatServiceOn then v18(v128.LegacyBubbleChatSettings, v131) else v128.BubbleChatSettings, 
        adornee = v128.Adornees[v129.userId] or v129.partOrModel, 
        clientSettings = v128.ClientSettings, 
        isMuted = v128.Voice.participantsMuted[v129.userId] or false, 
        localAdornee = if not v23 then nil else v128.Adornees[v132]
    };
end)(v34);
