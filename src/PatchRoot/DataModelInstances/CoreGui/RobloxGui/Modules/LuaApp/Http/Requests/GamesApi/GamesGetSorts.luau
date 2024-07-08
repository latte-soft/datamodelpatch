local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Http.Url);
local v2 = require(l_Modules_0.LuaApp.Constants);
return function(v3, v4)
    return v3(string.format("%sv1/games/sorts?gameSortsContext=%s", v1.GAME_URL, v2.ApiUsedForSorts[v4]), "GET");
end;
