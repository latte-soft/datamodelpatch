local v0 = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Http.Url);
return function(v1, v2)
    assert(type(v2) == "string", "GameGetPrivateServersEnabled request expects universeId to be a string");
    return v1(string.format("%sv1/private-servers/enabled-in-universe/%s", v0.GAME_URL, v2), "GET");
end;
