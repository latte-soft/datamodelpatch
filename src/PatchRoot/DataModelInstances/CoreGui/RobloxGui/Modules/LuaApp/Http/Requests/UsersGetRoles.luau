local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Http.Url);
local v2 = require(l_Modules_0.LuaApp.Http.UrlBuilder);
return function(v3)
    return v3(v2.new({
        base = v1.USERS_URL, 
        path = "users/authenticated/roles"
    })(), "GET");
end;
