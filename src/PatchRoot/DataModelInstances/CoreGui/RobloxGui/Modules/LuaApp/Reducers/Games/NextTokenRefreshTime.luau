local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.Common.Immutable);
local v2 = require(l_Modules_0.LuaApp.Actions.Games.SetNextTokenRefreshTime);
return function(v3, v4)
    v3 = v3 or {
        Games = -1, 
        HomeGames = -1, 
        GamesSeeAll = -1
    };
    if v4.type == v2.name then
        v3 = v1.Set(v3, v4.sortCategory, v4.nextRefreshTime);
    end;
    return v3;
end;
