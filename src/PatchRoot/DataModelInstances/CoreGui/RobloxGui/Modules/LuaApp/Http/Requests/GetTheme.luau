local v0 = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Http.Url);
return function(v1, v2)
    return v1(string.format("%sv1/themes/User/%d", v0.ACCOUNT_SETTINGS, v2), "GET");
end;
