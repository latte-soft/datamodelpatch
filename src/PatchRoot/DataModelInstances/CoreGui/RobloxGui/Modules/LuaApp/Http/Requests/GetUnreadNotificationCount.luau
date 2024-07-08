local v0 = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Http.Url);
return function(v1)
    return v1(string.format("%sv2/stream-notifications/unread-count", v0.NOTIFICATION_URL), "GET");
end;
