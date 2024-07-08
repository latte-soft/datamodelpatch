local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Http.UrlBuilder).new({
    base = require(l_Modules_0.LuaApp.Http.Url).AUTH_URL, 
    path = "v1/validators/username", 
    query = "requestBody.username={username}&requestBody.birthday={birthday}"
});
return function(v2, v3, v4)
    assert(type(v3) == "string", "invalid username");
    assert(type(v4) == "string", "invalid birthday");
    return v2(v1({
        username = v3, 
        birthday = v4
    }), "GET", {
        maxRetryCount = 0
    });
end;
