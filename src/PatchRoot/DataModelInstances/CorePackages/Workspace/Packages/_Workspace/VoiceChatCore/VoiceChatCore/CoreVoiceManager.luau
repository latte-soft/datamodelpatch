local l_CorePackages_0 = game:GetService("CorePackages");
local l_Players_0 = game:GetService("Players");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_CollectionService_0 = game:GetService("CollectionService");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_SoundService_0 = game:GetService("SoundService");
local l_VoiceChatService_0 = game:GetService("VoiceChatService");
local l_HttpService_0 = game:GetService("HttpService");
local l_HttpRbxApiService_0 = game:GetService("HttpRbxApiService");
local l_NotificationService_0 = game:GetService("NotificationService");
local l_RobloxReplicatedStorage_0 = game:GetService("RobloxReplicatedStorage");
local v11 = require(l_CorePackages_0.Promise);
local v12 = require(l_CorePackages_0.Cryo);
local v13 = require(script.Parent.Constants);
local v14 = require(script.Parent.Utils);
local l_Flags_0 = script.Parent.Flags;
local v16 = require(script.Parent.Analytics);
local l_Requests_0 = script.Parent.Requests;
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.CallProtocol).CallProtocol.default;
local l_Enums_0 = require(l_CorePackages_0.Workspace.Packages.CallProtocol).Enums;
local l_PermissionsProtocol_0 = require(l_CorePackages_0.Workspace.Packages.PermissionsProtocol).PermissionsProtocol;
local v21 = require(l_RobloxGui_0.Modules.BlockingUtility);
local v22 = require(l_RobloxGui_0.Modules.Logger):new(script.Name);
local v23 = require(l_Flags_0.GetFFlagAlwaysSetupVoiceListeners)();
local v24 = require(l_Flags_0.GetFFlagFixNewAudioAPIEcho)();
local v25 = require(l_Flags_0.GetFFlagHideVoiceUIUntilInputExists)();
local v26 = require(l_Flags_0.GetFFlagOverwriteIsMutedLocally)();
local v27 = require(l_Flags_0.GetFFlagReceiveLikelySpeakingUsers)();
local v28 = require(l_Flags_0.GetFFlagUseAudioInstanceAdded)();
local v29 = require(l_Flags_0.GetFFlagSetActiveWhenConnecting)();
local v30 = require(l_Flags_0.GetFFlagUpdateDeviceInputPlayerChanged)();
local v31 = require(l_Flags_0.GetFFlagHideUIWhenVoiceDefaultDisabled)();
local v32 = require(l_Flags_0.GetFFlagEnableVoiceSignal);
local v33 = require(l_RobloxGui_0.Modules.Flags.GetFFlagEnableVoiceRccCheck);
local v34 = require(l_RobloxGui_0.Modules.Flags.GetFFlagDeferredBlockStatusChange);
local v35 = require(l_RobloxGui_0.Modules.Flags.GetFFlagLuaConsumePlayerModerated);
local v36 = require(l_RobloxGui_0.Modules.Flags.GetFFlagEnableNudgeAnalytics);
local v37 = require(l_RobloxGui_0.Modules.Flags.GetFFlagEnableErrorIconFix);
local v38 = require(l_RobloxGui_0.Modules.Flags.GetFFlagPlayerListAnimateMic);
local v39 = require(l_RobloxGui_0.Modules.Flags.GetFFlagEnableLuaVoiceChatAnalytics);
local v40 = require(l_RobloxGui_0.Modules.Flags.GetFFlagUseLuaSignalrConsumer);
local v41 = require(l_RobloxGui_0.Modules.Flags.GetFFlagClearVoiceStateOnRejoin);
local v42 = require(l_RobloxGui_0.Modules.Flags.GetFFlagLocalMutedNilFix);
local v43 = require(l_RobloxGui_0.Modules.Flags.GetFFlagEnableVoiceNudge);
local v44 = require(l_RobloxGui_0.Modules.Flags.GetFFlagVoiceChatWatchForMissedSignalROnEventReceived);
local v45 = require(l_RobloxGui_0.Modules.Flags.GetFFlagClearUserFromRecentVoiceDataOnLeave);
local v46 = require(l_RobloxGui_0.Modules.Flags.GetFFlagVoiceUseAudioRoutingAPI);
local v47 = require(l_RobloxGui_0.Modules.Flags.GetFIntVoiceUsersInteractionExpiryTimeSeconds);
local v48 = require(l_RobloxGui_0.Modules.Flags.GetFFlagAvatarChatServiceEnabled);
local v49 = require(l_RobloxGui_0.Modules.Flags.GetFFlagVoiceChatServiceManagerUseAvatarChat);
local v50 = require(l_RobloxGui_0.Modules.Flags.GetFFlagJoinWithoutMicPermissions);
local v51 = require(l_RobloxGui_0.Modules.Flags.FFlagAvatarChatCoreScriptSupport);
local v52 = require(l_RobloxGui_0.Modules.Flags.GetFFlagBatchVoiceParticipantsUpdates);
local l_WATCHED_NAMESPACES_0 = v13.WATCHED_NAMESPACES;
local l_WATCHED_MESSAGE_TYPES_0 = v13.WATCHED_MESSAGE_TYPES;
local l_VOICE_CHAT_AVAILABILITY_0 = v13.VOICE_CHAT_AVAILABILITY;
local l_MIN_VOICE_CHAT_API_VERSION_IS_CONTEXT_ENABLED_0 = v13.MIN_VOICE_CHAT_API_VERSION_IS_CONTEXT_ENABLED;
local l_MIN_VOICE_CHAT_API_VERSION_LOCAL_MIC_ACTIVITY_0 = v13.MIN_VOICE_CHAT_API_VERSION_LOCAL_MIC_ACTIVITY;
local l_PERMISSION_STATE_0 = v13.PERMISSION_STATE;
local l_VOICE_JOIN_PROGRESS_0 = v13.VOICE_JOIN_PROGRESS;
local v60 = require(l_Requests_0.GetShowAgeVerificationOverlay);
local v61 = {
    available = nil, 
    canUseServicePromise = nil, 
    userEligible = false, 
    participants = nil, 
    localMuted = nil, 
    isTalking = false, 
    previousGroupId = nil, 
    muteAll = false, 
    previousMutedState = nil, 
    permissionPromise = nil, 
    permissionState = if not v50() then nil else l_PERMISSION_STATE_0.IDLE, 
    recentUsersInteractionData = nil, 
    NotificationService = l_NotificationService_0, 
    PermissionsService = l_PermissionsProtocol_0.default, 
    voiceEnabled = false, 
    LikelySpeakingUsersEvent = nil, 
    service = nil, 
    SignalREventTable = {}, 
    isInCall = false, 
    callMutedState = false, 
    audioDeviceInputAdded = if not v25 then nil else Instance.new("BindableEvent"), 
    muteChanged = Instance.new("BindableEvent"), 
    participantLeft = Instance.new("BindableEvent"), 
    participantJoined = Instance.new("BindableEvent"), 
    participantsUpdate = Instance.new("BindableEvent"), 
    talkingChanged = Instance.new("BindableEvent"), 
    attemptVoiceRejoin = Instance.new("BindableEvent"), 
    communicationPermissionsResult = nil, 
    VoiceJoinProgress = l_VOICE_JOIN_PROGRESS_0.Idle, 
    VoiceJoinProgressChanged = Instance.new("BindableEvent"), 
    mutedPlayers = {}, 
    BlockStatusChanged = nil, 
    AvatarChatService = if not v48() then nil else game:GetService("AvatarChatService"), 
    HttpRbxApiService = l_HttpRbxApiService_0, 
    SendMuteEvent = nil
};
v61.__index = v61;
v61.new = function(v62, v63, v64, v65, v66, v67, v68)
    local v69 = setmetatable({
        previousSessionId = nil, 
        HttpRbxApiService = v64, 
        eventEmitter = v14.EventEmitter.new(), 
        service = v65, 
        PermissionsService = v63, 
        NotificationService = v67, 
        AvatarChatService = v68, 
        Analytics = v16.new(v66), 
        SequenceNumbers = {}, 
        SignalREventTable = {}, 
        audioDevices = {}, 
        BlockStatusChanged = v62
    }, v61);
    if v40() then
        for _, v71 in l_WATCHED_MESSAGE_TYPES_0, nil, nil do
            v69.SignalREventTable[v71] = Instance.new("BindableEvent");
        end;
    end;
    return v69;
end;
v61.emit = function(v72, v73, ...)
    v72.eventEmitter:emit(v73, ...);
end;
v61.subscribe = function(v74, v75, v76)
    v74.eventEmitter:addListener(v75, v76);
end;
v61.unsubscribeAll = function(v77)
    v77.eventEmitter:removeAllListeners();
end;
v61.CheckCallState = function(v78)
    v22:trace("Checking user call state");
    local l_status_0, l_result_0 = pcall(function()
        l_default_0:getCallState():andThen(function(v79)
            v22:trace("Got user call state");
            if v79.status ~= l_Enums_0.CallStatus.Idle.rawValue() and v79.status ~= l_Enums_0.CallStatus.Ringing.rawValue() then
                v78.isInCall = true;
                v78.callMutedState = v79.muted;
                v22:trace("Changing call muted state to {}", v79.muted);
            end;
        end):catch(function(v80)
            v22:trace("User not in call {}", v80);
        end);
    end);
    if not l_status_0 then
        v22:debug("Error checking user call state {}", l_result_0);
    end;
end;
v61._GetShowAgeVerificationOverlay = function(v83)
    return v60(v14.bind(v83, "GetRequest"), tostring(game.GameId), (tostring(game.PlaceId)));
end;
v61.FetchAgeVerificationOverlay = function(v84)
    if not v84._getShowAgeVerificationOverlayResult then
        v84._getShowAgeVerificationOverlayResult = v84:_GetShowAgeVerificationOverlay();
    end;
    return v84._getShowAgeVerificationOverlayResult;
end;
v61.GetNudgeAnalyticsData = function(v85)
    return l_Players_0.LocalPlayer.UserId, v85:GetSessionId();
end;
v61.avatarChatUserAndPlaceSettingsValueOfClientFeatures = function(v86, v87)
    return {
        universePlaceVoiceEnabledSettings = {
            isUniverseEnabledForVoice = v86.AvatarChatService:IsEnabled(v87, Enum.AvatarChatServiceFeature.UniverseAudio), 
            isPlaceEnabledForVoice = v86.AvatarChatService:IsEnabled(v87, Enum.AvatarChatServiceFeature.PlaceAudio), 
            isUniverseEnabledForAvatarVideo = v86.AvatarChatService:IsEnabled(v87, Enum.AvatarChatServiceFeature.UniverseVideo), 
            isPlaceEnabledForAvatarVideo = v86.AvatarChatService:IsEnabled(v87, Enum.AvatarChatServiceFeature.PlaceVideo)
        }, 
        voiceSettings = {
            isUserEligible = v86.AvatarChatService:IsEnabled(v87, Enum.AvatarChatServiceFeature.UserAudioEligible), 
            isVoiceEnabled = v86.AvatarChatService:IsEnabled(v87, Enum.AvatarChatServiceFeature.UserAudio), 
            isAvatarVideoEligible = v86.AvatarChatService:IsEnabled(v87, Enum.AvatarChatServiceFeature.UserVideoEligible), 
            isAvatarVideoEnabled = v86.AvatarChatService:IsEnabled(v87, Enum.AvatarChatServiceFeature.UserVideo), 
            isUserVerifiedForVoice = if not v32() then nil else v86.AvatarChatService:IsEnabled(v87, Enum.AvatarChatServiceFeature.UserVerifiedForVoice), 
            isBanned = v86.AvatarChatService:IsEnabled(v87, Enum.AvatarChatServiceFeature.UserBanned), 
            bannedUntil = nil
        }
    };
end;
v61.resolveAvatarChatUserAndPlaceSettings = function(v88)
    local l_status_1, l_result_1 = pcall(v88.AvatarChatService.GetClientFeaturesAsync, v88.AvatarChatService);
    if l_status_1 then
        return v88:avatarChatUserAndPlaceSettingsValueOfClientFeatures(l_result_1);
    else
        return nil;
    end;
end;
v61.GetRequest = function(v91, v92, _)
    local l_status_2, l_result_2 = pcall(function()
        return l_HttpService_0:JSONDecode((v91.HttpRbxApiService:GetAsyncFullUrl(v92, Enum.ThrottlingPriority.Default, Enum.HttpRequestType.Players)));
    end);
    return l_status_2 and l_result_2;
end;
v61.userAndPlaceCanUseVoice = function(v96)
    local v97 = if not not v48() and v49() then v96:resolveAvatarChatUserAndPlaceSettings() else v60(v14.bind(v96, "GetRequest"), tostring(game.GameId), (tostring(game.PlaceId)));
    if v97 then
        local l_universePlaceVoiceEnabledSettings_0 = v97.universePlaceVoiceEnabledSettings;
        local l_voiceSettings_0 = v97.voiceSettings;
        v22:trace("Voice settings endpoint returned {}", v97);
        if v32() then
            v96.communicationPermissionsResult = v97;
            if v96:UserEligibleForInExperienceUpsell() then
                v96:ChangeVoiceJoinProgress(l_VOICE_JOIN_PROGRESS_0.Suspended);
            end;
        end;
        if not l_universePlaceVoiceEnabledSettings_0 or l_universePlaceVoiceEnabledSettings_0.isUniverseEnabledForVoice then
            v96:emit("OnUserAndPlaceCanUseVoiceResolved", l_voiceSettings_0, l_universePlaceVoiceEnabledSettings_0);
            if l_universePlaceVoiceEnabledSettings_0 and l_voiceSettings_0 then
                if l_universePlaceVoiceEnabledSettings_0.isPlaceEnabledForVoice then
                    if not l_voiceSettings_0.isVoiceEnabled then
                        v96:_reportJoinFailed("userNotEnabled");
                    end;
                else
                    v96:_reportJoinFailed("placeNotEnabled");
                end;
            else
                v96:_reportJoinFailed("invalidResponse", v16.ERROR);
            end;
            return ((l_universePlaceVoiceEnabledSettings_0 and l_voiceSettings_0) and l_voiceSettings_0.isVoiceEnabled) and l_universePlaceVoiceEnabledSettings_0.isPlaceEnabledForVoice;
        else
            v96:_reportJoinFailed("universeNotEnabled");
            return false;
        end;
    else
        v96:_reportJoinFailed("invalidResponse", v16.ERROR);
        return false;
    end;
end;
v61.voicePermissionGranted = function(_, v101)
    local _ = false;
    if typeof(v101) == "table" then
        local v103 = true;
        if v101.status ~= l_PermissionsProtocol_0.Status.AUTHORIZED then
            v103 = not v12.List.find(v101.missingPermissions, l_PermissionsProtocol_0.Permissions.MICROPHONE_ACCESS);
        end;
        return v103;
    else
        return v101 == l_PermissionsProtocol_0.Status.AUTHORIZED;
    end;
end;
v61.requestMicPermission = function(v104)
    if not v104.permissionPromise then
        local v105 = {
            l_PermissionsProtocol_0.Permissions.MICROPHONE_ACCESS
        };
        local v106 = nil;
        if not v50() then
            v106 = if not v51 then v104.PermissionsService:requestPermissions(v105) else v11.new(function(v107, _)
                v104:emit("GetPermissions", function(v109)
                    v107({
                        status = not not v109.hasMicPermissions and l_PermissionsProtocol_0.Status.AUTHORIZED or l_PermissionsProtocol_0.Status.DENIED
                    });
                end, v105);
            end);
        else
            v22:debug("Requesting device permission");
            local v110, v111 = v104.PermissionsService:hasPermissions(v105):await();
            if not v110 then
                v22:error("PermissionsService call failed.");
                v104.permissionState = l_PERMISSION_STATE_0.LISTEN_ONLY;
            elseif v111.status == l_PermissionsProtocol_0.Status.AUTHORIZED then
                v104.permissionState = l_PERMISSION_STATE_0.LISTEN_AND_TALK;
            elseif not v111.missingPermissions then
                if not v111.deniedPermissions then
                    v22:error("PermissionsService returned unknown permission state. Defaulting to listen only.");
                    v104.permissionState = l_PERMISSION_STATE_0.LISTEN_ONLY;
                else
                    v104.permissionState = l_PERMISSION_STATE_0.LISTEN_ONLY;
                end;
            else
                v104.permissionState = l_PERMISSION_STATE_0.PENDING_MIC;
            end;
            v22:debug("Joining without mic permissions. Permission State: {}", v104.permissionState);
            v106 = v11.resolve();
        end;
        v104.permissionPromise = v106:andThen(function(v112)
            if not v50() then
                if v112 or v112.status then
                    v22:debug("Permission status {}", v112.status);
                    local _ = nil;
                    return not not if not v51 then v112.status == l_PermissionsProtocol_0.Status.AUTHORIZED else v104:voicePermissionGranted(v112) and v11.resolve() or v11.reject();
                else
                    v22:debug("No permission response, rejecting access");
                    v104:_reportJoinFailed("noPermissionResponse", v16.ERROR);
                    return v11.reject();
                end;
            else
                return v11.resolve();
            end;
        end):andThen(function()
            v104:emit("OnRequestMicPermissionResolved");
            return v11.resolve();
        end):catch(function()
            v104:emit("OnRequestMicPermissionRejected");
            return v11.reject();
        end);
        return v104.permissionPromise;
    else
        v22:trace("PermissionProtocol already invoked");
        return v104.permissionPromise;
    end;
end;
v61.JoinByGroupIdToken = function(v114, v115, v116)
    v114.previousGroupId = v115;
    v114.previousMutedState = v116;
    return v114.service:JoinByGroupIdToken(v115, v116);
end;
v61.EnableVoice = function(v117)
    v22:trace("Enabling voice");
    v117.AvatarChatService:GetPropertyChangedSignal("ClientFeatures"):Once(function()
        v117.attemptVoiceRejoin:Fire();
    end);
    v117.AvatarChatService:EnableVoice();
end;
v61.ChangeVoiceJoinProgress = function(v118, v119)
    v118.VoiceJoinProgress = v119;
    v118.VoiceJoinProgressChanged:Fire(v118.VoiceJoinProgress);
end;
v61.UserEligibleForInExperienceUpsell = function(v120)
    local l_communicationPermissionsResult_0 = v120.communicationPermissionsResult;
    if not (not l_communicationPermissionsResult_0 or not l_communicationPermissionsResult_0.voiceSettings) and l_communicationPermissionsResult_0.universePlaceVoiceEnabledSettings then
        local v122 = (l_communicationPermissionsResult_0.voiceSettings.isUserVerifiedForVoice and not l_communicationPermissionsResult_0.voiceSettings.isVoiceEnabled) and l_communicationPermissionsResult_0.universePlaceVoiceEnabledSettings.isPlaceEnabledForVoice;
        if v122 then
            local v123 = v120:FetchAgeVerificationOverlay();
            return (v122 and v123) and v123.showVoiceInExperienceUpsell;
        else
            return false;
        end;
    else
        return false;
    end;
end;
v61.canUseServiceAsync = function(v124)
    if v124.available == nil and game:GetEngineFeature("VoiceChatSupported") then
        if not v124.canUseServicePromise then
            v124.canUseServicePromise = v11.defer(function(v125, v126)
                local v127 = v124:userAndPlaceCanUseVoice();
                if v32() and v124.VoiceJoinProgress == l_VOICE_JOIN_PROGRESS_0.Suspended then
                    v22:debug("Place is voice enabled but user is not, delaying voice rejection");
                    v124.attemptVoiceRejoin.Event:Wait();
                    v22:debug("Attempting voice rejoin");
                    v124.userEligible = true;
                    v125();
                    v124:ChangeVoiceJoinProgress(l_VOICE_JOIN_PROGRESS_0.Joining);
                    return ;
                elseif v127 then
                    if not (not game:GetEngineFeature("VoiceChatEnabledRccProperties") or not v33()) then
                        if not game:IsLoaded() then
                            game.Loaded:Wait();
                        end;
                        if (not v31 or l_VoiceChatService_0.UseNewAudioApi) or l_VoiceChatService_0.EnableDefaultVoice then
                            if not (l_VoiceChatService_0.VoiceChatEnabledForUniverseOnRcc and l_VoiceChatService_0.VoiceChatEnabledForPlaceOnRcc) then
                                v22:debug("Disabling voice chat due to RCC Response. Universe: {}, Place: {}", l_VoiceChatService_0.VoiceChatEnabledForUniverseOnRcc, l_VoiceChatService_0.VoiceChatEnabledForPlaceOnRcc);
                                if l_VoiceChatService_0.VoiceChatEnabledForUniverseOnRcc then
                                    if not l_VoiceChatService_0.VoiceChatEnabledForPlaceOnRcc then
                                        v124:_reportJoinFailed("placeNotEnabled");
                                    end;
                                else
                                    v124:_reportJoinFailed("universeNotEnabled");
                                end;
                                v124.available = l_VOICE_CHAT_AVAILABILITY_0.PlaceNotAvailable;
                                v126();
                                return ;
                            end;
                        else
                            v126();
                            return ;
                        end;
                    end;
                    v124.userEligible = true;
                    v125();
                    return ;
                else
                    v22:info("Voice access denied");
                    v124.available = l_VOICE_CHAT_AVAILABILITY_0.UserNotAvailable;
                    v126();
                    return ;
                end;
            end):andThen(function()
                return v124:requestMicPermission();
            end);
        end;
        return v124.canUseServicePromise;
    else
        v22:debug("Voice Chat is not Available, rejecting canUseService promise");
        return v11.reject();
    end;
end;
v61._setRecentUserState = function(v128, v129, v130)
    v128.recentUsersInteractionData = v12.Dictionary.join(v128.recentUsersInteractionData, {
        [tostring(v129)] = v12.Dictionary.join(v128.recentUsersInteractionData[tostring(v129)] or {}, v130)
    });
end;
v61.getRecentUsersInteractionData = function(v131)
    v131:_updateRecentUsersInteractionData();
    return v131.recentUsersInteractionData;
end;
v61.GetSignalREvent = function(v132, v133)
    return v132.SignalREventTable[v133].Event;
end;
v61._updateRecentUsersInteractionData = function(v134)
    local v135 = os.time();
    local v136 = {};
    if v134.recentUsersInteractionData then
        for v137, v138 in pairs(v134.recentUsersInteractionData) do
            local v139 = v134.participants[v137];
            local v140 = v45() and not l_Players_0:GetPlayerByUserId((tonumber(v137)));
            local v141 = v47() <= v135 - v138.lastHeardTime;
            local v142 = not v139 or v139.isMuted;
            if not (not (v141 and v142) and not v140) then
                v136[v137] = v12.None;
            end;
        end;
        v134.recentUsersInteractionData = v12.Dictionary.join(v134.recentUsersInteractionData, v136);
    end;
end;
v61.SetupParticipantListeners = function(v143)
    v143:ensureInitialized("setup participant listeners");
    if not v143.participants then
        v143.participants = {};
        v143.recentUsersInteractionData = {};
        v143.participantConnection = v143.service.ParticipantsStateChanged:Connect(function(v144, v145, v146)
            v22:trace("Participants state changed");
            for _, v148 in ipairs(v144) do
                if not (v45() or v143.participants[tostring(v148)].isMuted) then
                    v143:_setRecentUserState(v148, {
                        lastHeardTime = os.time()
                    });
                end;
                v143.participants[tostring(v148)] = nil;
                v143.participantLeft:Fire(v143.participants, not not v38() and v148 or nil);
                v143:emit("OnVoiceParticipantRemoved", v148);
            end;
            for _, v150 in ipairs(v145) do
                v143.participantJoined:Fire(v143.participants, v150);
                v143:emit("OnVoiceParticipantAdded", v150);
            end;
            local v151 = {};
            for _, v153 in pairs(v146) do
                local l_userId_0 = v153.userId;
                local v155 = v143.participants[l_userId_0];
                if not (v153.isMuted and (not v155 or v155.isMuted)) then
                    v143:_setRecentUserState(l_userId_0, {
                        lastHeardTime = os.time(), 
                        player = l_Players_0:GetPlayerByUserId(l_userId_0)
                    });
                end;
                if not v155 or v155.isMuted ~= v153.isMuted then
                    v143:emit("OnVoiceParticipantToggleMuted", l_userId_0, v153.isMuted);
                end;
                if not (not v46() or not v26) then
                    v153.isMutedLocally = not not v143.mutedPlayers[l_userId_0];
                end;
                v143.participants[tostring(l_userId_0)] = v153;
                if v52() then
                    v151[tostring(l_userId_0)] = v153;
                end;
            end;
            v143:_updateRecentUsersInteractionData();
            if #v146 > 0 then
                v143.participantsUpdate:Fire(if not v52() then v143.participants else v151);
            end;
        end);
        v143.stateConnection = v143.service.StateChanged:Connect(function(v156, v157)
            v143:emit("OnStateChanged");
            local v158 = v157 == Enum.VoiceChatState.Failed;
            local v159 = v157 == Enum.VoiceChatState.Joining;
            local v160 = v157 == Enum.VoiceChatState.Leaving;
            local v161 = v157 == Enum.VoiceChatState.Ended;
            local v162 = v143.service:IsPublishPaused();
            if not v37() then
                if v162 ~= v143.localMuted then
                    v143.localMuted = v162;
                    v143.muteChanged:Fire(v162);
                end;
            elseif (((not (v162 ~= v143.localMuted) or v158) or v159) or v160) or v161 then
                if not (not (v159 or v160) and not v161) then
                    v143.localMuted = nil;
                end;
            else
                v143.localMuted = v162;
                v143.muteChanged:Fire(v162);
            end;
            if v157 == Enum.VoiceChatState.Leaving then
                v143.previousGroupId = v143.service:GetGroupId();
                v143.previousMutedState = v143.service:IsPublishPaused();
            end;
            if not (v157 ~= Enum.VoiceChatState.Ended and not v158) then
                v143.participants = {};
                v143.localMuted = nil;
                v143.participantsUpdate:Fire(v143.participants);
                if v158 then
                    v22:debug("State Changed to Failed. Reason: {}", v143.service:GetAndClearCallFailureMessage());
                end;
                if not (v156 ~= Enum.VoiceChatState.Joining and v156 ~= Enum.VoiceChatState.JoiningRetry) or v156 == Enum.VoiceChatState.Joined then
                    if v157 == Enum.VoiceChatState.Ended then
                        v22:debug("State Changed to Ended from {}", v156);
                    end;
                    v143:emit("OnRetryRequested");
                end;
            end;
        end);
        if l_MIN_VOICE_CHAT_API_VERSION_LOCAL_MIC_ACTIVITY_0 <= v143.service:GetVoiceChatApiVersion() then
            v143.micConnection = v143.service.PlayerMicActivitySignalChange:Connect(function(v163)
                v143.isTalking = v163.isActive;
                if not v42() then
                    if not v143.localMuted then
                        v143.talkingChanged:Fire(v143.isTalking);
                    end;
                elseif v143.localMuted == false then
                    v143.talkingChanged:Fire(v143.isTalking);
                    return ;
                end;
            end);
        end;
        if not v35() then
            if game:GetEngineFeature("VoiceChatServicePlayerModeratedEvent") then
                v143.playerModeratedConnection = v143.service.LocalPlayerModerated:connect(function()
                    v22:debug("User Moderated old");
                    v143.previousSessionId = v143.service:GetSessionId();
                    v143:emit("ShowPlayerModeratedMessage");
                    v143.service:Leave();
                end);
            end;
        else
            v143.playerModeratedConnection = v143:GetSignalREvent("ParticipantModeratedFromVoice"):Connect(function()
                v22:debug("User Moderated");
                v143.previousSessionId = v143.service:GetSessionId();
                v143:emit("OnPlayerModerated");
                v143.service:Leave();
            end);
        end;
        if v43() then
            v22:trace("Setting up voice nudge handlers");
            v143.voiceToxicityModalConnection = v143:GetSignalREvent("VoiceToxicityModal"):Connect(function(v164)
                if v36() then
                    v143.Analytics:reportReceivedNudge(v164, v143:GetNudgeAnalyticsData());
                end;
                v143:emit("OnVoiceToxicityModal");
            end);
            v143.VoiceToxicityToastConnection = v143:GetSignalREvent("VoiceToxicityToast"):Connect(function(v165)
                if v36() then
                    v143.Analytics:reportReceivedNudge(v165, v143:GetNudgeAnalyticsData());
                end;
                v143:emit("OnVoiceToxicityToast");
            end);
        end;
        v143.blockConnection = v143.BlockStatusChanged:Connect(function(v166, v167)
            if not v167 then
                v22:debug("UnBlocking {}", v14.shorten(v166));
                v143.service:SubscribeUnblock(v166);
            elseif v143.participants[tostring(v166)] then
                v22:debug("Blocking {}", v14.shorten(v166));
                v143.service:SubscribeBlock(v166);
                return ;
            end;
        end);
        if v46() then
            v143:hookupAudioDeviceInputListener();
        end;
    end;
end;
local v168 = nil;
v61.CheckAudioInputExists = function(v169)
    v22:trace("Checking for AudioDeviceInput");
    if not v168 then
        v168 = v11.new(function(v170, _)
            if #v12.Dictionary.keys(v169.audioDevices) > 0 then
                v22:trace("Found existing AudioDeviceInput");
                v170();
                return ;
            else
                v169.audioDeviceInputAdded.Event:Connect(function()
                    v22:trace("Found new AudioDeviceInput");
                    v170();
                end);
                return ;
            end;
        end);
    end;
    return v168;
end;
v61.checkAndUpdateSequence = function(v172, v173, v174)
    if v174 then
        if v172.SequenceNumbers[v173] then
            local v175 = v174 - v172.SequenceNumbers[v173];
            if v175 > 0 then
                v172.SequenceNumbers[v173] = v174;
            end;
            return v175 - 1;
        else
            v172.SequenceNumbers[v173] = v174;
            return 0;
        end;
    else
        return 0;
    end;
end;
v61.onMissedSequence = function(v176, v177)
    v22:error("Detected a missed signalR message: {}", v177);
    v176:RejoinCurrentChannel();
end;
v61.onInstanceAdded = function(v178, v179)
    if v179:IsA("AudioDeviceInput") then
        if v25 then
            v178.audioDeviceInputAdded:Fire(v179);
        end;
        v22:debug("Found new audio device instance for {}", v179.Player and v179.Player.Name);
        v178.audioDevices[v179] = v178:CreateAudioDeviceData(v179);
        v178:emit("OnAudioDeviceInputAdded");
    end;
end;
v61.GetSendMuteEvent = function(v180)
    if not v180.SendMuteEvent then
        v180.SendMuteEvent = l_RobloxReplicatedStorage_0:WaitForChild("SetUserActive", 10);
    end;
    return v180.SendMuteEvent;
end;
v61.SetAndSyncActive = function(v181, v182, v183)
    v182.Active = v183;
    local l_v181_SendMuteEvent_0 = v181:GetSendMuteEvent();
    if l_v181_SendMuteEvent_0 and v182.Player == l_Players_0.LocalPlayer then
        l_v181_SendMuteEvent_0:FireServer(v183);
    end;
end;
v61.CreateAudioDeviceData = function(v185, v186)
    local v187 = {};
    local v188 = v186.Player == l_Players_0.LocalPlayer;
    if v186.Active then
        if not (not v185.muteAll or v188) then
            v186.Active = false;
        end;
        if not (not v186.Player or not v185.mutedPlayers[v186.Player.UserId]) then
            v186.Active = false;
        end;
    end;
    if not ((not v29 or not v186.Active) or not v188) and v185.localMuted == nil then
        v185:SetAndSyncActive(v186, false);
    end;
    if not ((v188 and v185.localMuted ~= nil) and v185.localMuted ~= not v186.Active) or v185.isInCall then
        if not (not v185.isInCall or not v188) then
            local v189 = not v185.callMutedState;
            v22:debug("Overwriting Active State to match Iris call. .Active = {}", v189);
            v186.Active = v189;
            local l_v185_SendMuteEvent_0 = v185:GetSendMuteEvent();
            if l_v185_SendMuteEvent_0 then
                l_v185_SendMuteEvent_0:FireServer(v189);
            end;
        end;
    else
        v22:debug("Mismatch between LocalMuted and device.Active");
        local v191 = not v185.localMuted;
        v186.Active = v191;
        local l_v185_SendMuteEvent_1 = v185:GetSendMuteEvent();
        if l_v185_SendMuteEvent_1 then
            l_v185_SendMuteEvent_1:FireServer(v191);
        end;
    end;
    v187.onPlayerChanged = v186:GetPropertyChangedSignal("Player"):Connect(function()
        if v30 then
            v188 = v186.Player == l_Players_0.LocalPlayer;
            if not v188 then
                if not (not v185.muteAll and (not v186.Player or not v185.mutedPlayers[v186.Player.UserId])) then
                    v186.Active = false;
                end;
            elseif not (not v29 or not v186.Active) and v185.localMuted == nil then
                v185:SetAndSyncActive(v186, false);
            elseif v185.localMuted ~= nil and v185.localMuted ~= not v186.Active then
                v22:debug("Mismatch between LocalMuted and device.Active");
                v185:SetAndSyncActive(v186, not v185.localMuted);
            end;
        end;
        v185:emit("OnDevicePlayerChanged");
    end);
    v187.onMutedChanged = v186:GetPropertyChangedSignal("Muted"):Connect(function()
        v185:emit("OnDeviceMuteChanged");
    end);
    v187.onActiveChanged = v186:GetPropertyChangedSignal("Active"):Connect(function()
        v185:emit("OnDeviceActiveChanged");
        if not (not v185.muteAll or v188) then
            v186.Active = false;
        end;
        if not (not v186.Player or not v185.mutedPlayers[v186.Player.UserId]) then
            v186.Active = false;
        end;
    end);
    return v187;
end;
v61.onInstanceRemove = function(v193, v194)
    if v194:IsA("AudioDeviceInput") then
        v22:trace("Removing AudioDeviceInput {} {} {}", v194, "for user", v194.Player and v194.Player.UserId);
        local v195 = v193.audioDevices[v194];
        if v195 then
            v195.onActiveChanged:Disconnect();
            v195.onMutedChanged:Disconnect();
            v195.onPlayerChanged:Disconnect();
        end;
        v193.audioDevices[v194] = nil;
        v193:emit("OnAudioDeviceInputRemoved");
    end;
end;
v61.hookupAudioDeviceInputListener = function(v196)
    v22:debug("Hooking up audio device listeners");
    local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    if not v28 then
        game.DescendantAdded:Connect(function(v198)
            v196:onInstanceAdded(v198);
        end);
    else
        l_SoundService_0.AudioInstanceAdded:Connect(function(v199)
            v196:onInstanceAdded(v199);
        end);
    end;
    local l_AudioDeviceInput_0 = l_LocalPlayer_0:FindFirstChildOfClass("AudioDeviceInput");
    v22:debug("Found local user audio device {}", l_AudioDeviceInput_0);
    if l_AudioDeviceInput_0 then
        v196:onInstanceAdded(l_AudioDeviceInput_0);
    end;
    if l_VoiceChatService_0.EnableDefaultVoice then
        v22:debug("Creating default voice listener");
        local l_AudioListener_0 = Instance.new("AudioListener");
        l_AudioListener_0.Parent = workspace.CurrentCamera;
        local l_Wire_0 = Instance.new("Wire");
        l_Wire_0.Parent = l_AudioListener_0;
        local l_AudioDeviceOutput_0 = Instance.new("AudioDeviceOutput");
        l_AudioDeviceOutput_0.Parent = l_Wire_0;
        l_Wire_0.SourceInstance = l_AudioListener_0;
        l_Wire_0.TargetInstance = l_AudioDeviceOutput_0;
        if v24 then
            for _, v205 in l_CollectionService_0:GetTagged("RbxDefaultVoiceEmitter") do
                v14.destroyDefaultEmitter(v205);
            end;
            l_CollectionService_0:GetInstanceAddedSignal("RbxDefaultVoiceEmitter"):Connect(v14.destroyDefaultEmitter);
        end;
        l_LocalPlayer_0.CharacterAdded:Connect(v14.avoidEmitting);
        if l_LocalPlayer_0.Character then
            v14.avoidEmitting(l_LocalPlayer_0.Character);
        end;
    end;
    game.DescendantRemoving:Connect(function(v206)
        v196:onInstanceRemove(v206);
    end);
    for _, v208 in game:GetDescendants() do
        v196:onInstanceAdded(v208);
    end;
    l_Players_0.PlayerRemoving:Connect(function(v209)
        for v210 in v196.audioDevices, nil, nil do
            if v210.Player and v210.Player == v209 then
                v196:onInstanceRemove(v210);
            end;
        end;
    end);
end;
v61.RejoinCurrentChannel = function(v211)
    pcall(function()
        local l_GroupId_0 = v211.service:GetGroupId();
        if l_GroupId_0 and l_GroupId_0 ~= "" then
            local v213 = v211.service:IsPublishPaused();
            v211.service:Leave();
            if v41() then
                v22:debug("Rejoining current channel {}", l_GroupId_0);
                v211.participants = {};
                v211.participantsUpdate:Fire(v211.participants);
            end;
            if not v211.service:JoinByGroupIdToken(l_GroupId_0, v213, true) then
                v211:emit("OnInitialJoinFailed");
            end;
        end;
    end);
end;
v61.watchSignalR = function(v214)
    v214.NotificationService.RobloxEventReceived:Connect(function(v215)
        local l_namespace_0 = v215.namespace;
        if l_WATCHED_NAMESPACES_0[l_namespace_0] then
            local v217 = v14.jsonDecode(v215.detail);
            if v40() then
                local v218 = v214.SignalREventTable[v217.type];
                if v218 then
                    v218:Fire(v217);
                end;
            end;
            local l_SequenceNumber_0 = v217.SequenceNumber;
            v22:trace("SignalR message {}: {}", l_namespace_0, l_SequenceNumber_0);
            local v220 = v214:checkAndUpdateSequence(l_namespace_0, l_SequenceNumber_0);
            if v220 > 0 then
                v214.Analytics:reportReconnectDueToMissedSequence();
                if v44() then
                    v214:onMissedSequence(l_namespace_0);
                    return ;
                end;
            elseif v220 < -1 then
                v214.Analytics:reportOutOfOrderSequence();
            end;
            return ;
        else
            return ;
        end;
    end);
    v214.NotificationService.RobloxConnectionChanged:Connect(function(v221, v222, _, v224)
        if v221 == "signalR" then
            if v222 ~= Enum.ConnectionState.Connected then
                v22:info("SignalR disconnected");
                return ;
            else
                for v225, v226 in pairs(v14.jsonDecode(v224)) do
                    if l_WATCHED_NAMESPACES_0[v225] then
                        v22:trace("SignalR message {}: {}", v225, v226);
                        local v227 = v214:checkAndUpdateSequence(v225, v226);
                        if v227 > 0 then
                            v214.Analytics:reportReconnectDueToMissedSequence();
                            if v44() then
                                v214:onMissedSequence(v225);
                            end;
                        elseif v227 < -1 then
                            v214.Analytics:reportOutOfOrderSequence();
                        end;
                    end;
                end;
            end;
        end;
    end);
end;
v61.getService = function(v228)
    return v228.service;
end;
v61.ToggleMic = function(v229, v230)
    v229:ensureInitialized("toggle mic");
    if v229.localMuted == nil then
        return ;
    else
        if v50() then
            if v229.permissionState == l_PERMISSION_STATE_0.PENDING_MIC then
                v22:debug("In pending mic mode, requesting permission");
                v229:emit("GetPermissions", function(v231)
                    v229.permissionState = if not v231.hasMicPermissions then l_PERMISSION_STATE_0.LISTEN_ONLY else l_PERMISSION_STATE_0.LISTEN_AND_TALK;
                    v22:debug("Got permissions, setting state to {}", v229.permissionState);
                    v229:ToggleMic(v230);
                end, {
                    l_PermissionsProtocol_0.Permissions.MICROPHONE_ACCESS
                }, false);
                return ;
            elseif v229.permissionState == l_PERMISSION_STATE_0.LISTEN_ONLY then
                v22:debug("User tried to unmute despite being in listen only mode");
                v229:emit("OnPermissionRequested");
                return ;
            end;
        end;
        if not v46() then
            local v232 = not v229.service:IsPublishPaused();
            v22:trace("Setting self mute to {}", v232);
            v229.service:PublishPause(v232);
            v229.localMuted = v232;
            v229.muteChanged:Fire(v232);
        else
            v229.localMuted = not v229.localMuted;
            local v233 = not v229.localMuted;
            v22:trace("Setting self mute to {}", v233);
            local l_v229_SendMuteEvent_0 = v229:GetSendMuteEvent();
            if not l_v229_SendMuteEvent_0 then
                v22:error("Could not find SendMuteEvent");
            else
                l_v229_SendMuteEvent_0:FireServer(v233);
                for v235 in v229.audioDevices, nil, nil do
                    if v235.Player and v235.Player == l_Players_0.LocalPlayer then
                        v235.Active = v233;
                    end;
                end;
                v229.muteChanged:Fire(v229.localMuted);
            end;
        end;
        if not v229.localMuted then
            v229.talkingChanged:Fire(v229.isTalking);
        end;
        if v230 then
            v229.Analytics:reportVoiceMuteSelf((v229:JoinWithVoiceMuteData({
                context = v230, 
                muted = v229.localMuted
            })));
        end;
        return ;
    end;
end;
v61.JoinWithVoiceMuteData = function(v236, v237)
    return v12.Dictionary.join({
        userId = l_Players_0.LocalPlayer.UserId, 
        clientSessionId = v236:GetSessionId(), 
        channelId = v236:GetChannelId()
    }, v237);
end;
v61._reportJoinFailed = function(v238, v239, v240)
    if v39() then
        v238.Analytics:reportVoiceChatJoinResult(false, v239, v240);
    end;
end;
v61._asyncInit = function(v241)
    v241:CheckCallState();
    return v241:canUseServiceAsync():andThen(function(_)
        local v243 = "VoiceChatService";
        if game:GetEngineFeature("UseNewVoiceChatService") then
            v243 = "VoiceChatInternal";
            v22:debug("Using VoiceChatInternal");
        end;
        local l_status_3, l_result_3 = pcall(function()
            local l_game_Service_0 = game:GetService(v243);
            if not (not l_game_Service_0 or l_game_Service_0:GetVoiceChatApiVersion() >= l_MIN_VOICE_CHAT_API_VERSION_IS_CONTEXT_ENABLED_0 and not l_game_Service_0:IsContextVoiceEnabled()) then
                v241.voiceEnabled = true;
                v241.service = l_game_Service_0;
                if v23 then
                    v241:SetupParticipantListeners();
                end;
            end;
        end);
        if l_status_3 then
            if v241.service then
                v241:watchSignalR();
                return if not v25 then v11.resolve() else v241:CheckAudioInputExists();
            else
                v22:debug("VoiceChatService is not set after init");
                v241:_reportJoinFailed("contextNotEnabled");
                return v11.reject();
            end;
        else
            v22:warning("EnableVoiceChat flag is enabled but GetService panicked {}", l_result_3);
            v241:_reportJoinFailed("getServiceFailed", v16.ERROR);
            return v11.reject();
        end;
    end);
end;
v61.asyncInit = function(v247)
    if not v247.service then
        if not v247.initPromise then
            if not (not v27 or v247.LikelySpeakingUsersEvent) then
                local l_v247_LikelySpeakingUsersEvent_0 = v247:GetLikelySpeakingUsersEvent();
                if l_v247_LikelySpeakingUsersEvent_0 then
                    v22:trace("Connecting to likely speaking users");
                    l_v247_LikelySpeakingUsersEvent_0.OnClientEvent:Connect(function(v249)
                        v22:trace("New Likely Speaking Users: {}", l_HttpService_0:JSONEncode(v249));
                    end);
                end;
            end;
            v247.initPromise = v247:_asyncInit();
        end;
        return v247.initPromise;
    else
        v22:trace("Manager already initialized");
        return v11.resolve();
    end;
end;
v61.GetLikelySpeakingUsersEvent = function(v250)
    if not v250.LikelySpeakingUsersEvent then
        v250.LikelySpeakingUsersEvent = l_RobloxReplicatedStorage_0:WaitForChild("SendLikelySpeakingUsers", 3);
    end;
    return v250.LikelySpeakingUsersEvent;
end;
v61.ensureInitialized = function(v251, v252)
    if not v251.service then
        error("[corescripts VCS Manager] " .. "Attempting to " .. v252 .. " before calling init");
    end;
end;
v61.GetSessionId = function(v253)
    v253:ensureInitialized("get session id");
    return v253.service:GetSessionId();
end;
v61.GetChannelId = function(v254)
    v254:ensureInitialized("get channel id");
    return v254.service:GetChannelId();
end;
v61.Disconnect = function(v255)
    if v255.participantConnection then
        v255.participantConnection:Disconnect();
        v255.participantConnection = nil;
    end;
    if v255.stateConnection then
        v255.stateConnection:Disconnect();
        v255.stateConnection = nil;
    end;
    if v255.micConnection then
        v255.micConnection:Disconnect();
        v255.micConnection = nil;
    end;
    if v255.blockConnection then
        v255.blockConnection:Disconnect();
        v255.blockConnection = nil;
    end;
    if v255.playerModeratedConnection then
        v255.playerModeratedConnection:Disconnect();
        v255.playerModeratedConnection = nil;
    end;
    if v255.voiceToxicityModalConnection then
        v255.voiceToxicityModalConnection:Disconnect();
        v255.voiceToxicityModalConnection = nil;
    end;
    if v255.VoiceToxicityToastConnection then
        v255.VoiceToxicityToastConnection:Disconnect();
        v255.VoiceToxicityToastConnection = nil;
    end;
end;
v61.default = v61.new(not not v34() and v21:GetAfterBlockedStatusChangedEvent() or v21:GetBlockedStatusChangedEvent(), l_PermissionsProtocol_0.default, l_HttpRbxApiService_0);
return v61;
