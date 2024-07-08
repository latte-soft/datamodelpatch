local v0 = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Http.Url);
return function(v1)
    return v1(string.format("%sv1/email", v0.ACCOUNT_SETTINGS_URL), "GET");
end;
