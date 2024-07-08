local l_Chat_0 = game:GetService("Chat");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Players_0 = game:GetService("Players");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("StarterGui");
local l_TextChatService_0 = game:GetService("TextChatService");
local v7 = l_CoreGui_0:WaitForChild("RobloxGui", math.huge);
local v8 = require(l_CorePackages_0.Packages.Roact);
local v9 = require(l_CorePackages_0.Packages.Rodux);
local v10 = require(v7.Modules.InGameChat.BubbleChat.Components.App);
local v11 = require(v7.Modules.InGameChat.BubbleChat.Reducers.chatReducer);
local v12 = require(v7.Modules.InGameChat.BubbleChat.Actions.SetMessageText);
local v13 = require(v7.Modules.InGameChat.BubbleChat.Actions.AddMessageFromEvent);
local v14 = require(v7.Modules.InGameChat.BubbleChat.Actions.AddMessageWithTimeout);
local v15 = require(v7.Modules.InGameChat.BubbleChat.Actions.UpdateChatSettings);
local v16 = require(v7.Modules.InGameChat.BubbleChat.Actions.BubbleChatEnabledChanged);
local v17 = require(v7.Modules.VoiceChat.Actions.VoiceEnabledChanged);
local v18 = require(v7.Modules.VoiceChat.Actions.ParticipantsChanged);
local v19 = require(v7.Modules.VoiceChat.Actions.VoiceStateChanged);
local v20 = require(v7.Modules.VoiceChat.Actions.ParticipantAdded);
local v21 = require(v7.Modules.VoiceChat.Actions.ParticipantRemoved);
local v22 = require(v7.Modules.VoiceChat.Actions.PlayerRemoved);
local v23 = require(v7.Modules.InGameChat.BubbleChat.Helpers.getPlayerFromPart);
local v24 = require(v7.Modules.InGameChat.BubbleChat.Helpers.validateMessage);
local v25 = require(v7.Modules.InGameChat.BubbleChat.Constants);
local v26 = require(v7.Modules.InGameChat.BubbleChat.Types);
local v27 = require(v7.Modules.BlockingUtility);
local v28 = require(v7.Modules.GameTranslator);
local l_default_0 = require(v7.Modules.VoiceChat.VoiceChatServiceManager).default;
local v30 = require(v7.Modules.VoiceChat.initVoiceChatStore);
local v31 = require(v7.Modules.Flags.GetFFlagEnableVoiceChatVoiceUISync);
local v32 = require(v7.Modules.Flags.GetFFlagLocalMutedNilFix);
local v33 = require(v7.Modules.Flags.GetFFlagConsolidateBubbleChat);
local v34 = require(v7.Modules.Flags.GetFFlagBatchVoiceParticipantsUpdates);
local v35 = game:DefineFastFlag("FixMessageReceivedEventLeak", false);
local v36 = require(l_CorePackages_0.ExperienceChat);
local v37 = require(v7.Modules.InGameChat.BubbleChat.Logger)(script.Name);
local v38 = "Malformed message data sent to chat event %q. If you have modified the chat system, " .. "check what you are firing to this event";
local v39 = nil;
local v45 = {
    [v17.name] = function(v40)
        v36.Events.VoiceEnabledChanged(v40.enabled);
    end, 
    [v19.name] = function(v41)
        v36.Events.VoiceStateChanged(v41.userId, v41.newState);
    end, 
    [v18.name] = function(v42)
        v36.Events.VoiceParticipantsChanged(v42.newParticipants);
    end, 
    [v20.name] = function(v43)
        v36.Events.VoiceParticipantAdded(v43.userId);
    end, 
    [v21.name] = function(v44)
        v36.Events.VoiceParticipantRemoved(v44.userId);
    end
};
v39 = v9.Store.new(v11, nil, {
    v9.thunkMiddleware, 
    function(v46)
        return function(v47)
            local v48 = v45[v47.type];
            if v48 then
                v48(v47);
            end;
            v46(v47);
        end;
    end
});
local v49 = nil;
local function _()
    return l_TextChatService_0.ChatVersion == Enum.ChatVersion.TextChatService;
end;
if not game:IsLoaded() or not (l_TextChatService_0.ChatVersion == Enum.ChatVersion.TextChatService) then
    v49 = game.Loaded:Connect(function()
        if game:IsLoaded() then
            v49:Disconnect();
            if not v33() then
                if not (l_TextChatService_0.ChatVersion == Enum.ChatVersion.TextChatService) then
                    v8.mount(v8.createElement(v10, {
                        store = v39
                    }), l_CoreGui_0, "BubbleChat");
                else
                    return ;
                end;
            end;
        end;
    end);
    local function v55(v51, v52)
        local v53, v54 = v24(v52);
        if not v53 then
            if not v54 then
                warn(("Message text %q sent to chat event %q is not a valid UTF-8 characters sequence"):format(v52, v51));
            else
                warn(("Message text %q is too long for chat event %q (expected a message of length %i, got %i)"):format(v52, v51, v25.MAX_MESSAGE_LENGTH, v54));
                return v53;
            end;
        end;
        return v53;
    end;
    local function _(v56, v57)
        local v58, v59 = v26.IMessageData(v57);
        if not v58 then
            warn(v38:format(v56));
            warn(v59);
        end;
        return v58;
    end;
    local _ = nil;
    local v62 = nil;
    local v63 = nil;
    local v64 = nil;
    local v65 = nil;
    local v66 = nil;
    local v67 = 0;
    local v68 = 0;
    local v69 = {};
    local function v89()
        coroutine.resume(coroutine.create(function()
            local v70 = l_ReplicatedStorage_0:WaitForChild("DefaultChatSystemChatEvents", math.huge);
            v62 = v70:WaitForChild("OnNewMessage", math.huge).OnClientEvent:Connect(function(v71)
                local v72, v73 = v26.IMessageData(v71);
                if not v72 then
                    warn(v38:format("OnNewMessage"));
                    warn(v73);
                end;
                if v72 then
                    if v71.FromSpeaker == l_Players_0.LocalPlayer.Name then
                        if v55("OnNewMessage", v71.Message) then
                            if not v33() then
                                v39:dispatch(v13(v71));
                            else
                                local v74 = table.clone(v71);
                                v74.Time = workspace:GetServerTimeNow() * 1000;
                                v39:dispatch(v13(v74));
                                return ;
                            end;
                        else
                            return ;
                        end;
                    end;
                    return ;
                else
                    return ;
                end;
            end);
            v63 = v70:WaitForChild("OnMessageDoneFiltering", math.huge).OnClientEvent:Connect(function(v75)
                local v76, v77 = v26.IMessageData(v75);
                if not v76 then
                    warn(v38:format("OnMessageDoneFiltering"));
                    warn(v77);
                end;
                if v76 and v55("OnMessageDoneFiltering", v75.Message) then
                    local v78 = tostring(v75.ID);
                    if not v39:getState().messages[v78] then
                        if not v33() then
                            v39:dispatch(v13(v75));
                            return ;
                        else
                            v76 = table.clone(v75);
                            v76.Time = workspace:GetServerTimeNow() * 1000;
                            v39:dispatch(v13(v76));
                            return ;
                        end;
                    else
                        v39:dispatch(v12(v78, v75.Message));
                        return ;
                    end;
                else
                    return ;
                end;
            end);
        end));
        local function v86(v79, v80, v81)
            local v82 = nil;
            v82 = if not v79:IsA("Model") then v79 else if v79.PrimaryPart then v79.PrimaryPart else v79:FindFirstChildWhichIsA("BasePart", true);
            local v83 = nil;
            if v82 then
                v83 = v23(v82);
            end;
            local v84 = nil;
            if not v83 then
                local v85 = v69[v79];
                if not v85 then
                    v67 = v67 + 1;
                    v84 = "adornee_" .. v67;
                    v69[v79] = v84;
                else
                    v84 = v85;
                end;
            else
                v84 = tostring(v83.UserId);
            end;
            v39:dispatch(v14({
                id = "chatted_" .. v81, 
                userId = v84, 
                name = v79.Name, 
                text = v28:TranslateGameText(l_CoreGui_0, v80), 
                timestamp = os.time(), 
                adornee = v79
            }));
        end;
        v64 = l_Chat_0.Chatted:Connect(function(v87, v88)
            v68 = v68 + 1;
            v86(v87, v88, v68);
        end);
    end;
    local function v90()
        if v62 then
            v62:Disconnect();
            v62 = nil;
        end;
        if v63 then
            v63:Disconnect();
            v63 = nil;
        end;
        if v64 then
            v64:Disconnect();
            v64 = nil;
        end;
        if v35 then
            if v66 then
                v66:Disconnect();
                v66 = nil;
            end;
            if v65 then
                v65:Disconnect();
                v65 = nil;
            end;
        end;
    end;
    local function v92()
        v90();
        local v91 = not game:GetEngineFeature("EnableBubbleChatFromChatService") or l_Chat_0.BubbleChatEnabled;
        if v91 then
            v89();
        end;
        v39:dispatch(v16(v91));
    end;
    local v93 = {};
    local function v99(v94)
        local v95 = tostring(l_Players_0.LocalPlayer.UserId);
        v39:dispatch(v17(v94 ~= Enum.VoiceChatState.Ended));
        if v93[v94] then
            v39:dispatch(v19(v95, v93[v94]));
        else
            v37:warning("LOCAL_STATE_MAP does not exist for {} state", v94);
            v39:dispatch(v19(v95, v25.VOICE_STATE.MUTED));
        end;
        if v94 == Enum.VoiceChatState.Failed then
            for _, v97 in pairs(l_Players_0:GetPlayers()) do
                local v98 = tostring(v97.UserId);
                if v97 ~= l_Players_0.LocalPlayer then
                    v39:dispatch(v19(v98, v25.VOICE_STATE.HIDDEN));
                end;
            end;
            return ;
        else
            if not (not (v94 == Enum.VoiceChatState.Joined) or not if not v32 then not l_default_0.localMuted else l_default_0.localMuted == false) then
                v39:dispatch(v19(v95, v25.VOICE_STATE.INACTIVE));
            end;
            return ;
        end;
    end;
    local function _(v100)
        return "..." .. string.sub(tostring(v100), -4);
    end;
    local function v118()
        if not v31() then
            v37:debug("Initializing VoiceChatService connections");
            local v102 = l_default_0:getService();
            if v102 then
                if Enum.VoiceChatState then
                    v93 = {
                        [Enum.VoiceChatState.Idle] = v25.VOICE_STATE.HIDDEN, 
                        [Enum.VoiceChatState.Joining] = v25.VOICE_STATE.CONNECTING, 
                        [Enum.VoiceChatState.JoiningRetry] = v25.VOICE_STATE.CONNECTING, 
                        [Enum.VoiceChatState.Joined] = v25.VOICE_STATE.MUTED, 
                        [Enum.VoiceChatState.Leaving] = v25.VOICE_STATE.MUTED, 
                        [Enum.VoiceChatState.Ended] = v25.VOICE_STATE.HIDDEN, 
                        [Enum.VoiceChatState.Failed] = v25.VOICE_STATE.ERROR
                    };
                    local l_UserId_0 = l_Players_0.LocalPlayer.UserId;
                    for _, v105 in pairs(l_Players_0:GetPlayers()) do
                        v37:trace("Adding existing player {}", "..." .. string.sub(tostring(v105.UserId), -4));
                        v39:dispatch(v20((tostring(v105.UserId))));
                    end;
                    l_Players_0.PlayerAdded:Connect(function(v106)
                        v37:trace("Adding joining player {}", "..." .. string.sub(tostring(v106.UserId), -4));
                        v39:dispatch(v20((tostring(v106.userId))));
                    end);
                    l_Players_0.PlayerRemoving:Connect(function(v107)
                        v37:trace("Removing player {}", "..." .. string.sub(tostring(v107.UserId), -4));
                        v39:dispatch(v22((tostring(v107.userId))));
                        v39:dispatch(v21((tostring(v107.userId))));
                    end);
                    v39:dispatch(v19(l_UserId_0, v25.VOICE_STATE.HIDDEN));
                    l_default_0.muteChanged.Event:connect(function(v108)
                        v37:debug("Mute changed to {}", v108);
                        v39:dispatch(v19(l_UserId_0, not not v108 and v25.VOICE_STATE.MUTED or v25.VOICE_STATE.INACTIVE));
                    end);
                    l_default_0.participantsUpdate.Event:Connect(function(v109)
                        if not v34() then
                            for v110, v111 in pairs(v109) do
                                local l_INACTIVE_0 = v25.VOICE_STATE.INACTIVE;
                                if v111.subscriptionCompleted then
                                    if not v111.isMutedLocally then
                                        if not v111.isMuted then
                                            if v111.isSignalActive then
                                                l_INACTIVE_0 = v25.VOICE_STATE.TALKING;
                                            end;
                                        else
                                            l_INACTIVE_0 = v25.VOICE_STATE.MUTED;
                                        end;
                                    else
                                        l_INACTIVE_0 = v25.VOICE_STATE.LOCAL_MUTED;
                                    end;
                                else
                                    l_INACTIVE_0 = v25.VOICE_STATE.CONNECTING;
                                end;
                                v37:trace("Participant update for {}, voice state {}", "..." .. string.sub(tostring(v110), -4), l_INACTIVE_0);
                                v39:dispatch(v19(v110, l_INACTIVE_0));
                            end;
                            return ;
                        else
                            v39:dispatch(v18(v109));
                            return ;
                        end;
                    end);
                    l_default_0.talkingChanged.Event:Connect(function(v113)
                        if not v113 then
                            v39:dispatch(v19(l_UserId_0, v25.VOICE_STATE.INACTIVE));
                            return ;
                        else
                            v39:dispatch(v19(l_UserId_0, v25.VOICE_STATE.TALKING));
                            return ;
                        end;
                    end);
                    v27:GetBlockedStatusChangedEvent():Connect(function(v114, v115)
                        if not v115 then
                            v39:dispatch(v20((tostring(v114))));
                            return ;
                        else
                            v39:dispatch(v21((tostring(v114))));
                            return ;
                        end;
                    end);
                    v37:debug("Initial voice state is {}", v102.VoiceChatState);
                    v99(v102.VoiceChatState);
                    v102.StateChanged:Connect(function(_, v117)
                        v37:debug("Voice state changed to {}", v117);
                        v99(v117);
                    end);
                    return ;
                else
                    v37:error("Enum.VoiceChatState does not exist but voice is enabled");
                    return ;
                end;
            else
                v37:debug("VoiceChatService is not available");
                return ;
            end;
        else
            v30(v39);
            return ;
        end;
    end;
    if game:GetEngineFeature("EnableBubbleChatFromChatService") then
        l_Chat_0:GetPropertyChangedSignal("BubbleChatEnabled"):Connect(v92);
    end;
    v90();
    local v119 = not game:GetEngineFeature("EnableBubbleChatFromChatService") or l_Chat_0.BubbleChatEnabled;
    if v119 then
        v89();
    end;
    v39:dispatch(v16(v119));
    if game:GetEngineFeature("BubbleChatSettingsApi") then
        l_Chat_0.BubbleChatSettingsChanged:Connect(function(v120)
            local v121, v122 = v26.IChatSettings(v120);
            assert(v121, "Bad settings object passed to Chat:SetBubbleChatSettings:\n" .. (v122 or ""));
            v39:dispatch(v15(v120));
        end);
    end;
    l_default_0:asyncInit():andThen(v118):catch(function()
        v37:debug("VoiceChatServiceManager failed to initialize");
    end);
    return ;
else
    return ;
end;
