local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local v1 = require(l_script_FirstAncestor_0.Logger):new("ExpChat/Command/Team");
local v2 = require(l_script_FirstAncestor_0.Actions.ChatInputBarActivatedTeamMode);
local _ = require(script.Parent.types);
return {
    name = script.Name, 
    alias = {
        "/team", 
        "/t", 
        "%%"
    }, 
    clientRun = function(v4, _, _)
        if not v4:getState().LocalTeam then
            v1:debug("Could not team chat because not in team");
            return {
                key = "CoreScripts.TextChat.TeamChat.Error.NotOnTeam", 
                metadata = "Roblox.Team.Error.CannotTeamChatIfNotInTeam"
            };
        else
            v4:dispatch(v2());
            return {
                key = "", 
                metadata = "Roblox.Team.Info.Success"
            };
        end;
    end
};
