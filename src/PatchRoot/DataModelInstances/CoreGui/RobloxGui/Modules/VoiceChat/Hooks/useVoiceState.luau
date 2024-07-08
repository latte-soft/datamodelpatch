local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local l_Players_0 = game:GetService("Players");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_BlockedStatusChangedEvent_0 = require(l_RobloxGui_0.Modules.BlockingUtility):GetBlockedStatusChangedEvent();
local l_default_0 = require(script.Parent.Parent.VoiceChatServiceManager).default;
local v6 = require(l_RobloxGui_0.Modules.VoiceChat.VoiceStateContext);
local l_VOICE_STATE_0 = require(l_CorePackages_0.Workspace.Packages.VoiceChat).Constants.VOICE_STATE;
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
while not l_LocalPlayer_0 do
    l_Players_0:GetPropertyChangedSignal("LocalPlayer"):Wait();
    l_LocalPlayer_0 = l_Players_0.LocalPlayer;
end;
local v9 = not not l_LocalPlayer_0 and l_LocalPlayer_0.UserId or 0;
local v10 = nil;
v10 = if not game:GetEngineFeature("VoiceChatSupported") then {
    Idle = 1, 
    Joining = 2, 
    JoiningRetry = 3, 
    Joined = 4, 
    Leaving = 5, 
    Ended = 6, 
    Failed = 7
} else Enum.VoiceChatState;
local v11 = {
    [v10.Idle] = l_VOICE_STATE_0.HIDDEN, 
    [v10.Joining] = l_VOICE_STATE_0.CONNECTING, 
    [v10.JoiningRetry] = l_VOICE_STATE_0.CONNECTING, 
    [v10.Joined] = l_VOICE_STATE_0.MUTED, 
    [v10.Leaving] = l_VOICE_STATE_0.MUTED, 
    [v10.Ended] = l_VOICE_STATE_0.HIDDEN, 
    [v10.Failed] = l_VOICE_STATE_0.ERROR
};
local function _(v12)
    if v11[v12] then
        return v11[v12];
    else
        return l_VOICE_STATE_0.MUTED;
    end;
end;
local function _(v14)
    local l_INACTIVE_0 = l_VOICE_STATE_0.INACTIVE;
    if not v14.subscriptionFailed then
        if v14.subscriptionCompleted then
            if not v14.isMutedLocally then
                if not v14.isMuted then
                    if v14.isSignalActive then
                        l_INACTIVE_0 = l_VOICE_STATE_0.TALKING;
                    end;
                    return l_INACTIVE_0;
                else
                    return l_VOICE_STATE_0.MUTED;
                end;
            else
                return l_VOICE_STATE_0.LOCAL_MUTED;
            end;
        else
            return l_VOICE_STATE_0.CONNECTING;
        end;
    else
        return l_VOICE_STATE_0.ERROR;
    end;
end;
return function(v17, v18, v19)
    local v20 = not not v19 and v19.voiceChatServiceManager or l_default_0;
    local v21 = v1.useContext(v6.Context);
    local v22, v23 = v1.useState(l_VOICE_STATE_0.HIDDEN);
    v1.useEffect(function()
        if not (not v21.voiceEnabled or not v17) and not v18 then
            local v24 = tonumber(v17);
            local v25 = tostring(v17);
            local v26 = v9 == v24;
            local v27 = nil;
            local v28 = {};
            local v29 = false;
            local function _(v30)
                if not v29 then
                    v23(v30);
                end;
            end;
            local function v37(v32)
                local l_v22_0 = v22;
                if not v26 then
                    local v34 = v20.participants[v25];
                    if not (not v34 or v27) then
                        local l_INACTIVE_1 = l_VOICE_STATE_0.INACTIVE;
                        if not v34.subscriptionFailed then
                            if v34.subscriptionCompleted then
                                if not v34.isMutedLocally then
                                    if not v34.isMuted then
                                        if v34.isSignalActive then
                                            l_INACTIVE_1 = l_VOICE_STATE_0.TALKING;
                                        end;
                                    else
                                        l_INACTIVE_1 = l_VOICE_STATE_0.MUTED;
                                    end;
                                else
                                    l_INACTIVE_1 = l_VOICE_STATE_0.LOCAL_MUTED;
                                end;
                            else
                                l_INACTIVE_1 = l_VOICE_STATE_0.CONNECTING;
                            end;
                        else
                            l_INACTIVE_1 = l_VOICE_STATE_0.ERROR;
                        end;
                        l_v22_0 = l_INACTIVE_1;
                    end;
                else
                    l_v22_0 = if v11[v32] then v11[v32] else l_VOICE_STATE_0.MUTED;
                end;
                if v32 == v10.Failed then
                    if not v26 then
                        l_v22_0 = l_VOICE_STATE_0.HIDDEN;
                    end;
                elseif not ((not (v32 == v10.Joined) or v20.localMuted) or not v26) then
                    l_v22_0 = if not v20.isTalking then if v20.localMuted then l_VOICE_STATE_0.MUTED else l_VOICE_STATE_0.INACTIVE else l_VOICE_STATE_0.TALKING;
                end;
                local l_l_v22_0_0 = l_v22_0;
                if not v29 then
                    v23(l_l_v22_0_0);
                end;
            end;
            v37(v21.voiceState);
            delay(0, function()
                if not v29 then
                    v37(v21.voiceState);
                    if not v26 then
                        table.insert(v28, v20.participantsUpdate.Event:Connect(function(v38)
                            local v39 = v38[v25];
                            if not v39 or v27 then
                                local l_HIDDEN_0 = l_VOICE_STATE_0.HIDDEN;
                                if not v29 then
                                    v23(l_HIDDEN_0);
                                end;
                            else
                                local l_INACTIVE_2 = l_VOICE_STATE_0.INACTIVE;
                                if not v39.subscriptionFailed then
                                    if v39.subscriptionCompleted then
                                        if not v39.isMutedLocally then
                                            if not v39.isMuted then
                                                if v39.isSignalActive then
                                                    l_INACTIVE_2 = l_VOICE_STATE_0.TALKING;
                                                end;
                                            else
                                                l_INACTIVE_2 = l_VOICE_STATE_0.MUTED;
                                            end;
                                        else
                                            l_INACTIVE_2 = l_VOICE_STATE_0.LOCAL_MUTED;
                                        end;
                                    else
                                        l_INACTIVE_2 = l_VOICE_STATE_0.CONNECTING;
                                    end;
                                else
                                    l_INACTIVE_2 = l_VOICE_STATE_0.ERROR;
                                end;
                                local l_l_INACTIVE_2_0 = l_INACTIVE_2;
                                if not v29 then
                                    v23(l_l_INACTIVE_2_0);
                                    return ;
                                end;
                            end;
                        end));
                        table.insert(v28, v20.participantLeft.Event:Connect(function(_, v44)
                            if v44 == v24 then
                                local l_HIDDEN_1 = l_VOICE_STATE_0.HIDDEN;
                                if not v29 then
                                    v23(l_HIDDEN_1);
                                end;
                            end;
                        end));
                        table.insert(v28, v20.participantJoined.Event:Connect(function(_, v47)
                            if v47 == v24 then
                                local l_HIDDEN_2 = l_VOICE_STATE_0.HIDDEN;
                                if not v29 then
                                    v23(l_HIDDEN_2);
                                end;
                            end;
                        end));
                        table.insert(v28, l_BlockedStatusChangedEvent_0:Connect(function(v49, v50)
                            if v24 == v49 then
                                if not v50 then
                                    v27 = nil;
                                    local v51 = v20.participants[v25];
                                    if not v51 then
                                        local l_HIDDEN_3 = l_VOICE_STATE_0.HIDDEN;
                                        if not v29 then
                                            v23(l_HIDDEN_3);
                                        end;
                                    else
                                        local l_INACTIVE_3 = l_VOICE_STATE_0.INACTIVE;
                                        if not v51.subscriptionFailed then
                                            if v51.subscriptionCompleted then
                                                if not v51.isMutedLocally then
                                                    if not v51.isMuted then
                                                        if v51.isSignalActive then
                                                            l_INACTIVE_3 = l_VOICE_STATE_0.TALKING;
                                                        end;
                                                    else
                                                        l_INACTIVE_3 = l_VOICE_STATE_0.MUTED;
                                                    end;
                                                else
                                                    l_INACTIVE_3 = l_VOICE_STATE_0.LOCAL_MUTED;
                                                end;
                                            else
                                                l_INACTIVE_3 = l_VOICE_STATE_0.CONNECTING;
                                            end;
                                        else
                                            l_INACTIVE_3 = l_VOICE_STATE_0.ERROR;
                                        end;
                                        local l_l_INACTIVE_3_0 = l_INACTIVE_3;
                                        if not v29 then
                                            v23(l_l_INACTIVE_3_0);
                                            return ;
                                        end;
                                    end;
                                else
                                    v27 = true;
                                    local l_HIDDEN_4 = l_VOICE_STATE_0.HIDDEN;
                                    if not v29 then
                                        v23(l_HIDDEN_4);
                                        return ;
                                    end;
                                end;
                            end;
                        end));
                        return ;
                    else
                        table.insert(v28, v20.talkingChanged.Event:Connect(function(v56)
                            local v57 = if not v56 then l_VOICE_STATE_0.INACTIVE else l_VOICE_STATE_0.TALKING;
                            if not v29 then
                                v23(v57);
                            end;
                        end));
                        table.insert(v28, v20.muteChanged.Event:Connect(function(v58)
                            local v59 = if not v58 then l_VOICE_STATE_0.INACTIVE else l_VOICE_STATE_0.MUTED;
                            if not v29 then
                                v23(v59);
                            end;
                        end));
                        return ;
                    end;
                else
                    return ;
                end;
            end);
            return function()
                v29 = true;
                delay(0, function()
                    for _, v61 in v28, nil, nil do
                        v61:disconnect();
                    end;
                end);
            end;
        else
            v23(l_VOICE_STATE_0.HIDDEN);
            return function()
            end;
        end;
    end, {
        v17, 
        v21.voiceState, 
        v18 == true
    });
    return v22;
end;
