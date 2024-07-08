local l_HttpService_0 = game:GetService("HttpService");
local v1 = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Http.UrlBuilder);
return function(v2, v3, v4)
    assert(type(v3) == "string", "invalid username");
    assert(type(v4) == "string", "invalid birthday");
    return v2(v1.fromString("auth:v1/validators/username")(), "POST", {
        postBody = l_HttpService_0:JSONEncode({
            username = v3, 
            birthday = v4
        }), 
        maxRetryCount = 0
    });
end;
