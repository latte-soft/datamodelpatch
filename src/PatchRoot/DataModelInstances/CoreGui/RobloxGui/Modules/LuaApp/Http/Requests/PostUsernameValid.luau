local l_HttpService_0 = game:GetService("HttpService");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.LuaApp.Http.UrlBuilder);
local v3 = require(l_Modules_0.LuaApp.Enum.UsernameValidationContext);
return function(v4, v5, v6, v7)
    if not v7 then
        v7 = v3.Unknown;
    end;
    assert(type(v5) == "string", "invalid username");
    assert(type(v6) == "string", "invalid birthday");
    return v4(v2.fromString("auth:v2/usernames/validate")(), "POST", {
        postBody = l_HttpService_0:JSONEncode({
            username = v5, 
            birthday = v6, 
            context = v7
        })
    });
end;
