local l_CorePackages_0 = game:GetService("CorePackages");
local l_Players_0 = game:GetService("Players");
local l_CollectionService_0 = game:GetService("CollectionService");
local v3 = require(l_CorePackages_0.Promise);
local v4 = require(l_CorePackages_0.Roact);
local v5 = require(l_CorePackages_0.Cryo);
local v6 = require(l_CorePackages_0.Packages.LuauPolyfill);
local l_PermissionsProtocol_0 = require(l_CorePackages_0.Workspace.Packages.PermissionsProtocol).PermissionsProtocol;
local l_CoreGui_0 = game:GetService("CoreGui");
local l_RunService_0 = game:GetService("RunService");
local l_SoundService_0 = game:GetService("SoundService");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_NotificationService_0 = game:GetService("NotificationService");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_RobloxReplicatedStorage_0 = game:GetService("RobloxReplicatedStorage");
local l_VoiceChatService_0 = game:GetService("VoiceChatService");
local v16 = require(l_RobloxGui_0.Modules.Logger):new(script.Name);
local v17 = require(l_RobloxGui_0:WaitForChild("Modules").Common.IXPServiceWrapper);
local v18 = require(l_RobloxGui_0.Modules.Flags.GetFFlagEnableUniveralVoiceToasts);
local v19 = require(l_RobloxGui_0.Modules.Flags.GetFFlagEnableVoiceMicPromptToastFix);
local v20 = require(l_RobloxGui_0.Modules.Flags.GetFFlagEnableVoicePromptReasonText);
local v21 = require(l_RobloxGui_0.Modules.Flags.GetFFlagEnableErrorIconFix);
local v22 = require(l_RobloxGui_0.Modules.Flags.GetFFlagDeferredBlockStatusChange);
local v23 = require(l_RobloxGui_0.Modules.Flags.GetFFlagPlayerListAnimateMic);
local v24 = require(l_RobloxGui_0.Modules.Flags.GetFFlagOldMenuUseSpeakerIcons);
local v25 = require(l_RobloxGui_0.Modules.Flags.GetFFlagClearVoiceStateOnRejoin);
local v26 = require(l_RobloxGui_0.Modules.Flags.GetFFlagEnableVoiceRccCheck);
local v27 = require(l_RobloxGui_0.Modules.Flags.GetFFlagClearUserFromRecentVoiceDataOnLeave);
local v28 = require(l_RobloxGui_0.Modules.Flags.GetFIntVoiceUsersInteractionExpiryTimeSeconds);
local v29 = require(l_RobloxGui_0.Modules.Flags.GetFFlagEnableLuaVoiceChatAnalytics);
local v30 = require(l_RobloxGui_0.Modules.Flags.GetFFlagVoiceChatUseSoundServiceInputApi);
local v31 = require(l_RobloxGui_0.Modules.Flags.GetFFlagVoiceChatWatchForMissedSignalROnEventReceived);
local v32 = require(l_RobloxGui_0.Modules.Flags.GetFFlagAvatarChatServiceEnabled);
local v33 = require(l_RobloxGui_0.Modules.Flags.GetFFlagVoiceChatServiceManagerUseAvatarChat);
local v34 = require(l_RobloxGui_0.Modules.Flags.FFlagAvatarChatCoreScriptSupport);
local v35 = require(l_RobloxGui_0.Modules.Flags.GetFFlagLuaConsumePlayerModerated);
local v36 = require(l_RobloxGui_0.Modules.Flags.GetFFlagUseLuaSignalrConsumer);
local v37 = require(l_RobloxGui_0.Modules.Flags.GetFFlagEnableVoiceNudge);
local v38 = require(l_RobloxGui_0.Modules.Flags.GetFFlagAlwaysMountVoicePrompt);
local v39 = require(l_RobloxGui_0.Modules.Flags.GetFFlagEnableNudgeAnalytics);
local v40 = require(l_RobloxGui_0.Modules.Flags.GetFFlagVoiceUseAudioRoutingAPI);
local v41 = require(l_RobloxGui_0.Modules.Flags.GetFFlagLocalMutedNilFix);
local v42 = require(l_RobloxGui_0.Modules.Flags.FFlagMuteNonFriendsEvent);
local v43 = require(l_RobloxGui_0.Modules.Settings.Flags.GetFFlagShowMuteToggles);
local v44 = require(l_RobloxGui_0.Modules.Flags.GetFFlagJoinWithoutMicPermissions);
local v45 = require(script.Parent.Flags.GetFFlagEnableCoreVoiceChatModule)();
local v46 = nil;
if v45 then
    v46 = require(l_CorePackages_0.Workspace.Packages.VoiceChatCore);
end;
local v47 = game:DefineFastFlag("FixNudgeDeniedEvents", false);
local v48 = game:DefineFastFlag("FixNonSelfCalls", false);
local v49 = game:DefineFastFlag("DebugShowAudioDeviceInputDebugger", false);
local v50 = game:DefineFastFlag("FixMissingPermissionsAnalytics", false);
local v51 = game:DefineFastFlag("DebugSkipVoicePermissionCheck", false);
local v52 = game:DefineFastFlag("AlwaysSetupVoiceListeners", false);
local v53 = game:DefineFastFlag("OverwriteIsMutedLocally", false);
local v54 = game:DefineFastFlag("HideVoiceUIUntilInputExists", false);
local v55 = game:DefineFastFlag("FFlagFixNewAudioAPIEcho", false);
local v56 = game:DefineFastFlag("UpdateDeviceInputPlayerChanged", false);
local v57 = game:DefineFastFlag("SetActiveWhenConnecting", false);
local v58 = game:DefineFastFlag("HideUIWhenVoiceDefaultDisabled", false);
local v59 = game:DefineFastFlag("UseAudioInstanceAdded", false) and game:GetEngineFeature("AudioInstanceAddedApiEnabled");
local v60 = game:DefineFastFlag("DebugReceiveLikelySpeakingUsers", false);
local v61 = nil;
if not v46 then
    v61 = game:GetEngineFeature("AvatarChatServiceEnableVoiceEnabled") and game:DefineFastFlag("EnableVoiceSignal", false);
else
    v52 = require(v46.Flags.GetFFlagAlwaysSetupVoiceListeners)();
    v53 = require(v46.Flags.GetFFlagOverwriteIsMutedLocally)();
    v54 = require(v46.Flags.GetFFlagHideVoiceUIUntilInputExists)();
    v55 = require(v46.Flags.GetFFlagFixNewAudioAPIEcho)();
    v56 = require(v46.Flags.GetFFlagUpdateDeviceInputPlayerChanged)();
    v57 = require(v46.Flags.GetFFlagSetActiveWhenConnecting)();
    v58 = require(v46.Flags.GetFFlagHideUIWhenVoiceDefaultDisabled)();
    v59 = require(v46.Flags.GetFFlagUseAudioInstanceAdded)();
    v60 = require(v46.Flags.GetFFlagReceiveLikelySpeakingUsers)();
    v61 = require(v46.Flags.GetFFlagEnableVoiceSignal)();
end;
local v62 = require(l_RobloxGui_0.Modules.Flags.getFFlagMicrophoneDevicePermissionsPromptLogging);
local v63 = require(l_RobloxGui_0.Modules.Flags.GetFFlagVoiceBanShowToastOnSubsequentJoins);
local v64 = require(l_RobloxGui_0.Modules.Flags.GetFFlagUpdateNudgeV3VoiceBanUI);
local v65 = require(l_RobloxGui_0.Modules.Flags.GetFFlagEnableInExpVoiceUpsell);
local v66 = require(l_RobloxGui_0.Modules.Flags.GetFFlagBatchVoiceParticipantsUpdates);
local v67 = require(l_RobloxGui_0.Modules.Flags.GetFIntThrottleParticipantsUpdateMs);
local v68 = game:DefineFastString("VoiceUIImprovementsIXPLayerName", "Voice.Exposure");
local v69 = game:DefineFastString("ThrottleParticipantsUpdateIXPLayerValue", "ThrottleParticipantsUpdate");
local v70 = require(l_CorePackages_0.Workspace.Packages.VoiceChat);
local l_Constants_0 = v70.Constants;
local l_GetShowAgeVerificationOverlay_0 = v70.AgeVerificationOverlay.GetShowAgeVerificationOverlay;
local v73 = require(l_RobloxGui_0.Modules.VoiceChat.Constants);
local v74 = require(l_RobloxGui_0.Modules.VoiceChatPrompt.Components.VoiceChatPrompt);
local v75 = require(l_RobloxGui_0.Modules.VoiceChat.Components.AudioDeviceInputDebugger);
local v76 = require(l_RobloxGui_0.Modules.VoiceChatPrompt.PromptType);
local l_GetUserSettings_0 = v70.GetUserSettings;
local l_GetInformedOfBan_0 = v70.GetInformedOfBan;
local l_PostInformedOfBan_0 = v70.PostInformedOfBan;
local v80 = require(l_RobloxGui_0.Modules.Settings.getCamMicPermissions);
local l_BAN_REASON_0 = v73.BAN_REASON;
local v82 = if not v46 then require(script.Parent.Analytics) else v46.Analytics;
local l_HttpService_0 = game:GetService("HttpService");
local l_HttpRbxApiService_0 = game:GetService("HttpRbxApiService");
local v85 = require(l_RobloxGui_0.Modules.BlockingUtility);
local v86 = require(l_RobloxGui_0.Modules.Settings.Resources.MicrophoneDevicePermissionsLogging);
local v87 = if not v32() then nil else game:GetService("AvatarChatService");
local v88 = game:DefineFastFlag("EasierUnmutingPassMuteStatus", false);
local v89 = if not v88 then nil else require(l_CorePackages_0.ExperienceChat);
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.LinkingProtocol).LinkingProtocol.default;
local l_default_1 = require(l_CorePackages_0.Workspace.Packages.CallProtocol).CallProtocol.default;
local l_Enums_0 = require(l_CorePackages_0.Workspace.Packages.CallProtocol).Enums;
local v93 = nil;
local v94 = nil;
if v46 then
    v93 = v46.CoreVoiceManager;
    v94 = v46.Constants;
end;
local l_VOICE_STATE_0 = l_Constants_0.VOICE_STATE;
local l_VOICE_CHAT_DEVICE_TYPE_0 = l_Constants_0.VOICE_CHAT_DEVICE_TYPE;
local l_MIN_VOICE_CHAT_API_VERSION_IS_CONTEXT_ENABLED_0 = l_Constants_0.MIN_VOICE_CHAT_API_VERSION_IS_CONTEXT_ENABLED;
local l_VOICE_CHAT_AVAILABILITY_0 = l_Constants_0.VOICE_CHAT_AVAILABILITY;
local l_MIN_VOICE_CHAT_API_VERSION_LOCAL_MIC_ACTIVITY_0 = l_Constants_0.MIN_VOICE_CHAT_API_VERSION_LOCAL_MIC_ACTIVITY;
local l_MIN_VOICE_CHAT_API_VERSION_0 = l_Constants_0.MIN_VOICE_CHAT_API_VERSION;
local l_WATCHED_NAMESPACES_0 = l_Constants_0.WATCHED_NAMESPACES;
local l_WATCHED_MESSAGE_TYPES_0 = l_Constants_0.WATCHED_MESSAGE_TYPES;
local l_PERMISSION_STATE_0 = l_Constants_0.PERMISSION_STATE;
local v104 = if not v46 then v73.VOICE_JOIN_PROGRESS else v94.VOICE_JOIN_PROGRESS;
local v105 = {
    available = nil, 
    version = nil, 
    participants = nil, 
    recentUsersInteractionData = nil, 
    permissionPromise = nil, 
    canUseServicePromise = nil, 
    localMuted = nil, 
    isTalking = false, 
    previousGroupId = nil, 
    previousMutedState = nil, 
    userEligible = false, 
    HttpRbxApiService = l_HttpRbxApiService_0, 
    NotificationService = l_NotificationService_0, 
    runService = l_RunService_0, 
    PermissionsService = l_PermissionsProtocol_0.default, 
    communicationPermissionsResult = nil, 
    VoiceJoinProgress = v104.Idle, 
    VoiceJoinProgressChanged = Instance.new("BindableEvent"), 
    participantJoined = Instance.new("BindableEvent"), 
    participantLeft = Instance.new("BindableEvent"), 
    participantsUpdate = Instance.new("BindableEvent"), 
    muteChanged = Instance.new("BindableEvent"), 
    muteAllChanged = Instance.new("BindableEvent"), 
    attemptVoiceRejoin = Instance.new("BindableEvent"), 
    mutedNonFriends = if not v42 then nil else Instance.new("BindableEvent"), 
    userAgencySelected = if not v43() then nil else Instance.new("BindableEvent"), 
    audioDeviceInputAdded = if not v54 then nil else Instance.new("BindableEvent"), 
    sendMuteEvent = nil, 
    LikelySpeakingUsersEvent = nil, 
    muteAll = false, 
    mutedPlayers = {}, 
    talkingChanged = Instance.new("BindableEvent"), 
    SignalREventTable = {}, 
    audioDevices = {}, 
    service = nil, 
    previousSessionId = nil, 
    voiceEnabled = false, 
    VOICE_STATE = l_VOICE_STATE_0, 
    permissionState = if not v44() then nil else l_PERMISSION_STATE_0.IDLE, 
    isBanned = false, 
    bannedUntil = nil, 
    errorText = nil, 
    BlockStatusChanged = nil, 
    isInCall = false, 
    callMutedState = false, 
    banReason = nil, 
    _mutedAnyone = false, 
    VOICE_CHAT_DEVICE_TYPE = l_VOICE_CHAT_DEVICE_TYPE_0, 
    getPermissionsFunction = v80, 
    AvatarChatService = v87
};
local v106 = v6.Set.new({
    "available", 
    "participants", 
    "recentUsersInteractionData", 
    "permissionPromise", 
    "canUseServicePromise", 
    "localMuted", 
    "isTalking", 
    "previousGroupId", 
    "previousMutedState", 
    "userEligible", 
    "sendMuteEvent", 
    "LikelySpeakingUsersEvent", 
    "mutedPlayers", 
    "SignalREventTable", 
    "audioDevices", 
    "service", 
    "previousSessionId", 
    "voiceEnabled", 
    "permissionState", 
    "BlockStatusChanged", 
    "isInCall", 
    "callMutedState", 
    "participantJoined", 
    "participantLeft", 
    "participantsUpdate", 
    "muteChanged", 
    "audioDeviceInputAdded", 
    "talkingChanged"
});
local v107 = {};
getIconSrc = function(v108, v109)
    return "rbxasset://textures/ui/VoiceChat/" .. (not not v109 and v109 .. "/" or "") .. v108 .. ".png";
end;
getIcon = function(v110, v111, v112)
    if v110 == l_VOICE_STATE_0.MUTED then
        return getIconSrc("Muted", v112);
    elseif v110 == l_VOICE_STATE_0.CONNECTING then
        return getIconSrc("Connecting", v112);
    elseif v110 == l_VOICE_STATE_0.INACTIVE then
        return getIconSrc("Blank", v112);
    elseif v110 == l_VOICE_STATE_0.TALKING then
        return not not v111 and getIconSrc("Unmuted" .. tostring(20 * math.floor(0.5 + 5 * (v111 or math.random()))), v112) or getIconSrc("Blank", v112);
    else
        return getIconSrc("Error", v112);
    end;
end;
v105.__index = v105;
if v45 then
    v105.__index = function(v113, v114)
        if not v106:has(v114) then
            return (rawget(v105, v114));
        else
            return v113.coreVoiceManager[v114];
        end;
    end;
    v105.__newindex = function(v115, v116, v117)
        if not v106:has(v116) then
            rawset(v105, v116, v117);
            return ;
        else
            v115.coreVoiceManager[v116] = v117;
            return ;
        end;
    end;
end;
v105.new = function(v118, v119, v120, v121, v122, v123, v124, v125, v126)
    local v127 = setmetatable({
        service = v119, 
        HttpRbxApiService = v120, 
        NotificationService = v124, 
        PermissionsService = v121, 
        BlockStatusChanged = v122, 
        Analytics = v82.new(v123), 
        getPermissionsFunction = v125 or v80, 
        AvatarChatService = v126, 
        SequenceNumbers = {}, 
        SignalREventTable = {}, 
        coreVoiceManager = v118, 
        _mutedAnyone = false
    }, v105);
    if v36() then
        for _, v129 in l_WATCHED_MESSAGE_TYPES_0, nil, nil do
            v127.SignalREventTable[v129] = Instance.new("BindableEvent");
        end;
    end;
    v127.shouldThrottleParticipantUpdate = false;
    v127.participantsStateThrottleTime = 0;
    v127.lastParticipantsStateUpdate = 0;
    v127.lastStateUpdateCounter = 0;
    if v67() > 0 then
        v127.participantsStateThrottleTime = v67() / 1000;
        local l_status_0, l_result_0 = pcall(function()
            return v17:GetLayerData(v68);
        end);
        if not ((not l_status_0 or not l_result_0) or not l_result_0[v69]) then
            v127.shouldThrottleParticipantUpdate = true;
        end;
    end;
    local v132 = not v24() and "MicLight" or "SpeakerLight";
    v127.MuteStatusIcons = {
        MicOn = v127:GetIcon("Unmuted0", v132), 
        MicOff = v127:GetIcon("Muted", v132), 
        MicDisabled = v127:GetIcon("Muted", v132), 
        Loading = v127:GetIcon("Connecting", v132), 
        Error = v127:GetIcon("Error", v132)
    };
    v127.PlayerMuteStatusIcons = {
        MicOn = v127:GetIcon("Unmuted0", "MicLight"), 
        MicOff = v127:GetIcon("Muted", "MicLight"), 
        MicDisabled = v127:GetIcon("Muted", "MicLight"), 
        Loading = v127:GetIcon("Connecting", "MicLight"), 
        Error = v127:GetIcon("Error", "MicLight")
    };
    if v45 then
        v127.coreVoiceManager:subscribe("GetPermissions", function(v133, v134, v135)
            v127.getPermissionsFunction(v133, v134, v135, "VoiceChatServiceManager.requestMicPermission");
        end);
        v127.coreVoiceManager:subscribe("OnVoiceParticipantRemoved", function(v136)
            if not (not v88 or not v89.Events.VoiceParticipantRemoved) then
                v89.Events.VoiceParticipantRemoved((tostring(v136)));
            end;
        end);
        v127.coreVoiceManager:subscribe("OnVoiceParticipantAdded", function(v137)
            if not (not v88 or not v89.Events.VoiceParticipantAdded) then
                v89.Events.VoiceParticipantAdded((tostring(v137)));
            end;
        end);
        v127.coreVoiceManager:subscribe("OnVoiceParticipantToggleMuted", function(v138, v139)
            if not (not v88 or not v89.Events.VoiceParticipantToggleMuted) then
                v89.Events.VoiceParticipantToggleMuted(tostring(v138), v139);
            end;
        end);
        v127.coreVoiceManager:subscribe("OnUserAndPlaceCanUseVoiceResolved", function(v140, v141)
            v127:_onUserAndPlaceCanUseVoiceResolved(v140, v141);
        end);
        v127.coreVoiceManager:subscribe("OnRequestMicPermissionResolved", function()
            if not v18() then
                return ;
            else
                return v127:CheckAndShowNotAudiblePrompt();
            end;
        end);
        v127.coreVoiceManager:subscribe("OnRequestMicPermissionRejected", function()
            if not v18() or v51 then
                return ;
            else
                return v127:CheckAndShowPermissionPrompt():finallyReturn(v3.reject());
            end;
        end);
        v127.coreVoiceManager:subscribe("OnDevicePlayerChanged", function()
            v127:UpdateAudioDeviceInputDebugger();
        end);
        v127.coreVoiceManager:subscribe("OnDeviceActiveChanged", function()
            v127:UpdateAudioDeviceInputDebugger();
        end);
        v127.coreVoiceManager:subscribe("OnDeviceMuteChanged", function()
            v127:UpdateAudioDeviceInputDebugger();
        end);
        v127.coreVoiceManager:subscribe("OnStateChanged", function()
            if v62() then
                v86:setClientSessionId(v127.coreVoiceManager:GetSessionId());
            end;
        end);
        v127.coreVoiceManager:subscribe("OnAudioDeviceInputAdded", function()
            v127:UpdateAudioDeviceInputDebugger();
        end);
        v127.coreVoiceManager:subscribe("OnAudioDeviceInputRemoved", function()
            v127:UpdateAudioDeviceInputDebugger();
        end);
        v127.coreVoiceManager:subscribe("OnInitialJoinFailed", function()
            v127:InitialJoinFailedPrompt();
        end);
        v127.coreVoiceManager:subscribe("OnPlayerModerated", function()
            v127:ShowPlayerModeratedMessage();
        end);
        v127.coreVoiceManager:subscribe("OnRetryRequested", function()
            v127:showPrompt(v76.Retry);
        end);
        v127.coreVoiceManager:subscribe("OnVoiceToxicityModal", function()
            v16:debug("Showing Voice Toxicity Modal");
            v127:showPrompt(v76.VoiceToxicityModal);
        end);
        v127.coreVoiceManager:subscribe("OnVoiceToxicityToast", function()
            v16:debug("Showing Voice Toxicity Toast");
            v127:showPrompt(v76.VoiceToxicityToast);
        end);
        v127.coreVoiceManager:subscribe("OnPermissionRequested", function()
            v127:showPrompt(v76.Permission);
        end);
    end;
    return v127;
end;
local function _(v142)
    return "..." .. string.sub(tostring(v142), -4);
end;
local function _(v144, v145)
    return function(...)
        return v144[v145](v144, ...);
    end;
end;
v105._reportJoinFailed = function(v147, v148, v149)
    if not v147.coreVoiceManager then
        if v29() then
            v147.Analytics:reportVoiceChatJoinResult(false, v148, v149);
        end;
        return ;
    else
        return v147.coreVoiceManager:_reportJoinFailed(v148, v149);
    end;
end;
v105._asyncInit = function(v150)
    if not v150.coreVoiceManager then
        v150:CheckCallState();
        return (if not v48 then v105 else v150):canUseServiceAsync():andThen(function(_)
            local v152 = "VoiceChatService";
            if game:GetEngineFeature("UseNewVoiceChatService") then
                v152 = "VoiceChatInternal";
                v16:debug("Using VoiceChatInternal");
            end;
            local l_status_1, l_result_1 = pcall(function()
                local l_game_Service_0 = game:GetService(v152);
                if not (not l_game_Service_0 or l_game_Service_0:GetVoiceChatApiVersion() >= l_MIN_VOICE_CHAT_API_VERSION_IS_CONTEXT_ENABLED_0 and not l_game_Service_0:IsContextVoiceEnabled()) then
                    v150.voiceEnabled = true;
                    v150.service = l_game_Service_0;
                    if v52 then
                        v150:SetupParticipantListeners();
                    end;
                end;
            end);
            if l_status_1 then
                if v150.service then
                    v150:watchSignalR();
                    return if not v54 then v3.resolve() else v150:CheckAudioInputExists();
                else
                    v16:debug("VoiceChatService is not set after init");
                    v150:_reportJoinFailed("contextNotEnabled");
                    return v3.reject();
                end;
            else
                v16:warning("EnableVoiceChat flag is enabled but GetService panicked {}", l_result_1);
                v150:_reportJoinFailed("getServiceFailed", v82.ERROR);
                return v3.reject();
            end;
        end);
    else
        return v150.coreVoiceManager:_asyncInit();
    end;
end;
v105.asyncInit = function(v156)
    if not v156.coreVoiceManager then
        if not v156.service then
            if not v156.initPromise then
                if not (not v60 or v156.LikelySpeakingUsersEvent) then
                    local l_v156_LikelySpeakingUsersEvent_0 = v156:GetLikelySpeakingUsersEvent();
                    if l_v156_LikelySpeakingUsersEvent_0 then
                        v16:trace("Connecting to likely speaking users");
                        l_v156_LikelySpeakingUsersEvent_0.OnClientEvent:Connect(function(v158)
                            v16:trace("New Likely Speaking Users: {}", l_HttpService_0:JSONEncode(v158));
                        end);
                    end;
                end;
                v156.initPromise = v156:_asyncInit();
            end;
            return v156.initPromise;
        else
            v16:trace("Manager already initialized");
            return v3.resolve();
        end;
    else
        return v156.coreVoiceManager:asyncInit();
    end;
end;
local v159 = nil;
v105.CheckAudioInputExists = function(v160)
    if not v160.coreVoiceManager then
        v16:trace("Checking for AudioDeviceInput");
        if not v159 then
            v159 = v3.new(function(v161, _)
                if #v5.Dictionary.keys(v160.audioDevices) > 0 then
                    v16:trace("Found existing AudioDeviceInput");
                    v161();
                    return ;
                else
                    v160.audioDeviceInputAdded.Event:Connect(function()
                        v16:trace("Found new AudioDeviceInput");
                        v161();
                    end);
                    return ;
                end;
            end);
        end;
        return v159;
    else
        return v160.coreVoiceManager:CheckAudioInputExists();
    end;
end;
v105.getService = function(v163)
    return v163.service;
end;
v105.GetMutedAnyone = function(v164)
    return v164._mutedAnyone;
end;
v105.GetRequest = function(v165, v166, v167)
    if not v165.coreVoiceManager then
        local l_status_2, l_result_2 = pcall(function()
            return l_HttpService_0:JSONDecode((v165.HttpRbxApiService:GetAsyncFullUrl(v166, Enum.ThrottlingPriority.Default, Enum.HttpRequestType.Players)));
        end);
        return l_status_2 and l_result_2;
    else
        return v165.coreVoiceManager:GetRequest(v166, v167);
    end;
end;
v105.PostRequest = function(v170, v171, _, v173)
    local l_status_3, l_result_3 = pcall(function()
        return l_HttpService_0:JSONDecode((v170.HttpRbxApiService:PostAsyncFullUrl(v171, v173, Enum.ThrottlingPriority.Default, Enum.HttpContentType.ApplicationJson, Enum.HttpRequestType.Players)));
    end);
    return l_status_3 and l_result_3;
end;
local function _(v176)
    local l_status_4, l_result_4 = pcall(function()
        return l_HttpService_0:JSONDecode(v176);
    end);
    if not l_status_4 or not l_result_4 then
        return {};
    else
        return l_result_4;
    end;
end;
v105._GetShowAgeVerificationOverlay = function(v180)
    local l_l_GetShowAgeVerificationOverlay_0_0 = l_GetShowAgeVerificationOverlay_0;
    local v182 = "GetRequest";
    return l_l_GetShowAgeVerificationOverlay_0_0(function(...)
        return v180[v182](v180, ...);
    end, tostring(game.GameId), (tostring(game.PlaceId)));
end;
v105.FetchAgeVerificationOverlay = function(v183)
    if not v183._getShowAgeVerificationOverlayResult then
        v183._getShowAgeVerificationOverlayResult = v183:_GetShowAgeVerificationOverlay();
    end;
    return v183._getShowAgeVerificationOverlayResult;
end;
v105.checkAndUpdateSequence = function(v184, v185, v186)
    if not v184.coreVoiceManager then
        if v186 then
            if v184.SequenceNumbers[v185] then
                local v187 = v186 - v184.SequenceNumbers[v185];
                if v187 > 0 then
                    v184.SequenceNumbers[v185] = v186;
                end;
                return v187 - 1;
            else
                v184.SequenceNumbers[v185] = v186;
                return 0;
            end;
        else
            return 0;
        end;
    else
        return v184.coreVoiceManager:checkAndUpdateSequence(v185, v186);
    end;
end;
v105.onMissedSequence = function(v188, v189)
    if not v188.coreVoiceManager then
        v16:error("Detected a missed signalR message: {}", v189);
        v188:RejoinCurrentChannel();
        return ;
    else
        return v188.coreVoiceManager:onMissedSequence(v189);
    end;
end;
v105.watchSignalR = function(v190)
    if not v190.coreVoiceManager then
        v190.NotificationService.RobloxEventReceived:Connect(function(v191)
            local l_namespace_0 = v191.namespace;
            if l_WATCHED_NAMESPACES_0[l_namespace_0] then
                local l_detail_0 = v191.detail;
                local l_l_detail_0_0 = l_detail_0 --[[ copy: 3 -> 6 ]];
                local l_status_5, l_result_5 = pcall(function()
                    return l_HttpService_0:JSONDecode(l_l_detail_0_0);
                end);
                local v197 = not not l_status_5 and l_result_5 or {};
                if v36() then
                    l_detail_0 = v190.SignalREventTable[v197.type];
                    if l_detail_0 then
                        l_detail_0:Fire(v197);
                    end;
                end;
                l_detail_0 = v197.SequenceNumber;
                v16:trace("SignalR message {}: {}", l_namespace_0, l_detail_0);
                l_status_5 = v190:checkAndUpdateSequence(l_namespace_0, l_detail_0);
                if l_status_5 > 0 then
                    v190.Analytics:reportReconnectDueToMissedSequence();
                    if v31() then
                        v190:onMissedSequence(l_namespace_0);
                        return ;
                    end;
                elseif l_status_5 < -1 then
                    v190.Analytics:reportOutOfOrderSequence();
                end;
                return ;
            else
                return ;
            end;
        end);
        v190.NotificationService.RobloxConnectionChanged:Connect(function(v198, v199, _, v201)
            if v198 == "signalR" then
                if v199 ~= Enum.ConnectionState.Connected then
                    v16:info("SignalR disconnected");
                    return ;
                else
                    local l_pairs_0 = pairs;
                    local l_status_6, l_result_6 = pcall(function()
                        return l_HttpService_0:JSONDecode(v201);
                    end);
                    local v205 = not not l_status_6 and l_result_6 or {};
                    for v206, v207 in l_pairs_0(v205) do
                        if l_WATCHED_NAMESPACES_0[v206] then
                            v16:trace("SignalR message {}: {}", v206, v207);
                            local v208 = v190:checkAndUpdateSequence(v206, v207);
                            if v208 > 0 then
                                v190.Analytics:reportReconnectDueToMissedSequence();
                                if v31() then
                                    v190:onMissedSequence(v206);
                                end;
                            elseif v208 < -1 then
                                v190.Analytics:reportOutOfOrderSequence();
                            end;
                        end;
                    end;
                end;
            end;
        end);
        return ;
    else
        return v190.coreVoiceManager:watchSignalR();
    end;
end;
v105.voicePermissionGranted = function(v209, v210)
    if not v209.coreVoiceManager then
        local _ = false;
        if typeof(v210) == "table" then
            local v212 = true;
            if v210.status ~= l_PermissionsProtocol_0.Status.AUTHORIZED then
                v212 = not v5.List.find(v210.missingPermissions, l_PermissionsProtocol_0.Permissions.MICROPHONE_ACCESS);
            end;
            return v212;
        else
            return v210 == l_PermissionsProtocol_0.Status.AUTHORIZED;
        end;
    else
        return v209.coreVoiceManager:voicePermissionGranted(v210);
    end;
end;
v105.GetSignalREvent = function(v213, v214)
    if not v213.coreVoiceManager then
        return v213.SignalREventTable[v214].Event;
    else
        return v213.coreVoiceManager:GetSignalREvent(v214);
    end;
end;
v105.avatarChatUserAndPlaceSettingsValueOfClientFeatures = function(v215, v216)
    if not v215.coreVoiceManager then
        return {
            universePlaceVoiceEnabledSettings = {
                isUniverseEnabledForVoice = v215.AvatarChatService:IsEnabled(v216, Enum.AvatarChatServiceFeature.UniverseAudio), 
                isPlaceEnabledForVoice = v215.AvatarChatService:IsEnabled(v216, Enum.AvatarChatServiceFeature.PlaceAudio), 
                isUniverseEnabledForAvatarVideo = v215.AvatarChatService:IsEnabled(v216, Enum.AvatarChatServiceFeature.UniverseVideo), 
                isPlaceEnabledForAvatarVideo = v215.AvatarChatService:IsEnabled(v216, Enum.AvatarChatServiceFeature.PlaceVideo)
            }, 
            voiceSettings = {
                isUserEligible = v215.AvatarChatService:IsEnabled(v216, Enum.AvatarChatServiceFeature.UserAudioEligible), 
                isVoiceEnabled = v215.AvatarChatService:IsEnabled(v216, Enum.AvatarChatServiceFeature.UserAudio), 
                isAvatarVideoEligible = v215.AvatarChatService:IsEnabled(v216, Enum.AvatarChatServiceFeature.UserVideoEligible), 
                isAvatarVideoEnabled = v215.AvatarChatService:IsEnabled(v216, Enum.AvatarChatServiceFeature.UserVideo), 
                isUserVerifiedForVoice = if not v61 then nil else v215.AvatarChatService:IsEnabled(v216, Enum.AvatarChatServiceFeature.UserVerifiedForVoice), 
                isBanned = v215.AvatarChatService:IsEnabled(v216, Enum.AvatarChatServiceFeature.UserBanned), 
                bannedUntil = nil
            }
        };
    else
        return v215.coreVoiceManager:avatarChatUserAndPlaceSettingsValueOfClientFeatures(v216);
    end;
end;
v105.resolveAvatarChatUserAndPlaceSettings = function(v217)
    if not v217.coreVoiceManager then
        local l_status_7, l_result_7 = pcall(v217.AvatarChatService.GetClientFeaturesAsync, v217.AvatarChatService);
        if l_status_7 then
            return v217:avatarChatUserAndPlaceSettingsValueOfClientFeatures(l_result_7);
        else
            return nil;
        end;
    else
        return v217.coreVoiceManager:resolveAvatarChatUserAndPlaceSettings();
    end;
end;
v105.EnableVoice = function(v220)
    v16:trace("Enabling voice");
    v220.AvatarChatService:GetPropertyChangedSignal("ClientFeatures"):Once(function()
        v220.attemptVoiceRejoin:Fire();
    end);
    v220.AvatarChatService:EnableVoice();
end;
v105._onUserAndPlaceCanUseVoiceResolved = function(v221, v222, v223)
    v221.bannedUntil = nil;
    if not v222 or not v222.isBanned then
        if (not v221.runService:IsStudio() or not v222) or v222.isVoiceEnabled then
            if not ((not v221.runService:IsStudio() or not v223) or v223.isPlaceEnabledForVoice) then
                v221:showPrompt(v76.Place, not not v20() and table.concat(v223.reasons or {}, "") or nil);
            end;
        else
            v221:showPrompt(v76.User);
            return ;
        end;
    else
        local l_l_GetInformedOfBan_0_0 = l_GetInformedOfBan_0;
        local v225 = "GetRequest";
        l_l_GetInformedOfBan_0_0 = l_l_GetInformedOfBan_0_0(function(...)
            return v221[v225](v221, ...);
        end);
        if not (not l_l_GetInformedOfBan_0_0 or l_l_GetInformedOfBan_0_0.informedOfBan) then
            if not (not v32() or not v33()) and v222.bannedUntil == nil then
                v221:ShowPlayerModeratedMessage();
            elseif v222.bannedUntil == nil then
                v221:showPrompt(v76.VoiceChatSuspendedPermanent);
            else
                v221.bannedUntil = v222.bannedUntil;
                if v64() and v222.banReason == l_BAN_REASON_0.NUDGE_V3 then
                    v221:showPrompt(v76.VoiceChatSuspendedTemporaryB);
                else
                    v221:showPrompt(v76.VoiceChatSuspendedTemporary);
                end;
            end;
        end;
        if not ((not v63() or not l_l_GetInformedOfBan_0_0) or not l_l_GetInformedOfBan_0_0.informedOfBan) then
            v221:ShowPlayerModeratedMessage(true);
            return ;
        end;
    end;
end;
v105.ChangeVoiceJoinProgress = function(v226, v227)
    v226.VoiceJoinProgress = v227;
    v226.VoiceJoinProgressChanged:Fire(v226.VoiceJoinProgress);
end;
v105.UserEligibleForInExperienceUpsell = function(v228)
    local l_communicationPermissionsResult_0 = v228.communicationPermissionsResult;
    if not (not l_communicationPermissionsResult_0 or not l_communicationPermissionsResult_0.voiceSettings) and l_communicationPermissionsResult_0.universePlaceVoiceEnabledSettings then
        local v230 = (l_communicationPermissionsResult_0.voiceSettings.isUserVerifiedForVoice and not l_communicationPermissionsResult_0.voiceSettings.isVoiceEnabled) and l_communicationPermissionsResult_0.universePlaceVoiceEnabledSettings.isPlaceEnabledForVoice;
        if v230 then
            local v231 = v228:FetchAgeVerificationOverlay();
            return (v230 and v231) and v231.showVoiceInExperienceUpsell;
        else
            return false;
        end;
    else
        return false;
    end;
end;
v105.userAndPlaceCanUseVoice = function(v232)
    if not v232.coreVoiceManager then
        local v233;
        if not v32() or not v33() then
            v233 = l_GetShowAgeVerificationOverlay_0;
            local v234 = "GetRequest";
            local l_v234_0 = v234 --[[ copy: 3 -> 7 ]];
            v233 = v233(function(...)
                return v232[l_v234_0](v232, ...);
            end, tostring(game.GameId), (tostring(game.PlaceId)));
        else
            v233 = v232:resolveAvatarChatUserAndPlaceSettings();
        end;
        if v233 then
            local l_universePlaceVoiceEnabledSettings_0 = v233.universePlaceVoiceEnabledSettings;
            local l_voiceSettings_0 = v233.voiceSettings;
            v16:trace("Voice settings endpoint returned {}", v233);
            if v61 then
                v232.communicationPermissionsResult = v233;
                if v232:UserEligibleForInExperienceUpsell() then
                    v232:ChangeVoiceJoinProgress(v104.Suspended);
                end;
            end;
            if not l_universePlaceVoiceEnabledSettings_0 or l_universePlaceVoiceEnabledSettings_0.isUniverseEnabledForVoice then
                v232.bannedUntil = nil;
                if not l_voiceSettings_0 or not l_voiceSettings_0.isBanned then
                    if (not v232.runService:IsStudio() or not l_voiceSettings_0) or l_voiceSettings_0.isVoiceEnabled then
                        if not ((not v232.runService:IsStudio() or not l_universePlaceVoiceEnabledSettings_0) or l_universePlaceVoiceEnabledSettings_0.isPlaceEnabledForVoice) then
                            v232:showPrompt(v76.Place, not not v20() and table.concat(l_universePlaceVoiceEnabledSettings_0.reasons or {}, "") or nil);
                        end;
                    else
                        v232:showPrompt(v76.User);
                    end;
                else
                    local l_l_GetInformedOfBan_0_1 = l_GetInformedOfBan_0;
                    local v239 = "GetRequest";
                    l_l_GetInformedOfBan_0_1 = l_l_GetInformedOfBan_0_1(function(...)
                        return v232[v239](v232, ...);
                    end);
                    if not (not l_l_GetInformedOfBan_0_1 or l_l_GetInformedOfBan_0_1.informedOfBan) then
                        if not (not v32() or not v33()) and l_voiceSettings_0.bannedUntil == nil then
                            v232:ShowPlayerModeratedMessage();
                        elseif l_voiceSettings_0.bannedUntil == nil then
                            v232:showPrompt(v76.VoiceChatSuspendedPermanent);
                        else
                            v232.bannedUntil = l_voiceSettings_0.bannedUntil;
                            if v64() and l_voiceSettings_0.banReason == l_BAN_REASON_0.NUDGE_V3 then
                                v232:showPrompt(v76.VoiceChatSuspendedTemporaryB);
                            else
                                v232:showPrompt(v76.VoiceChatSuspendedTemporary);
                            end;
                        end;
                    end;
                    if not ((not v63() or not l_l_GetInformedOfBan_0_1) or not l_l_GetInformedOfBan_0_1.informedOfBan) then
                        v232:ShowPlayerModeratedMessage(true);
                    end;
                end;
                if l_universePlaceVoiceEnabledSettings_0 and l_voiceSettings_0 then
                    if l_universePlaceVoiceEnabledSettings_0.isPlaceEnabledForVoice then
                        if not l_voiceSettings_0.isVoiceEnabled then
                            v232:_reportJoinFailed("userNotEnabled");
                        end;
                    else
                        v232:_reportJoinFailed("placeNotEnabled");
                    end;
                else
                    v232:_reportJoinFailed("invalidResponse", v82.ERROR);
                end;
                return ((l_universePlaceVoiceEnabledSettings_0 and l_voiceSettings_0) and l_voiceSettings_0.isVoiceEnabled) and l_universePlaceVoiceEnabledSettings_0.isPlaceEnabledForVoice;
            else
                v232:_reportJoinFailed("universeNotEnabled");
                return false;
            end;
        else
            v232:_reportJoinFailed("invalidResponse", v82.ERROR);
            return false;
        end;
    else
        return v232.coreVoiceManager:userAndPlaceCanUseVoice();
    end;
end;
v105.ShowPlayerModeratedMessage = function(v240, v241)
    local l_l_GetUserSettings_0_0 = l_GetUserSettings_0;
    local v243 = "GetRequest";
    l_l_GetUserSettings_0_0 = l_l_GetUserSettings_0_0(function(...)
        return v240[v243](v240, ...);
    end);
    if l_l_GetUserSettings_0_0 and l_l_GetUserSettings_0_0.isBanned then
        v240.banReason = l_l_GetUserSettings_0_0.banReason;
        if l_l_GetUserSettings_0_0.bannedUntil == nil then
            v240:showPrompt(v76.VoiceChatSuspendedPermanent);
            return ;
        else
            v240.bannedUntil = l_l_GetUserSettings_0_0.bannedUntil;
            if v63() then
                if not v241 then
                    if v64() and v240.banReason == l_BAN_REASON_0.NUDGE_V3 then
                        v240:showPrompt(v76.VoiceChatSuspendedTemporaryB);
                        return ;
                    else
                        v240:showPrompt(v76.VoiceChatSuspendedTemporary);
                        return ;
                    end;
                else
                    v240:showPrompt(v76.VoiceChatSuspendedTemporaryToast);
                    return ;
                end;
            else
                v240:showPrompt(v76.VoiceChatSuspendedTemporary);
                return ;
            end;
        end;
    else
        v240:_reportJoinFailed("PlayerModeratedBadState", v82.ERROR);
        return ;
    end;
end;
v105.CheckCallState = function(v244)
    if not v244.coreVoiceManager then
        v16:trace("Checking user call state");
        local l_status_8, l_result_8 = pcall(function()
            l_default_1:getCallState():andThen(function(v245)
                v16:trace("Got user call state");
                if v245.status ~= l_Enums_0.CallStatus.Idle.rawValue() and v245.status ~= l_Enums_0.CallStatus.Ringing.rawValue() then
                    v244.isInCall = true;
                    v244.callMutedState = v245.muted;
                    v16:trace("Changing call muted state to {}", v245.muted);
                end;
            end):catch(function(v246)
                v16:trace("User not in call {}", v246);
            end);
        end);
        if not l_status_8 then
            v16:debug("Error checking user call state {}", l_result_8);
        end;
        return ;
    else
        return v244.coreVoiceManager:CheckCallState();
    end;
end;
v105.ShowVoiceChatLoadingMessage = function(v249)
    v249:showPrompt(v76.VoiceLoading);
end;
v105.requestMicPermission = function(v250)
    if not v250.coreVoiceManager then
        if not v250.permissionPromise then
            local v251 = {
                l_PermissionsProtocol_0.Permissions.MICROPHONE_ACCESS
            };
            local v252 = nil;
            if not v44() then
                v252 = if not v34 then v250.PermissionsService:requestPermissions(v251) else v3.new(function(v253, _)
                    v250.getPermissionsFunction(function(v255)
                        v253({
                            status = not not v255.hasMicPermissions and l_PermissionsProtocol_0.Status.AUTHORIZED or l_PermissionsProtocol_0.Status.DENIED
                        });
                    end, v251, nil, "VoiceChatServiceManager.requestMicPermission");
                end);
            else
                v16:debug("Requesting device permission");
                local v256, v257 = v250.PermissionsService:hasPermissions(v251):await();
                if not v256 then
                    v16:error("PermissionsService call failed.");
                    v250.permissionState = l_PERMISSION_STATE_0.LISTEN_ONLY;
                elseif v257.status == l_PermissionsProtocol_0.Status.AUTHORIZED then
                    v250.permissionState = l_PERMISSION_STATE_0.LISTEN_AND_TALK;
                elseif not v257.missingPermissions then
                    if not v257.deniedPermissions then
                        v16:error("PermissionsService returned unknown permission state. Defaulting to listen only.");
                        v250.permissionState = l_PERMISSION_STATE_0.LISTEN_ONLY;
                    else
                        v250.permissionState = l_PERMISSION_STATE_0.LISTEN_ONLY;
                    end;
                else
                    v250.permissionState = l_PERMISSION_STATE_0.PENDING_MIC;
                end;
                v16:debug("Joining without mic permissions. Permission State: {}", v250.permissionState);
                v252 = v3.resolve();
            end;
            v250.permissionPromise = v252:andThen(function(v258)
                if not v44() then
                    if v258 or v258.status then
                        v16:debug("Permission status {}", v258.status);
                        local _ = nil;
                        return not not if not v34 then v258.status == l_PermissionsProtocol_0.Status.AUTHORIZED else v250:voicePermissionGranted(v258) and v3.resolve() or v3.reject();
                    else
                        v16:debug("No permission response, rejecting access");
                        v250:_reportJoinFailed("noPermissionResponse", v82.ERROR);
                        return v3.reject();
                    end;
                else
                    return v3.resolve();
                end;
            end):andThen(function()
                if not v18() then
                    return v3.resolve();
                else
                    return v250:CheckAndShowNotAudiblePrompt();
                end;
            end):catch(function()
                if not v18() or v51 then
                    return v3.reject();
                else
                    return v250:CheckAndShowPermissionPrompt():finallyReturn(v3.reject());
                end;
            end);
            return v250.permissionPromise;
        else
            v16:trace("PermissionProtocol already invoked");
            return v250.permissionPromise;
        end;
    else
        return v250.coreVoiceManager:requestMicPermission();
    end;
end;
v105.canUseServiceAsync = function(v260)
    if not v260.coreVoiceManager then
        if v260.available == nil and game:GetEngineFeature("VoiceChatSupported") then
            if not v260.canUseServicePromise then
                v260.canUseServicePromise = v3.defer(function(v261, v262)
                    local v263 = v260:userAndPlaceCanUseVoice();
                    if v61 and v260.VoiceJoinProgress == v104.Suspended then
                        v16:debug("Place is voice enabled but user is not, delaying voice rejection");
                        v260.attemptVoiceRejoin.Event:Wait();
                        v16:debug("Attempting voice rejoin");
                        v260.userEligible = true;
                        v261();
                        v260:ChangeVoiceJoinProgress(v104.Joining);
                        return ;
                    elseif v263 then
                        if not (not game:GetEngineFeature("VoiceChatEnabledRccProperties") or not v26()) then
                            if not game:IsLoaded() then
                                game.Loaded:Wait();
                            end;
                            if (not v58 or l_VoiceChatService_0.UseNewAudioApi) or l_VoiceChatService_0.EnableDefaultVoice then
                                if not (l_VoiceChatService_0.VoiceChatEnabledForUniverseOnRcc and l_VoiceChatService_0.VoiceChatEnabledForPlaceOnRcc) then
                                    v16:debug("Disabling voice chat due to RCC Response. Universe: {}, Place: {}", l_VoiceChatService_0.VoiceChatEnabledForUniverseOnRcc, l_VoiceChatService_0.VoiceChatEnabledForPlaceOnRcc);
                                    if l_VoiceChatService_0.VoiceChatEnabledForUniverseOnRcc then
                                        if not l_VoiceChatService_0.VoiceChatEnabledForPlaceOnRcc then
                                            v260:_reportJoinFailed("placeNotEnabled");
                                        end;
                                    else
                                        v260:_reportJoinFailed("universeNotEnabled");
                                    end;
                                    v260.available = l_VOICE_CHAT_AVAILABILITY_0.PlaceNotAvailable;
                                    v262();
                                    return ;
                                end;
                            else
                                v262();
                                return ;
                            end;
                        end;
                        v260.userEligible = true;
                        v261();
                        return ;
                    else
                        v16:info("Voice access denied");
                        v260.available = l_VOICE_CHAT_AVAILABILITY_0.UserNotAvailable;
                        v262();
                        return ;
                    end;
                end):andThen(function()
                    return v260:requestMicPermission();
                end);
            end;
            return v260.canUseServicePromise;
        else
            v16:debug("Voice Chat is not Available, rejecting canUseService promise");
            return v3.reject();
        end;
    else
        return v260.coreVoiceManager:canUseServiceAsync();
    end;
end;
v105.canUseService = function(v264)
    if v264.available == nil and game:GetEngineFeature("VoiceChatSupported") then
        local l_status_9, l_result_9 = pcall(function()
            return l_HttpService_0:JSONDecode((l_HttpRbxApiService_0:GetAsyncFullUrl("https://voice.roblox.com/v1/settings", Enum.ThrottlingPriority.Default, Enum.HttpRequestType.Players)));
        end);
        local v267 = l_status_9 and l_result_9.isVoiceEnabled;
        if not v267 then
            v264.available = l_VOICE_CHAT_AVAILABILITY_0.UserNotAvailable;
        end;
        return v267;
    else
        return false;
    end;
end;
v105.ensureInitialized = function(v268, v269)
    if not v268.coreVoiceManager then
        if not v268.service then
            error("[corescripts VCS Manager] " .. "Attempting to " .. v269 .. " before calling init");
        end;
        return ;
    else
        return v268.coreVoiceManager:ensureInitialized(v269);
    end;
end;
v105.GetSessionId = function(v270)
    if not v270.coreVoiceManager then
        v270:ensureInitialized("get session id");
        return v270.service:GetSessionId();
    else
        return v270.coreVoiceManager:GetSessionId();
    end;
end;
v105.GetChannelId = function(v271)
    if not v271.coreVoiceManager then
        v271:ensureInitialized("get channel id");
        return v271.service:GetChannelId();
    else
        return v271.coreVoiceManager:GetChannelId();
    end;
end;
v105.JoinWithVoiceMuteData = function(v272, v273)
    if not v272.coreVoiceManager then
        return v5.Dictionary.join({
            userId = l_Players_0.LocalPlayer.UserId, 
            clientSessionId = v272:GetSessionId(), 
            channelId = v272:GetChannelId()
        }, v273);
    else
        return v272.coreVoiceManager:JoinWithVoiceMuteData(v273);
    end;
end;
v105.calculateBanDuration = function(_, v275, v276)
    return (math.ceil((v276 - v275) / 60));
end;
v105.createPromptInstance = function(v277, v278, v279)
    if not (v277.voiceChatPromptInstance and not v38()) then
        if v277.promptSignal then
            v277.promptSignal:Destroy();
            v277.promptSignal = nil;
        end;
        v277.promptSignal = Instance.new("BindableEvent");
        local v280 = nil;
        if v20() then
            v280 = v277.errorText;
        end;
        local v281 = v64() and v279 == v76.VoiceChatSuspendedTemporaryB;
        local v282 = "";
        if v277.bannedUntil ~= nil then
            v282 = if not v281 then DateTime.fromUnixTimestamp(v277.bannedUntil.Seconds):FormatLocalTime("l LT", l_LocalizationService_0.RobloxLocaleId) else tostring((v277:calculateBanDuration(DateTime.now().UnixTimestamp, v277.bannedUntil.Seconds)));
        end;
        local v283 = v39();
        if v283 then
            v283 = true;
            if v279 ~= v76.VoiceToxicityModal then
                v283 = v279 == v76.VoiceToxicityToast;
            end;
        end;
        local v284 = v65();
        if v284 then
            v284 = true;
            if v279 ~= v76.VoiceConsentModalV1 then
                v284 = true;
                if v279 ~= v76.VoiceConsentModalV2 then
                    v284 = v279 == v76.VoiceConsentModalV3;
                end;
            end;
        end;
        v277.voiceChatPromptInstance = v4.mount(v4.createElement(v74, {
            Analytics = v82.new(), 
            promptSignal = v277.promptSignal.Event, 
            bannedUntil = v282, 
            policyMapper = v277.policyMapper, 
            errorText = v280, 
            onReadyForSignal = v278, 
            VoiceChatServiceManager = v277, 
            onContinueFunc = (not (v279 ~= v76.VoiceChatSuspendedTemporary) or v281) and function()
                local l_l_PostInformedOfBan_0_0 = l_PostInformedOfBan_0;
                local l_v277_0 = v277;
                local v287 = "PostRequest";
                l_l_PostInformedOfBan_0_0(function(...)
                    return l_v277_0[v287](l_v277_0, ...);
                end, true);
            end or (v283 and function()
                v277.Analytics:reportClosedNudge(v277:GetNudgeAnalyticsData());
            end or nil), 
            onPrimaryActivated = if not v283 then (v44() and v279 == v76.Permission) and function()
                local v288 = l_default_0:supportsSwitchToSettingsApp():await();
                v16:debug("Settings app available: {}", v288);
                if not v288 then
                    v16:debug("Current platform does not support switching to settings app");
                    return ;
                else
                    v16:debug("Switching to settings app");
                    l_default_0:switchToSettingsApp():andThen(function()
                        v16:debug("Successfully switched to settings app");
                    end):catch(function()
                        v16:error("Error switching to settings app");
                    end);
                    return ;
                end;
            end or (v281 and function()
                v277:reportBanMessage("Understood");
                v277.Analytics:reportBanMessageEvent("Understood");
            end or (v284 and function()
                v277:showPrompt(v76.VoiceConsentAcceptedToast);
            end or nil)) else function()
                v277.Analytics:reportAcknowledgedNudge(v277:GetNudgeAnalyticsData());
            end, 
            onSecondaryActivated = v279 == v76.VoiceToxicityModal and function()
                v277:ShowVoiceToxicityFeedbackToast();
                if v47 then
                    v277.Analytics:reportDeniedNudge(v277:GetNudgeAnalyticsData());
                end;
            end or (v283 and function()
                v277.Analytics:reportDeniedNudge(v277:GetNudgeAnalyticsData());
            end or (v281 and function()
                v277:ShowVoiceToxicityFeedbackToast();
                v277:reportBanMessage("Denied");
                v277.Analytics:reportBanMessageEvent("Denied");
            end or (v284 and function()
                v277:showPrompt(v76.VoiceConsentDeclinedToast);
            end or nil)))
        }), l_CoreGui_0, "RobloxVoiceChatPromptGui");
    end;
end;
v105.showPrompt = function(v289, v290, v291)
    if v20() then
        v289.errorText = v291 or nil;
    end;
    if v289.voiceChatPromptInstance and not v38() then
        v16:debug("Show Prompt: {}", v290);
        v289.promptSignal:fire(v290);
        return ;
    else
        v289:createPromptInstance(function()
            v16:debug("Show Prompt: {}", v290);
            v289.promptSignal:fire(v290);
        end, v290);
        return ;
    end;
end;
v105.CheckAndShowPermissionPrompt = function(v292)
    local function v295()
        local v293 = v19() and v292.userEligible;
        if not (not v292.voiceEnabled and not v293) then
            if not v44() then
                if not v34 then
                    return v292.PermissionsService:hasPermissions({
                        l_PermissionsProtocol_0.Permissions.MICROPHONE_ACCESS
                    }):andThen(function(v294)
                        if v294 and v294.status == l_PermissionsProtocol_0.Status.DENIED then
                            v292:showPrompt(v76.Permission);
                        end;
                    end);
                else
                    if v50 then
                        v292:_reportJoinFailed("missingPermissions");
                    end;
                    v292:showPrompt(v76.Permission);
                end;
            elseif v292.permissionState == l_PERMISSION_STATE_0.LISTEN_ONLY then
                v292:showPrompt(v76.Permission);
            end;
        end;
        return v3.resolve();
    end;
    if not v18() then
        return v292:asyncInit():andThen(function()
        end):catch(function()
            return v295();
        end);
    else
        return v295();
    end;
end;
v105.CheckAndShowNotAudiblePrompt = function(v296)
    if not game:GetEngineFeature("VoiceChatSupported") then
        return v3.resolve();
    else
        return v296:asyncInit():andThen(function()
            if UserSettings().GameSettings.MasterVolume == 0 then
                v296:showPrompt(v76.NotAudible);
            end;
        end):catch(function()
        end);
    end;
end;
v105.InitialJoinFailedPrompt = function(v297)
    v16:debug("JoinByGroupIdToken returns false");
    v297:showPrompt(v76.Retry);
end;
v105.ShowVoiceToxicityFeedbackToast = function(v298)
    v16:debug("Sending feedback toast");
    v298:showPrompt(v76.VoiceToxicityFeedbackToast);
end;
v105.GetNudgeAnalyticsData = function(v299)
    return l_Players_0.LocalPlayer.UserId, v299:GetSessionId();
end;
v105.reportBanMessage = function(v300, v301)
    v300.Analytics:reportBanMessageEventV2(v301, v300.banReason, l_Players_0.LocalPlayer.UserId, not v300.service and "" or v300.previousSessionId);
end;
v105.SetAndSyncActive = function(v302, v303, v304)
    if v302.coreVoiceManager then
        v302.coreVoiceManager:SetAndSyncActive(v303, v304);
    end;
    v303.Active = v304;
    local l_v302_SendMuteEvent_0 = v302:GetSendMuteEvent();
    if l_v302_SendMuteEvent_0 and v303.Player == l_Players_0.LocalPlayer then
        l_v302_SendMuteEvent_0:FireServer(v304);
    end;
end;
v105.CreateAudioDeviceData = function(v306, v307)
    if not v306.coreVoiceManager then
        local v308 = {};
        local v309 = v307.Player == l_Players_0.LocalPlayer;
        if v307.Active then
            if not (not v306.muteAll or v309) then
                v307.Active = false;
            end;
            if not (not v307.Player or not v306.mutedPlayers[v307.Player.UserId]) then
                v307.Active = false;
            end;
        end;
        if not ((not v57 or not v307.Active) or not v309) and v306.localMuted == nil then
            v306:SetAndSyncActive(v307, false);
        end;
        if not ((v309 and v306.localMuted ~= nil) and v306.localMuted ~= not v307.Active) or v306.isInCall then
            if not (not v306.isInCall or not v309) then
                local v310 = not v306.callMutedState;
                v16:debug("Overwriting Active State to match Iris call. .Active = {}", v310);
                v307.Active = v310;
                local l_v306_SendMuteEvent_0 = v306:GetSendMuteEvent();
                if l_v306_SendMuteEvent_0 then
                    l_v306_SendMuteEvent_0:FireServer(v310);
                end;
            end;
        else
            v16:debug("Mismatch between LocalMuted and device.Active");
            local v312 = not v306.localMuted;
            v307.Active = v312;
            local l_v306_SendMuteEvent_1 = v306:GetSendMuteEvent();
            if l_v306_SendMuteEvent_1 then
                l_v306_SendMuteEvent_1:FireServer(v312);
            end;
        end;
        v308.onPlayerChanged = v307:GetPropertyChangedSignal("Player"):Connect(function()
            if v56 then
                v309 = v307.Player == l_Players_0.LocalPlayer;
                if not v309 then
                    if not (not v306.muteAll and (not v307.Player or not v306.mutedPlayers[v307.Player.UserId])) then
                        v307.Active = false;
                    end;
                elseif not (not v57 or not v307.Active) and v306.localMuted == nil then
                    v306:SetAndSyncActive(v307, false);
                elseif v306.localMuted ~= nil and v306.localMuted ~= not v307.Active then
                    v16:debug("Mismatch between LocalMuted and device.Active");
                    v306:SetAndSyncActive(v307, not v306.localMuted);
                end;
            end;
            v306:UpdateAudioDeviceInputDebugger();
        end);
        v308.onMutedChanged = v307:GetPropertyChangedSignal("Muted"):Connect(function()
            v306:UpdateAudioDeviceInputDebugger();
        end);
        v308.onActiveChanged = v307:GetPropertyChangedSignal("Active"):Connect(function()
            v306:UpdateAudioDeviceInputDebugger();
            if not (not v306.muteAll or v309) then
                v307.Active = false;
            end;
            if not (not v307.Player or not v306.mutedPlayers[v307.Player.UserId]) then
                v307.Active = false;
            end;
        end);
        return v308;
    else
        return v306.coreVoiceManager:CreateAudioDeviceData(v307);
    end;
end;
local function v318(v314)
    v314.DescendantAdded:Connect(function(v315)
        if v315:HasTag("RbxDefaultVoiceEmitter") then
            v16:debug("Destroying RbxDefaultVoiceEmitter for local player");
            task.defer(function()
                v315:Destroy();
            end);
        end;
    end);
    for _, v317 in v314:GetDescendants() do
        if v317:HasTag("RbxDefaultVoiceEmitter") then
            v16:debug("Destroying RbxDefaultVoiceEmitter for local player");
            task.defer(function()
                v317:Destroy();
            end);
        end;
    end;
end;
local function v321(v319)
    local l_Character_0 = l_Players_0.LocalPlayer.Character;
    if l_Character_0 then
        if v319:IsDescendantOf(l_Character_0) then
            task.defer(function()
                v16:debug("Destroying RbxDefaultVoiceEmitter for local player");
                v319:Destroy();
            end);
        end;
        return ;
    else
        return ;
    end;
end;
v105.onInstanceAdded = function(v322, v323)
    if not v322.coreVoiceManager then
        if v323:IsA("AudioDeviceInput") then
            if v54 then
                v322.audioDeviceInputAdded:Fire(v323);
            end;
            v16:debug("Found new audio device instance for {}", v323.Player and v323.Player.Name);
            v322.audioDevices[v323] = v322:CreateAudioDeviceData(v323);
            v322:UpdateAudioDeviceInputDebugger();
        end;
        return ;
    else
        return v322.coreVoiceManager:onInstanceAdded(v323);
    end;
end;
v105.UpdateAudioDeviceInputDebugger = function(v324)
    if v49 then
        if v324.voiceDebuggerInstance then
            v4.update(v324.voiceDebuggerInstance, v4.createElement(v75, {
                instances = v324.audioDevices, 
                mutedPlayers = v324.mutedPlayers
            }));
        else
            v16:debug("Mounting AudioDeviceInput Debugger");
            v324.voiceDebuggerInstance = v4.mount(v4.createElement(v75, {
                instances = v324.audioDevices, 
                mutedPlayers = v324.mutedPlayers
            }), l_CoreGui_0, "RobloxVoiceChatPromptGui");
            return ;
        end;
    end;
end;
v105.onInstanceRemove = function(v325, v326)
    if not v325.coreVoiceManager then
        if v326:IsA("AudioDeviceInput") then
            v16:trace("Removing AudioDeviceInput {} {} {}", v326, "for user", v326.Player and v326.Player.UserId);
            local v327 = v325.audioDevices[v326];
            if v327 then
                v327.onActiveChanged:Disconnect();
                v327.onMutedChanged:Disconnect();
                v327.onPlayerChanged:Disconnect();
            end;
            v325.audioDevices[v326] = nil;
            v325:UpdateAudioDeviceInputDebugger();
        end;
        return ;
    else
        return v325.coreVoiceManager:onInstanceRemove(v326);
    end;
end;
v105.hookupAudioDeviceInputListener = function(v328)
    if not v328.coreVoiceManager then
        v16:debug("Hooking up audio device listeners");
        local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
        if not v59 then
            game.DescendantAdded:Connect(function(v330)
                v328:onInstanceAdded(v330);
            end);
        else
            l_SoundService_0.AudioInstanceAdded:Connect(function(v331)
                v328:onInstanceAdded(v331);
            end);
        end;
        local l_AudioDeviceInput_0 = l_LocalPlayer_0:FindFirstChildOfClass("AudioDeviceInput");
        v16:debug("Found local user audio device {}", l_AudioDeviceInput_0);
        if l_AudioDeviceInput_0 then
            v328:onInstanceAdded(l_AudioDeviceInput_0);
        end;
        if l_VoiceChatService_0.EnableDefaultVoice then
            v16:debug("Creating default voice listener");
            local l_AudioListener_0 = Instance.new("AudioListener");
            l_AudioListener_0.Parent = workspace.CurrentCamera;
            local l_Wire_0 = Instance.new("Wire");
            l_Wire_0.Parent = l_AudioListener_0;
            local l_AudioDeviceOutput_0 = Instance.new("AudioDeviceOutput");
            l_AudioDeviceOutput_0.Parent = l_Wire_0;
            l_Wire_0.SourceInstance = l_AudioListener_0;
            l_Wire_0.TargetInstance = l_AudioDeviceOutput_0;
            if v55 then
                for _, v337 in l_CollectionService_0:GetTagged("RbxDefaultVoiceEmitter") do
                    local l_Character_1 = l_Players_0.LocalPlayer.Character;
                    if not (not l_Character_1 or not v337:IsDescendantOf(l_Character_1)) then
                        task.defer(function()
                            v16:debug("Destroying RbxDefaultVoiceEmitter for local player");
                            v337:Destroy();
                        end);
                    end;
                end;
                l_CollectionService_0:GetInstanceAddedSignal("RbxDefaultVoiceEmitter"):Connect(v321);
            end;
            l_LocalPlayer_0.CharacterAdded:Connect(v318);
            if l_LocalPlayer_0.Character then
                v318(l_LocalPlayer_0.Character);
            end;
        end;
        game.DescendantRemoving:Connect(function(v339)
            v328:onInstanceRemove(v339);
        end);
        for _, v341 in game:GetDescendants() do
            v328:onInstanceAdded(v341);
        end;
        l_Players_0.PlayerRemoving:Connect(function(v342)
            for v343 in v328.audioDevices, nil, nil do
                if v343.Player and v343.Player == v342 then
                    v328:onInstanceRemove(v343);
                end;
            end;
        end);
        return ;
    else
        return v328.coreVoiceManager:hookupAudioDeviceInputListener();
    end;
end;
v105.ToggleMutePlayer = function(v344, v345, v346)
    v344:ensureInitialized("mute player " .. v345);
    v344._mutedAnyone = true;
    local v347 = if not not v40() and v53 then not v344.mutedPlayers[v345] else not v344.service:IsSubscribePaused(v345);
    v16:trace("Setting mute for {} to {}", "..." .. string.sub(tostring(v345), -4), v347);
    if not v40() then
        v344.service:SubscribePause(v345, v347);
    else
        v344.mutedPlayers[v345] = v347;
        for v348 in v344.audioDevices, nil, nil do
            if v348.Player and v348.Player.UserId == v345 then
                local v349 = v344.participants[tostring(v345)];
                v348.Active = not v347 and (v349 and not v349.isMuted);
            end;
        end;
        v344:UpdateAudioDeviceInputDebugger();
    end;
    for _, v351 in pairs(v344.participants) do
        if v351.userId == v345 then
            v351.isMutedLocally = v347;
            v344.participantsUpdate:Fire(v344.participants);
        end;
    end;
    if v346 then
        v344.Analytics:reportVoiceMuteIndividual((v344:JoinWithVoiceMuteData({
            targetUserId = tonumber(v345), 
            context = v346, 
            muted = v347
        })));
    end;
end;
v105.MuteAll = function(v352, v353, v354)
    v352:ensureInitialized("mute all");
    v352._mutedAnyone = true;
    if not v40() then
        v352.service:SubscribePauseAll(v353);
    else
        v352.muteAll = v353;
        v16:debug("Setting self mute all to {}", v353);
        for v355 in v352.audioDevices, nil, nil do
            if v355.Player and v355.Player ~= l_Players_0.LocalPlayer then
                v16:debug("Local muting {} to '{} = {}'", v355.Player.Name, v355.Active, v353);
                local l_UserId_0 = v355.Player.UserId;
                v352.mutedPlayers[l_UserId_0] = v353;
                local v357 = v352.participants[tostring(l_UserId_0)];
                v355.Active = not v353 and (v357 and not v357.isMuted);
            end;
        end;
    end;
    for _, v359 in pairs(v352.participants) do
        v359.isMutedLocally = v353;
        v352.participantsUpdate:Fire(v352.participants);
    end;
    v352.muteAllChanged:Fire(v353);
    if v354 then
        v352.Analytics:reportVoiceMuteGroup((v352:JoinWithVoiceMuteData({
            groupType = v73.VOICE_GROUP_TYPE.ALL, 
            context = v354, 
            muted = v353
        })));
    end;
end;
v105.ToggleMuteSome = function(v360, v361, v362, v363, v364)
    v360:ensureInitialized("mute some players");
    v360._mutedAnyone = true;
    local v365 = {};
    for _, v367 in v361, nil, nil do
        if not v40() then
            v360.service:SubscribePause(v367, v362);
        else
            v365[v367] = true;
            v360.mutedPlayers[v367] = v362;
        end;
        local v368 = v360.participants[tostring(v367)];
        if v368 then
            v368.isMutedLocally = v362;
            v360.participantsUpdate:Fire(v360.participants);
        end;
    end;
    if v40() then
        for v369 in v360.audioDevices, nil, nil do
            if not (not v369.Player or not v365[v369.Player.UserId]) then
                v369.Active = not v362;
            end;
        end;
    end;
    if not (not v363 or not v364) then
        v360.Analytics:reportVoiceMuteGroup((v360:JoinWithVoiceMuteData({
            groupType = v363, 
            context = v364, 
            muted = v362
        })));
    end;
end;
v105.FireMuteNonFriendsEvent = function(v370)
    if v42 then
        v370.mutedNonFriends:Fire();
    end;
end;
v105.EnsureCorrectMuteState = function(v371, v372, v373)
    local v374 = {};
    for _, v376 in v372, nil, nil do
        local v377 = v371.participants[tostring(v376)];
        if v377 and v377.isMutedLocally ~= v373 then
            if not v40() then
                v371.service:SubscribePause(v376, v373);
            else
                v374[v376] = true;
                v371.mutedPlayers[v376] = v373;
            end;
            v377.isMutedLocally = v373;
            v371.participantsUpdate:Fire(v371.participants);
        end;
    end;
    if v40() then
        for v378 in v371.audioDevices, nil, nil do
            if not (not v378.Player or not v374[v378.Player.UserId]) then
                v378.Active = not v373;
            end;
        end;
    end;
end;
v105.FireUserAgencySelectedEvent = function(v379, v380)
    if v43() then
        v379.userAgencySelected:Fire(v380);
    end;
end;
v105.ParticipantStateToIcon = function(_, v382, v383)
    local l_INACTIVE_0 = l_VOICE_STATE_0.INACTIVE;
    if v382.subscriptionCompleted then
        if not v382.isMutedLocally then
            if not v382.isMuted then
                if v382.isSignalActive then
                    l_INACTIVE_0 = l_VOICE_STATE_0.TALKING;
                end;
            else
                l_INACTIVE_0 = l_VOICE_STATE_0.MUTED;
            end;
        else
            l_INACTIVE_0 = l_VOICE_STATE_0.LOCAL_MUTED;
        end;
    else
        l_INACTIVE_0 = l_VOICE_STATE_0.CONNECTING;
    end;
    return getIcon(l_INACTIVE_0, v383);
end;
v105.VoiceStateToIcon = function(_, v386, v387, v388)
    return getIcon(v386, v387, v388);
end;
v105.GetIcon = function(_, v390, v391)
    return getIconSrc(v390, v391);
end;
v105.GetVoiceStateFromEnum = function(_, v393)
    if not v107[v393] then
        v107 = {
            [Enum.VoiceChatState.Idle] = l_VOICE_STATE_0.HIDDEN, 
            [Enum.VoiceChatState.Joining] = l_VOICE_STATE_0.CONNECTING, 
            [Enum.VoiceChatState.JoiningRetry] = l_VOICE_STATE_0.CONNECTING, 
            [Enum.VoiceChatState.Joined] = l_VOICE_STATE_0.MUTED, 
            [Enum.VoiceChatState.Leaving] = l_VOICE_STATE_0.MUTED, 
            [Enum.VoiceChatState.Ended] = l_VOICE_STATE_0.HIDDEN, 
            [Enum.VoiceChatState.Failed] = l_VOICE_STATE_0.ERROR
        };
    end;
    return v107[v393];
end;
v105.getRecentUsersInteractionData = function(v394)
    if not v394.coreVoiceManager then
        v394:_updateRecentUsersInteractionData();
        return v394.recentUsersInteractionData;
    else
        return v394.coreVoiceManager:getRecentUsersInteractionData();
    end;
end;
v105._setRecentUserState = function(v395, v396, v397)
    if not v395.coreVoiceManager then
        v395.recentUsersInteractionData = v5.Dictionary.join(v395.recentUsersInteractionData, {
            [tostring(v396)] = v5.Dictionary.join(v395.recentUsersInteractionData[tostring(v396)] or {}, v397)
        });
        return ;
    else
        return v395.coreVoiceManager:_setRecentUserState(v396, v397);
    end;
end;
v105._updateRecentUsersInteractionData = function(v398)
    if not v398.coreVoiceManager then
        local v399 = os.time();
        local v400 = {};
        if v398.recentUsersInteractionData then
            for v401, v402 in pairs(v398.recentUsersInteractionData) do
                local v403 = v398.participants[v401];
                local v404 = v27() and not l_Players_0:GetPlayerByUserId((tonumber(v401)));
                local v405 = v28() <= v399 - v402.lastHeardTime;
                local v406 = not v403 or v403.isMuted;
                if not (not (v405 and v406) and not v404) then
                    v400[v401] = v5.None;
                end;
            end;
            v398.recentUsersInteractionData = v5.Dictionary.join(v398.recentUsersInteractionData, v400);
        end;
        return ;
    else
        return v398.coreVoiceManager:_updateRecentUsersInteractionData();
    end;
end;
v105.SetupParticipantListeners = function(v407)
    if not v407.coreVoiceManager then
        v407:ensureInitialized("setup participant listeners");
        if not v407.participants then
            v407.participants = {};
            v407.recentUsersInteractionData = {};
            v407.participantConnection = v407.service.ParticipantsStateChanged:Connect(function(v408, v409, v410)
                v16:trace("Participants state changed");
                for _, v412 in ipairs(v408) do
                    if not (v27() or v407.participants[tostring(v412)].isMuted) then
                        v407:_setRecentUserState(v412, {
                            lastHeardTime = os.time()
                        });
                    end;
                    v407.participants[tostring(v412)] = nil;
                    v407.participantLeft:Fire(v407.participants, not not v23() and v412 or nil);
                    if not (not v88 or not v89.Events.VoiceParticipantRemoved) then
                        v89.Events.VoiceParticipantRemoved((tostring(v412)));
                    end;
                end;
                for _, v414 in ipairs(v409) do
                    v407.participantJoined:Fire(v407.participants, v414);
                    if not (not v88 or not v89.Events.VoiceParticipantAdded) then
                        v89.Events.VoiceParticipantAdded((tostring(v414)));
                    end;
                end;
                local v415 = {};
                for _, v417 in pairs(v410) do
                    local l_userId_0 = v417.userId;
                    local v419 = v407.participants[l_userId_0];
                    if not (v417.isMuted and (not v419 or v419.isMuted)) then
                        v407:_setRecentUserState(l_userId_0, {
                            lastHeardTime = os.time(), 
                            player = l_Players_0:GetPlayerByUserId(l_userId_0)
                        });
                    end;
                    if not (not v88 or not v89.Events.VoiceParticipantToggleMuted) and (not v419 or v419.isMuted ~= v417.isMuted) then
                        v89.Events.VoiceParticipantToggleMuted(tostring(l_userId_0), v417.isMuted);
                    end;
                    if not (not v40() or not v53) then
                        v417.isMutedLocally = not not v407.mutedPlayers[l_userId_0];
                    end;
                    v407.participants[tostring(l_userId_0)] = v417;
                    if v66() then
                        v415[tostring(l_userId_0)] = v417;
                    end;
                end;
                v407:_updateRecentUsersInteractionData();
                if not v407.shouldThrottleParticipantUpdate then
                    if #v410 > 0 then
                        v407.participantsUpdate:Fire(if not v66() then v407.participants else v415);
                    end;
                else
                    local v420 = tick();
                    if v407.participantsStateThrottleTime <= v420 - v407.lastParticipantsStateUpdate and #v410 > 0 then
                        v407.lastParticipantsStateUpdate = v420;
                        v407.participantsUpdate:Fire(if not v66() then v407.participants else v415);
                        return ;
                    elseif #v410 > 0 then
                        local v421 = v407.participantsStateThrottleTime - (v420 - v407.lastParticipantsStateUpdate);
                        v407.lastStateUpdateCounter = (v407.lastStateUpdateCounter + 1) % 100;
                        local l_lastStateUpdateCounter_0 = v407.lastStateUpdateCounter;
                        task.wait(v421);
                        if l_lastStateUpdateCounter_0 == v407.lastStateUpdateCounter then
                            v407.participantsUpdate:Fire(if not v66() then v407.participants else v415);
                            return ;
                        end;
                    end;
                end;
            end);
            v407.stateConnection = v407.service.StateChanged:Connect(function(v423, v424)
                if v62() then
                    v86:setClientSessionId(v407:GetSessionId());
                end;
                local v425 = v424 == Enum.VoiceChatState.Failed;
                local v426 = v424 == Enum.VoiceChatState.Joining;
                local v427 = v424 == Enum.VoiceChatState.Leaving;
                local v428 = v424 == Enum.VoiceChatState.Ended;
                local v429 = v407.service:IsPublishPaused();
                if not v21() then
                    if v429 ~= v407.localMuted then
                        v407.localMuted = v429;
                        v407.muteChanged:Fire(v429);
                    end;
                elseif (((not (v429 ~= v407.localMuted) or v425) or v426) or v427) or v428 then
                    if not (not (v426 or v427) and not v428) then
                        v407.localMuted = nil;
                    end;
                else
                    v407.localMuted = v429;
                    v407.muteChanged:Fire(v429);
                end;
                if v424 == Enum.VoiceChatState.Leaving then
                    v407.previousGroupId = v407.service:GetGroupId();
                    v407.previousMutedState = v407.service:IsPublishPaused();
                end;
                if not (v424 ~= Enum.VoiceChatState.Ended and not v425) then
                    v407.participants = {};
                    v407.localMuted = nil;
                    v407.participantsUpdate:Fire(v407.participants);
                    if v425 then
                        v16:debug("State Changed to Failed. Reason: {}", v407.service:GetAndClearCallFailureMessage());
                    end;
                    if not (v423 ~= Enum.VoiceChatState.Joining and v423 ~= Enum.VoiceChatState.JoiningRetry) or v423 == Enum.VoiceChatState.Joined then
                        if v424 == Enum.VoiceChatState.Ended then
                            v16:debug("State Changed to Ended from {}", v423);
                        end;
                        v407:showPrompt(v76.Retry);
                    end;
                end;
            end);
            if l_MIN_VOICE_CHAT_API_VERSION_LOCAL_MIC_ACTIVITY_0 <= v407.service:GetVoiceChatApiVersion() then
                v407.micConnection = v407.service.PlayerMicActivitySignalChange:Connect(function(v430)
                    v407.isTalking = v430.isActive;
                    if not v41 then
                        if not v407.localMuted then
                            v407.talkingChanged:Fire(v407.isTalking);
                        end;
                    elseif v407.localMuted == false then
                        v407.talkingChanged:Fire(v407.isTalking);
                        return ;
                    end;
                end);
            end;
            if not v35() then
                if game:GetEngineFeature("VoiceChatServicePlayerModeratedEvent") then
                    v407.playerModeratedConnection = v407.service.LocalPlayerModerated:connect(function()
                        v16:debug("User Moderated old");
                        v407.previousSessionId = v407.service:GetSessionId();
                        v407:ShowPlayerModeratedMessage();
                        v407.service:Leave();
                    end);
                end;
            else
                v407.playerModeratedConnection = v407:GetSignalREvent("ParticipantModeratedFromVoice"):Connect(function()
                    v16:debug("User Moderated");
                    v407.previousSessionId = v407.service:GetSessionId();
                    v407:ShowPlayerModeratedMessage();
                    v407.service:Leave();
                end);
            end;
            if v37() then
                v16:trace("Setting up voice nudge handlers");
                v407.voiceToxicityModalConnection = v407:GetSignalREvent("VoiceToxicityModal"):Connect(function(v431)
                    if v39() then
                        v407.Analytics:reportReceivedNudge(v431, v407:GetNudgeAnalyticsData());
                    end;
                    v16:debug("Showing Voice Toxicity Modal");
                    v407:showPrompt(v76.VoiceToxicityModal);
                end);
                v407.VoiceToxicityToastConnection = v407:GetSignalREvent("VoiceToxicityToast"):Connect(function(v432)
                    if v39() then
                        v407.Analytics:reportReceivedNudge(v432, v407:GetNudgeAnalyticsData());
                    end;
                    v16:debug("Showing Voice Toxicity Toast");
                    v407:showPrompt(v76.VoiceToxicityToast);
                end);
            end;
            v407.blockConnection = v407.BlockStatusChanged:Connect(function(v433, v434)
                if not v434 then
                    v16:debug("UnBlocking {}", "..." .. string.sub(tostring(v433), -4));
                    v407.service:SubscribeUnblock(v433);
                elseif v407.participants[tostring(v433)] then
                    v16:debug("Blocking {}", "..." .. string.sub(tostring(v433), -4));
                    v407.service:SubscribeBlock(v433);
                    return ;
                end;
            end);
            if v40() then
                v407:hookupAudioDeviceInputListener();
            end;
        end;
        return ;
    else
        return v407.coreVoiceManager:SetupParticipantListeners();
    end;
end;
v105.Disconnect = function(v435)
    if not v435.coreVoiceManager then
        if v435.participantConnection then
            v435.participantConnection:Disconnect();
            v435.participantConnection = nil;
        end;
        if v435.stateConnection then
            v435.stateConnection:Disconnect();
            v435.stateConnection = nil;
        end;
        if v435.micConnection then
            v435.micConnection:Disconnect();
            v435.micConnection = nil;
        end;
        if v435.blockConnection then
            v435.blockConnection:Disconnect();
            v435.blockConnection = nil;
        end;
        if v435.playerModeratedConnection then
            v435.playerModeratedConnection:Disconnect();
            v435.playerModeratedConnection = nil;
        end;
        if v435.voiceToxicityModalConnection then
            v435.voiceToxicityModalConnection:Disconnect();
            v435.voiceToxicityModalConnection = nil;
        end;
        if v435.VoiceToxicityToastConnection then
            v435.VoiceToxicityToastConnection:Disconnect();
            v435.VoiceToxicityToastConnection = nil;
        end;
        return ;
    else
        v435.coreVoiceManager:Disconnect();
        v435.coreVoiceManager:unsubscribeAll();
        return ;
    end;
end;
v105.GetSendMuteEvent = function(v436)
    if not v436.coreVoiceManager then
        if not v436.SendMuteEvent then
            v436.SendMuteEvent = l_RobloxReplicatedStorage_0:WaitForChild("SetUserActive", 10);
        end;
        return v436.SendMuteEvent;
    else
        return v436.coreVoiceManager:GetSendMuteEvent();
    end;
end;
v105.GetLikelySpeakingUsersEvent = function(v437)
    if not v437.coreVoiceManager then
        if not v437.LikelySpeakingUsersEvent then
            v437.LikelySpeakingUsersEvent = l_RobloxReplicatedStorage_0:WaitForChild("SendLikelySpeakingUsers", 3);
        end;
        return v437.LikelySpeakingUsersEvent;
    else
        return v437.coreVoiceManager:GetLikelySpeakingUsersEvent();
    end;
end;
v105.ToggleMic = function(v438, v439)
    if not v438.coreVoiceManager then
        v438:ensureInitialized("toggle mic");
        if v438.localMuted == nil then
            return ;
        else
            if v44() then
                if v438.permissionState == l_PERMISSION_STATE_0.PENDING_MIC then
                    v16:debug("In pending mic mode, requesting permission");
                    v438.getPermissionsFunction(function(v440)
                        v438.permissionState = if not v440.hasMicPermissions then l_PERMISSION_STATE_0.LISTEN_ONLY else l_PERMISSION_STATE_0.LISTEN_AND_TALK;
                        v16:debug("Got permissions, setting state to {}", v438.permissionState);
                        v438:ToggleMic(v439);
                    end, {
                        l_PermissionsProtocol_0.Permissions.MICROPHONE_ACCESS
                    }, false);
                    return ;
                elseif v438.permissionState == l_PERMISSION_STATE_0.LISTEN_ONLY then
                    v16:debug("User tried to unmute despite being in listen only mode");
                    v438:showPrompt(v76.Permission);
                    return ;
                end;
            end;
            if not v40() then
                local v441 = not v438.service:IsPublishPaused();
                v16:trace("Setting self mute to {}", v441);
                v438.service:PublishPause(v441);
                v438.localMuted = v441;
                v438.muteChanged:Fire(v441);
            else
                v438.localMuted = not v438.localMuted;
                local v442 = not v438.localMuted;
                v16:trace("Setting self mute to {}", v442);
                local l_v438_SendMuteEvent_0 = v438:GetSendMuteEvent();
                if not l_v438_SendMuteEvent_0 then
                    v16:error("Could not find SendMuteEvent");
                else
                    l_v438_SendMuteEvent_0:FireServer(v442);
                    for v444 in v438.audioDevices, nil, nil do
                        if v444.Player and v444.Player == l_Players_0.LocalPlayer then
                            v444.Active = v442;
                        end;
                    end;
                    v438.muteChanged:Fire(v438.localMuted);
                end;
            end;
            if not v438.localMuted then
                v438.talkingChanged:Fire(v438.isTalking);
            end;
            if v439 then
                v438.Analytics:reportVoiceMuteSelf((v438:JoinWithVoiceMuteData({
                    context = v439, 
                    muted = v438.localMuted
                })));
            end;
            return ;
        end;
    else
        return v438.coreVoiceManager:ToggleMic(v439);
    end;
end;
v105.SubscribeRetry = function(v445, v446)
    v445:ensureInitialized("subscribe retry");
    v16:debug("Attempting to retry connection to user: {}", "..." .. string.sub(tostring(v446), -4));
    v445.service:SubscribeRetry(v446);
end;
v105.JoinByGroupIdToken = function(v447, v448, v449)
    if not v447.coreVoiceManager then
        v447.previousGroupId = v448;
        v447.previousMutedState = v449;
        return v447.service:JoinByGroupIdToken(v448, v449);
    else
        return v447.coreVoiceManager:JoinByGroupIdToken(v448, v449);
    end;
end;
v105.RejoinCurrentChannel = function(v450)
    if not v450.coreVoiceManager then
        pcall(function()
            local l_GroupId_0 = v450.service:GetGroupId();
            if l_GroupId_0 and l_GroupId_0 ~= "" then
                local v452 = v450.service:IsPublishPaused();
                v450.service:Leave();
                if v25() then
                    v16:debug("Rejoining current channel {}", l_GroupId_0);
                    v450.participants = {};
                    v450.participantsUpdate:Fire(v450.participants);
                end;
                if not v450.service:JoinByGroupIdToken(l_GroupId_0, v452, true) then
                    (if not v48 then v105 else v450):InitialJoinFailedPrompt();
                end;
            end;
        end);
        return ;
    else
        return v450.coreVoiceManager:RejoinCurrentChannel();
    end;
end;
v105.RejoinPreviousChannel = function(v453)
    local l_previousGroupId_0 = v453.previousGroupId;
    local l_previousMutedState_0 = v453.previousMutedState;
    v16:debug("Rejoining previous channel {} with mute status {}", l_previousGroupId_0, l_previousMutedState_0);
    pcall(function()
        if l_previousGroupId_0 and l_previousGroupId_0 ~= "" then
            v453.service:Leave();
            if not v453.service:JoinByGroupIdToken(l_previousGroupId_0, l_previousMutedState_0, true) then
                (if not v48 then v105 else v453):InitialJoinFailedPrompt();
            end;
        end;
    end);
end;
local function _(v456, v457, v458)
    local l_v456_0 = v456;
    if l_v456_0 then
        l_v456_0 = v457;
        if l_v456_0 then
            l_v456_0 = v458;
            if l_v456_0 then
                l_v456_0 = false;
                if #v456 > 0 then
                    l_v456_0 = false;
                    if v458 > 0 then
                        l_v456_0 = false;
                        if v458 <= #v456 then
                            l_v456_0 = #v456 == #v457;
                        end;
                    end;
                end;
            end;
        end;
    end;
    return l_v456_0;
end;
local function v470(v461, v462)
    local v463, v464, v465, v466 = pcall(function()
        return v462:GetSpeakerDevices();
    end);
    if v463 then
        local l_v464_0 = v464;
        if l_v464_0 then
            l_v464_0 = v465;
            if l_v464_0 then
                l_v464_0 = v466;
                if l_v464_0 then
                    l_v464_0 = false;
                    if #v464 > 0 then
                        l_v464_0 = false;
                        if v466 > 0 then
                            l_v464_0 = false;
                            if v466 <= #v464 then
                                l_v464_0 = #v464 == #v465;
                            end;
                        end;
                    end;
                end;
            end;
        end;
        if l_v464_0 then
            l_v464_0 = 0;
            for v468, v469 in ipairs(v464) do
                if v469 == v461 then
                    l_v464_0 = v468;
                end;
            end;
            if l_v464_0 > 0 then
                v16:info("[OutputDeviceSelection] Setting VCS Speaker Device To {} {}", v464[l_v464_0], v465[l_v464_0]);
                v462:SetSpeakerDevice(v464[l_v464_0], v465[l_v464_0]);
                return ;
            else
                v16:warning("Could not find equivalent VoiceChatService Device");
                return ;
            end;
        end;
    end;
    v16:warning("Could not connect to Voice Chat Service to change Output Device");
end;
v105.SwitchDevice = function(v471, v472, v473, v474)
    if v472 == l_VOICE_CHAT_DEVICE_TYPE_0.Input then
        if not game:GetEngineFeature("UseFmodForInputDevices") or not v30() then
            v471.service:SetMicDevice(v473, v474);
            v16:info("[OutputDeviceSelection] Setting VCS Mic Device To {} {}", v473, v474);
            v16:info("[OutputDeviceSelection] Rejoining Voice Chat");
            v471:RejoinCurrentChannel();
            return ;
        else
            l_SoundService_0:SetInputDevice(v473, v474);
            v16:info("[InputDeviceSelection] Setting SS Mic Device To {} {}", v473, v474);
            return ;
        end;
    else
        l_SoundService_0:SetOutputDevice(v473, v474);
        v16:info("[OutputDeviceSelection] Setting SS Speaker Device To {} {}", v473, v474);
        v470(v473);
        return ;
    end;
end;
v105.GetDevices = function(v475, v476)
    local v477, v478, v479, v480 = pcall(function()
        if v476 == l_VOICE_CHAT_DEVICE_TYPE_0.Input then
            if not game:GetEngineFeature("UseFmodForInputDevices") or not v30() then
                return v475.service:GetMicDevices();
            else
                return l_SoundService_0:GetInputDevices();
            end;
        else
            return l_SoundService_0:GetOutputDevices();
        end;
    end);
    if not game:GetEngineFeature("UseFmodForInputDevices") or not v30() then
        local v481, v482, v483, v484 = pcall(function()
            return v475.service:GetSpeakerDevices();
        end);
        local l_v477_0 = v477;
        if l_v477_0 then
            l_v477_0 = v481;
            if l_v477_0 then
                l_v477_0 = v478;
                if l_v477_0 then
                    l_v477_0 = v479;
                    if l_v477_0 then
                        l_v477_0 = v480;
                        if l_v477_0 then
                            l_v477_0 = false;
                            if #v478 > 0 then
                                l_v477_0 = false;
                                if v480 > 0 then
                                    l_v477_0 = false;
                                    if v480 <= #v478 then
                                        l_v477_0 = #v478 == #v479;
                                    end;
                                end;
                            end;
                        end;
                    end;
                end;
                if l_v477_0 then
                    l_v477_0 = v482;
                    if l_v477_0 then
                        l_v477_0 = v483;
                        if l_v477_0 then
                            l_v477_0 = v484;
                            if l_v477_0 then
                                l_v477_0 = false;
                                if #v482 > 0 then
                                    l_v477_0 = false;
                                    if v484 > 0 then
                                        l_v477_0 = false;
                                        if v484 <= #v482 then
                                            l_v477_0 = #v482 == #v483;
                                        end;
                                    end;
                                end;
                            end;
                        end;
                    end;
                end;
            end;
        end;
        v16:debug("Device names found: {}", table.concat(v478 or {}, ", "));
        return l_v477_0, v478, v479, v480;
    else
        return v477, v478, v479, v480;
    end;
end;
v105.VoiceChatAvailable = function(v486)
    local l_service_0 = v486.service;
    if not (not (v486.available == nil) or not l_service_0) then
        v486.version = l_service_0:GetVoiceChatApiVersion();
        if l_MIN_VOICE_CHAT_API_VERSION_0 <= v486.version then
            v486.available = l_service_0:GetVoiceChatAvailable();
            while v486.available == l_VOICE_CHAT_AVAILABILITY_0.Checking do
                wait(1);
                v486.available = l_service_0:GetVoiceChatAvailable();
            end;
        end;
    end;
    if not l_service_0 then
        return false;
    else
        local v488 = false;
        if l_MIN_VOICE_CHAT_API_VERSION_0 <= v486.version then
            v488 = v486.available == l_VOICE_CHAT_AVAILABILITY_0.Available;
        end;
        return v488;
    end;
end;
v105.VoiceChatEnded = function(v489)
    if not v489.service then
        return true;
    else
        local l_VoiceChatState_0 = v489.service.VoiceChatState;
        local v491 = true;
        if l_VoiceChatState_0 ~= Enum.VoiceChatState.Ended then
            v491 = l_VoiceChatState_0 == Enum.VoiceChatState.Idle;
        end;
        return v491;
    end;
end;
v105.UnmountPrompt = function(v492)
    if v492.voiceChatPromptInstance ~= nil then
        v4.unmount(v492.voiceChatPromptInstance);
    end;
end;
v105.default = v105.new(if not v93 then nil else v93.default, nil, l_HttpRbxApiService_0, l_PermissionsProtocol_0.default, not not v22() and v85:GetAfterBlockedStatusChangedEvent() or v85:GetBlockedStatusChangedEvent());
return v105;
