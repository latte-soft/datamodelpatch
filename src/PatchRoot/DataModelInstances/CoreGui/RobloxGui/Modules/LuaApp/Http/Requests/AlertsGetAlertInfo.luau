local v0 = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Http.Url);
return function(v1)
    return v1(string.format("%smaintenance-status/v1/alerts/alert-info", v0.APIS_URL), "GET");
end;
