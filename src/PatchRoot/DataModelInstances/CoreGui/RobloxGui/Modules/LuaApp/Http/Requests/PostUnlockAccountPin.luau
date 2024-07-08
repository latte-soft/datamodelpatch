local l_HttpService_0 = game:GetService("HttpService");
local v1 = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Http.Url);
return function(v2, v3)
    assert(type(v3) == "string", "invalid account PIN");
    return v2(string.format("%sv1/account/pin/unlock", v1.AUTH_URL), "POST", {
        postBody = l_HttpService_0:JSONEncode({
            pin = v3
        })
    });
end;
