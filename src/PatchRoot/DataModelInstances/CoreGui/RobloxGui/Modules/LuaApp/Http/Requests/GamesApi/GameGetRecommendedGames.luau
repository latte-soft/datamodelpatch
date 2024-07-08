local v0 = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Http.Url);
return function(v1, v2, v3)
    assert(type(v2) == "string", "GameGetRecommendedGames request expects universeId to be a string");
    return v1(string.format("%sv1/games/recommendations/game/%s?%s", v0.GAME_URL, v2, (v0:makeQueryString(v3))), "GET");
end;
