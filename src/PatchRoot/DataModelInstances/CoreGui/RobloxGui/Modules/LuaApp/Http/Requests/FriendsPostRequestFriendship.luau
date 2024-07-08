local l_HttpService_0 = game:GetService("HttpService");
local v1 = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Http.Url);
return function(v2, v3, v4)
    return v2(string.format("%s/users/%s/request-friendship", v1.FRIEND_URL, v3), "POST", {
        postBody = l_HttpService_0:JSONEncode({
            friendshipOriginSourceType = v4
        })
    });
end;
