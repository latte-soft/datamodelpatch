local v0 = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Http.Url);
return function(v1, v2)
    assert(type(v2) == "string", "GameGetIsFavorite request expects universeId to be a string");
    return v1(string.format("%sv1/games/%s/favorites", v0.GAME_URL, v2), "GET");
end;
