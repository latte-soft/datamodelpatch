local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Http.UrlBuilder).new({
    base = require(l_Modules_0.LuaApp.Http.Url).AUTH_URL, 
    path = "/v2/passwords/validate", 
    query = "request.username={username}&request.password={password}"
});
return function(v2, v3, v4)
    return v2(v1({
        username = v3, 
        password = v4
    }), "GET", {
        maxRetryCount = 0
    });
end;
