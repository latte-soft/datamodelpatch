local v0 = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Models.User);
local v1 = {
    [v0.PresenceType.IN_GAME] = 3, 
    [v0.PresenceType.ONLINE] = 2, 
    [v0.PresenceType.IN_STUDIO] = 1, 
    [v0.PresenceType.OFFLINE] = 0
};
return {
    useLastOnlineForSort = function(v2, v3)
        local v4 = false;
        if typeof(v2) == "number" then
            v4 = false;
            if typeof(v3) == "number" then
                v4 = v2 ~= v3;
            end;
        end;
        return v4;
    end, 
    getFriendWeight = function(v5)
        local v6 = nil;
        if not (not v5 or not v5.presence) then
            v6 = v1[v5.presence];
        end;
        if v6 == nil then
            v6 = v1[v0.PresenceType.OFFLINE];
        end;
        return v6;
    end
};
