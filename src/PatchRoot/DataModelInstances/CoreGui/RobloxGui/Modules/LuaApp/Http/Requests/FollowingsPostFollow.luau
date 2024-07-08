local v0 = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Http.Url);
local l_HttpService_0 = game:GetService("HttpService");
return function(v2, v3, v4)
    assert(type(v3) == "string", "FollowingsPostFollow request expects userId to be a string");
    assert(type(v4) == "string", "FollowingsPostFollow request expects universeId to be a string");
    return v2(string.format("%s/v1/users/%s/universes/%s", v0.FOLLOWINGS_URL, v3, v4), "POST", {
        postBody = l_HttpService_0:JSONEncode({})
    });
end;
