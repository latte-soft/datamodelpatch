local v0 = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Http.Url);
return function(v1)
    return v1(string.format("%s/users/authenticated", v0.USERS_URL), "GET", {
        maxRetryCount = 0
    });
end;
