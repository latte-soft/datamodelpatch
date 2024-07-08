local v0 = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Http.UrlBuilder);
return function(v1)
    return v1(v0.fromString("accountinformation:phone")(), "GET");
end;
