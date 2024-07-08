local l_HttpService_0 = game:GetService("HttpService");
local v1 = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Http.Url);
return function(v2, v3)
    return v2(string.format("%s/user/following-exists", v1.FRIEND_URL), "POST", {
        postBody = l_HttpService_0:JSONEncode({
            targetUserIds = v3
        })
    });
end;
