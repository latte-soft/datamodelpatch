local v0 = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Http.Url);
return function(v1, v2)
    assert(typeof(v2) == "string");
    return v1(string.format("%sv2/games/%s/media", v0.GAME_URL, v2), "GET");
end;
