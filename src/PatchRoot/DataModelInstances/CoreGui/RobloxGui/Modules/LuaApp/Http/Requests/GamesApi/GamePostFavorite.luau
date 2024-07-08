local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_HttpService_0 = game:GetService("HttpService");
local v2 = require(l_Modules_0.LuaApp.Http.Url);
return function(v3, v4, v5)
    assert(type(v4) == "string", "GamePostFavorite request expects universeId to be a string");
    assert(type(v5) == "boolean", "GamePostFavorite request expects isFavorited to be a boolean");
    return v3(string.format("%sv1/games/%s/favorites", v2.GAME_URL, v4), "POST", {
        postBody = l_HttpService_0:JSONEncode({
            isFavorited = v5
        })
    });
end;
