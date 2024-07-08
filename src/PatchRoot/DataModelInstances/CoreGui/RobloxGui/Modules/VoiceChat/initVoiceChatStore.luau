local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_Players_0 = game:GetService("Players");
local v3 = require(l_RobloxGui_0.Modules.Flags.FFlagEnableVoiceChatStorybookFix);
local v4 = require(l_RobloxGui_0.Modules.Flags.GetFFlagSubscriptionFailureUX);
local v5 = require(l_RobloxGui_0.Modules.Flags.GetFFlagLocalMutedNilFix);
local v6 = require(l_RobloxGui_0.Modules.Flags.GetFFlagRemoveInGameChatBubbleChatReferences);
local v7 = require(script.Parent.Actions.VoiceEnabledChanged);
local v8 = require(script.Parent.Actions.VoiceStateChanged);
local v9 = require(script.Parent.Actions.ParticipantAdded);
local v10 = require(script.Parent.Actions.ParticipantRemoved);
local v11 = require(script.Parent.Actions.PlayerRemoved);
local l_default_0 = require(script.Parent.VoiceChatServiceManager).default;
local l_Constants_0 = require(l_CorePackages_0.Workspace.Packages.VoiceChat).Constants;
local v14 = require(l_RobloxGui_0.Modules.BlockingUtility);
local v15 = require(l_RobloxGui_0.Modules.InGameChat.BubbleChat.Logger)(script.Name);
if v6() then
    v15 = require(l_RobloxGui_0.Modules.VoiceChat.Logger)(script.Name);
end;
local v16 = nil;
v16 = if not v3() then l_default_0.VOICE_STATE else l_Constants_0.VOICE_STATE;
local function _(v17)
    return "..." .. string.sub(tostring(v17), -4);
end;
local v19 = nil;
local function v26(v20, v21)
    local v22 = tostring(l_Players_0.LocalPlayer.UserId);
    v21:dispatch(v7(v20 ~= Enum.VoiceChatState.Ended));
    if v19[v20] then
        v21:dispatch(v8(v22, v19[v20]));
    else
        v15:warning("LOCAL_STATE_MAP does not exist for {} state", v20);
        v21:dispatch(v8(v22, v16.MUTED));
    end;
    if v20 == Enum.VoiceChatState.Failed then
        for _, v24 in pairs(l_Players_0:GetPlayers()) do
            local v25 = tostring(v24.UserId);
            if v24 ~= l_Players_0.LocalPlayer then
                v21:dispatch(v8(v25, v16.HIDDEN));
            end;
        end;
        return ;
    else
        if not (not (v20 == Enum.VoiceChatState.Joined) or not if not v5 then not l_default_0.localMuted else l_default_0.localMuted == false) then
            v21:dispatch(v8(v22, v16.INACTIVE));
        end;
        return ;
    end;
end;
local function v44(v27)
    v19 = {
        [Enum.VoiceChatState.Idle] = v16.HIDDEN, 
        [Enum.VoiceChatState.Joining] = v16.CONNECTING, 
        [Enum.VoiceChatState.JoiningRetry] = v16.CONNECTING, 
        [Enum.VoiceChatState.Joined] = v16.MUTED, 
        [Enum.VoiceChatState.Leaving] = v16.MUTED, 
        [Enum.VoiceChatState.Ended] = v16.HIDDEN, 
        [Enum.VoiceChatState.Failed] = v16.ERROR
    };
    local v28 = l_default_0:getService();
    if v28 then
        local l_UserId_0 = l_Players_0.LocalPlayer.UserId;
        for _, v31 in pairs(l_Players_0:GetPlayers()) do
            v15:trace("Adding existing player {}", "..." .. string.sub(tostring(v31.UserId), -4));
            v27:dispatch(v9((tostring(v31.UserId))));
        end;
        l_Players_0.PlayerAdded:Connect(function(v32)
            v15:trace("Adding joining player {}", "..." .. string.sub(tostring(v32.UserId), -4));
            v27:dispatch(v9((tostring(v32.userId))));
        end);
        l_Players_0.PlayerRemoving:Connect(function(v33)
            v15:trace("Removing player {}", "..." .. string.sub(tostring(v33.UserId), -4));
            v27:dispatch(v11((tostring(v33.userId))));
            v27:dispatch(v10((tostring(v33.userId))));
        end);
        v27:dispatch(v8(l_UserId_0, v16.HIDDEN));
        l_default_0.muteChanged.Event:Connect(function(v34)
            v15:debug("Mute changed to {}", v34);
            v27:dispatch(v8(l_UserId_0, not not v34 and v16.MUTED or v16.INACTIVE));
        end);
        l_default_0.participantsUpdate.Event:Connect(function(v35)
            for v36, v37 in pairs(v35) do
                local l_INACTIVE_0 = v16.INACTIVE;
                if not v37.subscriptionFailed or not v4() then
                    if v37.subscriptionCompleted then
                        if not v37.isMutedLocally then
                            if not v37.isMuted then
                                if v37.isSignalActive then
                                    l_INACTIVE_0 = v16.TALKING;
                                end;
                            else
                                l_INACTIVE_0 = v16.MUTED;
                            end;
                        else
                            l_INACTIVE_0 = v16.LOCAL_MUTED;
                        end;
                    else
                        l_INACTIVE_0 = v16.CONNECTING;
                    end;
                else
                    l_INACTIVE_0 = v16.ERROR;
                end;
                v15:trace("Participant update for {}, voice state {}", v36, l_INACTIVE_0);
                v27:dispatch(v8(v36, l_INACTIVE_0));
            end;
        end);
        l_default_0.talkingChanged.Event:Connect(function(v39)
            if not v39 then
                v27:dispatch(v8(l_UserId_0, v16.INACTIVE));
                return ;
            else
                v27:dispatch(v8(l_UserId_0, v16.TALKING));
                return ;
            end;
        end);
        v14:GetBlockedStatusChangedEvent():Connect(function(v40, v41)
            if not v41 then
                v27:dispatch(v9((tostring(v40))));
                return ;
            else
                v27:dispatch(v10((tostring(v40))));
                return ;
            end;
        end);
        v15:debug("Initial voice state is {}", v28.VoiceChatState);
        v26(v28.VoiceChatState, v27);
        v28.StateChanged:Connect(function(_, v43)
            v15:debug("Voice state changed to {}", v43);
            v26(v43, v27);
        end);
        return ;
    else
        v15:debug("VoiceChatService is not available");
        return ;
    end;
end;
return function(v45)
    if game:GetEngineFeature("VoiceChatSupported") then
        l_default_0:asyncInit():andThen(function()
            l_default_0:SetupParticipantListeners();
            v44(v45);
        end):catch(function()
            v15:warning("Failed to init VoiceChatServiceManager");
        end);
    end;
end;
