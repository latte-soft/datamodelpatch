local v0 = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Http.Url);
return function(v1, v2, v3)
    assert(type(v2) == "string", "FollowingsGetStatus request expects userId to be a string");
    assert(type(v3) == "string", "FollowingsGetStatus request expects universeId to be a string");
    return v1(string.format("%s/v1/users/%s/universes/%s/status", v0.FOLLOWINGS_URL, v2, v3), "GET");
end;
