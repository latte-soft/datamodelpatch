local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Rodux);
local l_Dictionary_0 = require(l_Parent_0.llama).Dictionary;
local l_Commands_0 = l_script_FirstAncestor_0.Commands;
local v5 = require(l_Commands_0.Whisper.RBXWhisperCommand);
local v6 = require(l_Commands_0.RBXTeamCommand);
return v2.createReducer({
    RBXWhisperCommand = {
        primaryAlias = v5.alias[1], 
        secondaryAlias = v5.alias[2]
    }, 
    RBXTeamCommand = {
        primaryAlias = v6.alias[1], 
        secondaryAlias = v6.alias[2]
    }
}, {
    [require(l_script_FirstAncestor_0.Actions.CommandAliasChanged).name] = function(v7, v8)
        return l_Dictionary_0.join(v7, {
            [v8.name] = {
                primaryAlias = v8.primaryAlias, 
                secondaryAlias = v8.secondaryAlias
            }
        });
    end
});
