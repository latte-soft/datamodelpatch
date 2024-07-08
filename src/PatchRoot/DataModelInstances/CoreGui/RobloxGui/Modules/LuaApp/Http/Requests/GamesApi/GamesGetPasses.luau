local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Http.Url);
local v2 = require(l_Modules_0.Personalization.Flags.GetFFlagUseNewDefaultGamePassesLoadLimit);
return function(v3, v4)
    if not v2() then
        return v3(string.format("%sv1/games/%d/game-passes", v1.GAME_URL, v4), "GET");
    else
        return v3(string.format("%sv1/games/%d/game-passes?limit=50", v1.GAME_URL, v4), "GET");
    end;
end;
