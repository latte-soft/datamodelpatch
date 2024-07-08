local v0 = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Http.Url);
return function(v1)
    return v1(string.format("%s/user/friend-requests/count", v0.FRIEND_URL), "GET");
end;
