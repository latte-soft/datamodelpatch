local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Dictionary_0 = require(l_Parent_0.llama).Dictionary;
local l_None_0 = require(l_Parent_0.llama).None;
local v4 = require(l_Parent_0.Rodux);
local l_Actions_0 = l_script_FirstAncestor_0.Actions;
return v4.createReducer({}, {
    [require(l_Actions_0.VoiceParticipantAdded).name] = function(v6, v7)
        local l_userId_0 = v7.userId;
        return l_Dictionary_0.set(v6, l_userId_0, v6[l_userId_0] or false);
    end, 
    [require(l_Actions_0.VoiceParticipantRemoved).name] = function(v9, v10)
        return l_Dictionary_0.set(v9, v10.userId, l_None_0);
    end, 
    [require(l_Actions_0.VoiceParticipantToggleMuted).name] = function(v11, v12)
        if v11[v12.userId] ~= nil then
            return l_Dictionary_0.join(v11, {
                [v12.userId] = v12.isMuted
            });
        else
            return v11;
        end;
    end
});
