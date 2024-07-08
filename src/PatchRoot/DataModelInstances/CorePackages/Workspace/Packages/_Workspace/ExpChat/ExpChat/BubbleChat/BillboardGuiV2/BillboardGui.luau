local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local v1 = require(l_script_FirstAncestor_0.Logger):new("ExpChat/" .. script.Name);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_CorePackages_0 = game:GetService("CorePackages");
local v4 = require(l_Parent_0.React);
local l_List_0 = require(l_Parent_0.llama).List;
local v6 = require(l_Parent_0.Otter);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_Players_0 = game:GetService("Players");
local l_RunService_0 = game:GetService("RunService");
local l_VRService_0 = game:GetService("VRService");
local l_Workspace_0 = game:GetService("Workspace");
local l_script_FirstAncestor_1 = script:FindFirstAncestor("BubbleChat");
local v13 = require(l_script_FirstAncestor_1.VoiceIndicator);
local v14 = require(l_script_FirstAncestor_1.BlankBubble);
local v15 = require(l_script_FirstAncestor_1.BubbleChatList);
local v16 = require(l_script_FirstAncestor_1.ChatBubbleDistant);
local v17 = require(l_script_FirstAncestor_0.GlobalFlags);
local v18 = require(l_script_FirstAncestor_1.Helpers.getSettingsForMessage);
local v19 = require(l_script_FirstAncestor_0.Flags.getFFlagHideLocalPlayerControlBubbleForVR);
local v20 = require(l_script_FirstAncestor_1.PlayerButtons);
local _ = require(l_script_FirstAncestor_0.Actions.VoiceStateChanged);
local v22 = require(l_script_FirstAncestor_0.IXPServiceWrapper);
local v23 = game:DefineFastFlag("EasierUnmutingTCS4", false);
local v24 = game:DefineFastFlag("EasierUnmutingBasedOnCameraTCS", false);
local v25 = game:DefineFastFlag("EasierUnmutingHideIfMutedTCS", false);
local v26 = game:DefineFastInt("EasierUnmutingDisplayDistanceTCS", 20);
local v27 = game:DefineFastString("EasierUnmutingIXPLayerNameTCS", "Voice.UserAgency");
local v28 = game:DefineFastString("EasierUnmutingIXPLayerValueTCS", "VoiceUserAgencyEnabled");
local v29 = game:DefineFastFlag("FixTimestampNowComparisonForChatMessages", false);
local v30 = game:DefineFastInt("ExperienceChatHeartbeatIncrement", 5);
local v31 = require(l_script_FirstAncestor_0.Flags.getFFlagFixBubbleChatTailVisible);
local v32 = Vector2.new(28, 28);
local v33 = {
    dampingRatio = 1, 
    frequency = 4
};
getEasierUnmutingDistance = function(v34, v35)
    local v36 = l_Workspace_0.CurrentCamera and l_Workspace_0.CurrentCamera.CFrame.Position;
    if (not v24 and v35 or not v34) or not v36 then
        if not v34 or not v35 then
            return nil;
        else
            return (v34 - v35).Magnitude;
        end;
    else
        return (v34 - v36).Magnitude;
    end;
end;
getAdorneeInstance = function(v37, v38)
    if v37 then
        if not v37:IsA("Model") then
            if not (not v37:IsA("BasePart") and not v37:IsA("Attachment")) then
                return v37;
            end;
        else
            local v39 = v37:FindFirstChild(v38, true) or v37.PrimaryPart;
            if not (not (not v39 or v39:IsA("BasePart")) and not v39:IsA("Attachment")) then
                return v39;
            end;
        end;
        return nil;
    else
        return nil;
    end;
end;
local function v47(v40, v41, v42)
    local v43 = not not v29 and l_Workspace_0:GetServerTimeNow() * 1000 or DateTime.now().UnixTimestampMillis;
    return l_List_0.filter(v40, function(v44, v45)
        if not v44.isVisibleInBubbleChat then
            return false;
        else
            local v46 = false;
            if #v40 - v42 < v45 then
                v46 = v43 - v44.timestamp.UnixTimestampMillis < v41;
            end;
            return v46;
        end;
    end);
end;
local function _(v48)
    local v49 = nil;
    local v50 = v48 and v48.getSelfViewVisibility;
    if not (not v17.AvatarChatEnabled or not v50) then
        v49 = v50();
    end;
    return v49;
end;
return v4.memo(function(v52)
    local v54 = l_useSelector_0(function(v53)
        return v53.Messages;
    end);
    local v56 = v4.useMemo(function()
        return l_List_0.map(v54.bubbleMessagesInOrderBySenderId[v52.userId] or {}, function(v55)
            return v54.byMessageId[v55];
        end);
    end, {
        v54, 
        v52.userId
    });
    local v57 = v4.useMemo(function()
        return v56[#v56];
    end, {
        v56
    });
    local v59 = l_useSelector_0(function(v58)
        if not v52.isTextChatServiceOn then
            return v18(v58.LegacyBubbleChatSettings, v57);
        else
            return v58.BubbleChatSettings;
        end;
    end);
    local v61 = l_useSelector_0(function(v60)
        return v60.Adornees[v52.userId] or v52.partOrModel;
    end);
    local v63 = l_useSelector_0(function(v62)
        return v62.ClientSettings;
    end);
    local v65 = l_useSelector_0(function(v64)
        return v64.Voice.participantsMuted[v52.userId] or false;
    end);
    local v66, v67 = v4.useState(false);
    local v68, v69 = v4.useState(false);
    local v70, v71 = v4.useState(v59);
    local l_useState_0 = v4.useState;
    local l_selfViewListenerChanged_0 = v52.selfViewListenerChanged;
    local v74 = nil;
    local v75 = l_selfViewListenerChanged_0 and l_selfViewListenerChanged_0.getSelfViewVisibility;
    if not (not v17.AvatarChatEnabled or not v75) then
        v74 = v75();
    end;
    local v76;
    l_useState_0, v76 = l_useState_0(v74);
    l_selfViewListenerChanged_0, v74 = v4.useState(false);
    local v77;
    v75, v77 = v4.useState(0);
    local v78, v79 = v4.useState(nil);
    local v80, v81 = v4.useState({});
    local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    local v83 = not not l_LocalPlayer_0 and v52.userId == tostring(l_LocalPlayer_0.UserId);
    local v84 = nil;
    local v85 = nil;
    local v86 = nil;
    local v87 = nil;
    local v88 = nil;
    local v89 = nil;
    if v23 then
        local v90, v91 = v4.useState(false);
        v84 = v90;
        v85 = v91;
        v90, v91 = v4.useState(false);
        v86 = v90;
        v87 = v91;
        v90, v91 = v4.useState(false);
        v88 = v90;
        v89 = v91;
    end;
    local v93 = v4.useCallback(function()
        local l_v23_0 = v23;
        if l_v23_0 then
            l_v23_0 = v86;
            if l_v23_0 then
                l_v23_0 = false;
                if v52.voiceState == "LOCAL_MUTED" then
                    l_v23_0 = v84 and not (v25 and v65);
                end;
            end;
        end;
        return l_v23_0;
    end, {
        v86, 
        v52.voiceState, 
        v84, 
        v65
    });
    local v95 = l_useSelector_0(function(v94)
        if not v23 then
            return nil;
        else
            return v94.Adornees[not l_LocalPlayer_0 and "" or tostring(l_LocalPlayer_0.UserId)];
        end;
    end);
    local v96 = v4.useRef(false);
    local v97, v98 = v4.useBinding(Vector3.zero);
    local v99 = v4.useRef(nil);
    local v100 = v4.useRef(0);
    local v101 = v4.useRef(0);
    local v102 = v4.useCallback(function()
        if not (not v52.onFadeOut or v96.current) then
            v96.current = true;
            v52.onFadeOut(v52.userId);
        end;
    end, {
        v52.onFadeOut, 
        v52.userId, 
        v96.current
    });
    local v105 = v4.useCallback(function(v103, v104)
        return v52.onClickedVoiceIndicator(v103, v104, not v93() and "bubblechat" or "easierunmuting");
    end, {
        v52.onClickedVoiceIndicator
    });
    local v109 = v4.useCallback(function()
        if not v61 or not v61:IsA("Model") then
            if not v61 or not v61:IsA("BasePart") then
                return 0;
            else
                return v61.Size.Y / 2;
            end;
        else
            local l_v61_BoundingBox_0, v107 = v61:GetBoundingBox();
            local v108 = getAdorneeInstance(v61, v70.AdorneeName);
            if v108 then
                if not v108:IsA("BasePart") then
                    return 0;
                else
                    return v107.Y / 2 - l_v61_BoundingBox_0:PointToObjectSpace(v108.Position).Y;
                end;
            else
                return v107.Y / 2;
            end;
        end;
    end, {
        v61, 
        v70
    });
    local v111 = v4.useCallback(function()
        if not v31() or v52.voiceEnabled then
            if not v83 then
                local v110 = not v80 or #v80 == 0;
                if not (v52.voiceEnabled and not l_selfViewListenerChanged_0) or v52.isBubbleChatEnabled and not v110 then
                    return false;
                else
                    return true;
                end;
            elseif not (v19() and l_VRService_0.VREnabled) and not v17.ChromeEnabled then
                if l_useState_0 then
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
    end, {
        v52.voiceEnabled, 
        v52.userId, 
        l_useState_0, 
        v80, 
        l_selfViewListenerChanged_0, 
        v52.isBubbleChatEnabled, 
        v70, 
        v59, 
        l_VRService_0.VREnabled
    });
    local v112 = v4.useCallback(function()
        return v70.TailVisible and not v111();
    end, {
        v70, 
        v52.voiceEnabled, 
        v52.userId, 
        l_useState_0, 
        v80, 
        l_selfViewListenerChanged_0, 
        v52.isBubbleChatEnabled, 
        v59, 
        l_VRService_0.VREnabled
    });
    local v114 = v4.useCallback(function()
        if not v83 and v78 ~= "Talking" then
            local l_v75_0 = v75;
            delay(1, function()
                if v75 == l_v75_0 then
                    v74(true);
                end;
            end);
        end;
    end, {
        v52.userId, 
        v78, 
        v75, 
        v83
    });
    local v117 = v4.useCallback(function()
        if v23 and v86 then
            local v115 = false;
            if v78 ~= "Talking" then
                v115 = v78 ~= "LOCAL_MUTED";
            end;
            if not (v83 or not v115) then
                local l_v75_1 = v75;
                delay(1, function()
                    if v75 == l_v75_1 then
                        v74(true);
                    end;
                end);
            end;
            return ;
        else
            return v114();
        end;
    end, {
        v86, 
        v52.userId, 
        v78, 
        v75, 
        v83
    });
    local v118 = not l_LocalPlayer_0 and "SpeakerDark" or (v52.userId ~= tostring(l_LocalPlayer_0.UserId) and "SpeakerDark" or "MicDark");
    local function v119()
        return v4.createElement(v13, {
            userId = v52.userId, 
            getIcon = v52.getIconVoiceIndicator, 
            onClicked = v105, 
            iconStyle = v118
        });
    end;
    v4.useEffect(function()
        if v78 ~= v52.voiceState then
            v77((v75 or 0) + 1);
            v74(false);
            v79(v52.voiceState);
        end;
    end, {
        v52.voiceState, 
        v78
    });
    v4.useEffect(function()
        local v120 = v47(v56, v70.BubbleDuration * 1000, v70.MaxBubbles);
        if (v57 and v59) ~= nil then
            v71(v57 and v59);
        end;
        v81(v120);
    end, {
        v70, 
        v56, 
        v57, 
        v59
    });
    v4.useEffect(function()
        local v121 = v6.createSingleMotor(0);
        v99.current = v121;
        v121:onStep(function(v122)
            v98((Vector3.new(0, v122, 0)));
        end);
        local v123 = v109();
        v100.current = v123;
        v99.current:setGoal(v6.instant(v123));
        local v124 = nil;
        if not (not v17.AvatarChatEnabled or not v52.selfViewListenerChanged) then
            local l_selfViewVisibilityUpdatedSignal_0 = v52.selfViewListenerChanged.selfViewVisibilityUpdatedSignal;
            local l_getSelfViewVisibility_0 = v52.selfViewListenerChanged.getSelfViewVisibility;
            local l_l_getSelfViewVisibility_0_0 = l_getSelfViewVisibility_0 --[[ copy: 4 -> 5 ]];
            v124 = l_selfViewVisibilityUpdatedSignal_0:connect(function()
                v76(l_l_getSelfViewVisibility_0_0());
            end);
        end;
        if v23 then
            local l_status_0, l_result_0 = pcall(function()
                return v22:GetLayerData(v27);
            end);
            if not ((not l_status_0 or not l_result_0) or not l_result_0[v28]) then
                v87(true);
            end;
        end;
        return function()
            if v124 then
                v124:disconnect();
                v124 = nil;
            end;
            if v99.current then
                v99.current:destroy();
            end;
        end;
    end, {
        v52.selfViewListenerChanged
    });
    v4.useEffect(function()
        local v146 = l_RunService_0.PostSimulation:Connect(function()
            if v101.current ~= nil then
                if v101.current < v30 then
                    local l_v101_0 = v101;
                    l_v101_0.current = l_v101_0.current + 1;
                    return ;
                else
                    v101.current = 0;
                end;
            end;
            local v131 = getAdorneeInstance(v61, v70.AdorneeName);
            if not (not l_Workspace_0.CurrentCamera or not v131) then
                local v132 = if not v131:IsA("Attachment") then v131.Position else v131.WorldPosition;
                local l_Magnitude_0 = (l_Workspace_0.CurrentCamera.CFrame.Position - v132).Magnitude;
                local v134 = l_Magnitude_0 < v70.MaxDistance;
                local v135 = l_Magnitude_0 < v70.MinimizeDistance;
                local v136 = false;
                if not (not v23 or not v86) then
                    local v137 = nil;
                    local v138 = getAdorneeInstance(v95, v70.AdorneeName);
                    if v138 then
                        v137 = if not v138:IsA("Attachment") then v138.Position else v138.WorldPosition;
                    end;
                    local v139 = getEasierUnmutingDistance(v132, v137);
                    if v139 ~= nil then
                        v136 = v139 < v26;
                    end;
                end;
                if not (v135 == v68 and v134 == v66) or not (not v23 or not v86) and v136 ~= v84 then
                    v67(v134);
                    v69(v135);
                    v85(v136);
                end;
            end;
            local v140 = v109();
            if math.abs(v140 - v100.current) > 0.5 then
                v100.current = v140;
                v99.current:setGoal(v6.spring(v140, v33));
            end;
            local v141 = not not v29 and l_Workspace_0:GetServerTimeNow() * 1000 or DateTime.now().UnixTimestampMillis;
            local v142 = v70.BubbleDuration * 1000;
            for _, v144 in ipairs(v80) do
                if v142 <= v141 - v144.timestamp.UnixTimestampMillis then
                    v81(function(v145)
                        return v47(v145, v142, v59.MaxBubbles);
                    end);
                    return ;
                end;
            end;
        end);
        if not v23 or not v86 then
            v114();
        else
            v117();
        end;
        return function()
            v1:trace("Unmounting billboards for {}", v52.userId);
            if not (not v146 or not v146.Connected) then
                v146:Disconnect();
            end;
        end;
    end, {
        v80, 
        v61, 
        v70, 
        v86, 
        v95, 
        v59, 
        v66, 
        v68, 
        v84
    });
    v4.useEffect(function()
        if not (not (not v80 or #v80 == 0) or v66) then
            v102();
        end;
        if v80 and #v80 > 0 then
            v96.current = false;
        end;
        if not ((not v23 or not v83) or v88) and (not (v52.voiceState ~= "Inactive" and v52.voiceState ~= "Talking") or v52.voiceState == "Muted") then
            v22:LogUserLayerExposure(v27);
            v89(true);
        end;
    end, {
        v80, 
        v66, 
        v52.userId, 
        v52.voiceState, 
        v88
    });
    v4.useEffect(function()
        if not v23 or not v86 then
            v114();
            return ;
        else
            v117();
            return ;
        end;
    end, {
        v75, 
        v86
    });
    local v147 = getAdorneeInstance(v61, v70.AdorneeName);
    if v147 then
        if v66 then
            if not (not (not v23 or not v86) and v52.voiceState == "LOCAL_MUTED") or v84 and (not v25 or not v65) then
                local v148 = {};
                local v149 = v80 and #v80 > 0;
                local v150 = v52.voiceEnabled and not l_selfViewListenerChanged_0;
                if not (not v17.AvatarChatEnabled or not v83) then
                    v150 = v150 and not l_useState_0;
                end;
                if not (not v17.ChromeEnabled or not v83) then
                    v150 = false;
                end;
                local v151 = v150 and not v17.AvatarChatEnabled;
                local v152 = if not v150 then nil else v119;
                local l_v32_0 = v32;
                if not v17.AvatarChatEnabled and not v17.ChromeEnabled then
                    if v150 and v149 == false then
                        v148.VoiceBubble = v4.createElement(v14, {
                            chatSettings = v70, 
                            userId = v52.userId, 
                            renderInsert = v152, 
                            insertSize = l_v32_0, 
                            isDistant = not v68, 
                            clientSettings = v63
                        });
                    end;
                elseif v111() then
                    v148.PlayerButtons = v4.createElement(v20, {
                        chatSettings = v59, 
                        isInsideMaximizeDistance = v68, 
                        LayoutOrder = 2, 
                        isLocalPlayer = v83, 
                        userId = v52.userId, 
                        getIcon = v52.getIconVoiceIndicator, 
                        hasCameraPermissions = v52.hasCameraPermissions, 
                        hasMicPermissions = v52.hasMicPermissions, 
                        onClickedVoiceIndicator = v105, 
                        onClickedCameraIndicator = v52.onClickedCameraIndicator, 
                        voiceEnabled = v52.voiceEnabled, 
                        displayCameraDeniedToast = v52.displayCameraDeniedToast, 
                        isCamEnabledForUserAndPlace = v52.isCamEnabledForUserAndPlace, 
                        setCameraPermissionStateFromControl = v52.setCameraPermissionStateFromControl, 
                        getPermissions = v52.getPermissions, 
                        isCameraOnlyUser = v52.isCameraOnlyUser
                    });
                    v148.listLayout = v4.createElement("UIListLayout", {
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        VerticalAlignment = Enum.VerticalAlignment.Bottom, 
                        Padding = UDim.new(0, 8)
                    });
                    v148.padding = v4.createElement("UIPadding", {
                        PaddingBottom = UDim.new(0, 8)
                    });
                end;
                local v154 = if not v31() then nil else v112();
                if not v68 then
                    if v149 then
                        v148.DistantBubble = v4.createElement(v16, {
                            fadingOut = not v80 or #v80 == 0, 
                            onFadeOut = v102, 
                            chatSettings = v70, 
                            renderInsert = if not v151 then nil else v152, 
                            insertSize = l_v32_0, 
                            clientSettings = v63, 
                            showCaret = v154
                        });
                    end;
                else
                    v148.BubbleChatList = v4.createElement(v15, {
                        userId = v52.userId, 
                        isVisible = v68, 
                        onLastBubbleFadeOut = v102, 
                        chatSettings = v70, 
                        renderFirstInsert = if not v151 then nil else v152, 
                        insertSize = l_v32_0, 
                        messages = v80, 
                        clientSettings = v63, 
                        isTextChatServiceOn = v52.isTextChatServiceOn, 
                        showCaret = v154
                    });
                end;
                return v4.createElement("BillboardGui", {
                    Adornee = v147, 
                    Active = if not v17.AvatarChatEnabled then v150 else v111(), 
                    Size = UDim2.fromOffset(500, 200), 
                    SizeOffset = Vector2.new(0, 0.5), 
                    StudsOffset = (not not v83 and v70.LocalPlayerStudsOffset or Vector3.new(0, 1, 0.1)) + Vector3.new(0, v70.VerticalStudsOffset, 0), 
                    StudsOffsetWorldSpace = v97, 
                    ResetOnSpawn = false
                }, v148);
            else
                v1:trace("Unmute toggle not applicable for {}", v52.userId);
                return ;
            end;
        else
            v1:trace("Not in range for {}", v52.userId);
            return ;
        end;
    else
        v1:trace("No adornee for {}", v52.userId);
        return ;
    end;
end);
