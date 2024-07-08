local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Http.Url);
local v2 = require(l_Modules_0.LuaApp.Http.UrlBuilder);
local v3 = require(l_Modules_0.LuaApp.Enum.UsernameValidationContext);
local v4 = v2.new({
    base = v1.AUTH_URL, 
    path = "v2/usernames/validate", 
    query = "request.username={username}&request.birthday={birthday}&request.context={context}"
});
return function(v5, v6, v7, v8)
    if not v8 then
        v8 = v3.Unknown;
    end;
    return v5(v4({
        username = v6, 
        birthday = v7, 
        context = v8
    }), "GET", {
        maxRetryCount = 0
    });
end;
