local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Http.UrlBuilder).new({
    base = require(l_Modules_0.LuaApp.Http.Url).AUTH_URL, 
    path = "v3/signup/bundles"
});
return function(v2)
    return v2(v1(), "GET");
end;
