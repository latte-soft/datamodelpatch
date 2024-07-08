local v0 = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Models.User);
local v1 = {
    [v0.PresenceType.IN_GAME] = 3, 
    [v0.PresenceType.ONLINE] = 2, 
    [v0.PresenceType.IN_STUDIO] = 1, 
    [v0.PresenceType.OFFLINE] = 0
};
return function(v2, v3)
    local v4 = v1[v2.presence] or 0;
    local v5 = v1[v3.presence] or 0;
    if v4 == v5 then
        return v2.name:lower() < v3.name:lower();
    else
        return v5 < v4;
    end;
end;
