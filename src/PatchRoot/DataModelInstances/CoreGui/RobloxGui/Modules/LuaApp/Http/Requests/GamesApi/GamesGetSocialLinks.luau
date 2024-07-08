local v0 = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Http.Url);
return function(v1, v2)
    return v1(string.format("%sv1/games/%d/social-links/list", v0.GAME_URL, v2), "GET");
end;
