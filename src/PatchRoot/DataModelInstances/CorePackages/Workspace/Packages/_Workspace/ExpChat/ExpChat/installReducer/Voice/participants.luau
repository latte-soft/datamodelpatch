local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Dictionary_0 = require(l_Parent_0.llama).Dictionary;
local l_None_0 = require(l_Parent_0.llama).None;
local v4 = require(l_Parent_0.Rodux);
local l_VOICE_STATE_0 = require(l_Parent_0.VoiceChat).Constants.VOICE_STATE;
local l_Actions_0 = l_script_FirstAncestor_0.Actions;
return v4.createReducer({}, {
    [require(l_Actions_0.VoiceParticipantAdded).name] = function(v7, v8)
        local l_userId_0 = v8.userId;
        return l_Dictionary_0.join(v7, {
            [l_userId_0] = v7[l_userId_0] or "Hidden"
        });
    end, 
    [require(l_Actions_0.VoiceParticipantRemoved).name] = function(v10, v11)
        return l_Dictionary_0.join(v10, {
            [v11.userId] = l_None_0
        });
    end, 
    [require(l_Actions_0.VoiceParticipantsChanged).name] = function(v12, v13)
        local l_newParticipants_0 = v13.newParticipants;
        local v15 = table.clone(v12);
        for v16, v17 in l_newParticipants_0, nil, nil do
            local l_INACTIVE_0 = l_VOICE_STATE_0.INACTIVE;
            if v17.subscriptionCompleted then
                if not v17.isMutedLocally then
                    if not v17.isMuted then
                        if v17.isSignalActive then
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
            v15[tostring(v16)] = l_INACTIVE_0;
        end;
        return v15;
    end, 
    [require(l_Actions_0.VoiceStateChanged).name] = function(v19, v20)
        if not v19[v20.userId] then
            return v19;
        else
            return l_Dictionary_0.join(v19, {
                [v20.userId] = v20.newState
            });
        end;
    end
});
