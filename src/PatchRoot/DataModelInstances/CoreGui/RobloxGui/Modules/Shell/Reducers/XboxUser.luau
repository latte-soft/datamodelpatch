local v0 = require(game:GetService("CoreGui").RobloxGui.Modules.Shell.Actions.SetXboxUser);
return function(v1, v2)
    v1 = v1 or {};
    if v2.type == v0.name then
        return {
            gamertag = v2.gamertag, 
            xuid = v2.xuid
        };
    else
        return v1;
    end;
end;
