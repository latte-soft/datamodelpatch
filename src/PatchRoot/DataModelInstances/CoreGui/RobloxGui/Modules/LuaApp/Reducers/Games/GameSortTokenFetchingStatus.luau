local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.Common.Immutable);
local v2 = require(l_Modules_0.LuaApp.Enum.RetrievalStatus);
local v3 = require(l_Modules_0.LuaApp.Actions.Games.SetGameSortTokenFetchingStatus);
return function(v4, v5)
    v4 = v4 or {
        Games = v2.NotStarted, 
        HomeGames = v2.NotStarted, 
        GamesSeeAll = v2.NotStarted
    };
    if v5.type == v3.name then
        v4 = v1.Set(v4, v5.sortCategory, v5.fetchStatus);
    end;
    return v4;
end;
