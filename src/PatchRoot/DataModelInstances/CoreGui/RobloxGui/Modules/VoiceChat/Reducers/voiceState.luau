local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.Flags.FFlagEnableVoiceChatStorybookFix);
local v2 = require(l_CorePackages_0.Packages.Cryo);
local v3 = require(l_CorePackages_0.Packages.Rodux);
local v4 = nil;
v4 = if not v1() then require(script.Parent.Parent.VoiceChatServiceManager).default.VOICE_STATE else require(l_CorePackages_0.Workspace.Packages.VoiceChat).Constants.VOICE_STATE;
return (v3.createReducer({}, {
    [require(script.Parent.Parent.Actions.VoiceEnabledChanged).name] = function(v5, v6)
        return v2.Dictionary.join(v5, {
            voiceEnabled = v6.enabled
        });
    end, 
    [require(script.Parent.Parent.Actions.ParticipantAdded).name] = function(v7, v8)
        local l_userId_0 = v8.userId;
        return v2.Dictionary.join(v7, {
            [l_userId_0] = v7[l_userId_0] or v4.HIDDEN
        });
    end, 
    [require(script.Parent.Parent.Actions.ParticipantRemoved).name] = function(v10, v11)
        return v2.Dictionary.join(v10, {
            [v11.userId] = v2.None
        });
    end, 
    [require(script.Parent.Parent.Actions.ParticipantsChanged).name] = function(v12, v13)
        local l_newParticipants_0 = v13.newParticipants;
        local v15 = table.clone(v12);
        for v16, v17 in l_newParticipants_0, nil, nil do
            local l_INACTIVE_0 = v4.INACTIVE;
            if v17.subscriptionCompleted then
                if not v17.isMutedLocally then
                    if not v17.isMuted then
                        if v17.isSignalActive then
                            l_INACTIVE_0 = v4.TALKING;
                        end;
                    else
                        l_INACTIVE_0 = v4.MUTED;
                    end;
                else
                    l_INACTIVE_0 = v4.LOCAL_MUTED;
                end;
            else
                l_INACTIVE_0 = v4.CONNECTING;
            end;
            v15[tostring(v16)] = l_INACTIVE_0;
        end;
        return v15;
    end, 
    [require(script.Parent.Parent.Actions.VoiceStateChanged).name] = function(v19, v20)
        if not v19[v20.userId] then
            return v19;
        else
            return v2.Dictionary.join(v19, {
                [v20.userId] = v20.newState
            });
        end;
    end
}));
