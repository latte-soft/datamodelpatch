local l_HttpService_0 = game:GetService("HttpService");
local l_CoreGui_0 = game:GetService("CoreGui");
local _ = game:GetService("CorePackages");
local v3 = require(l_CoreGui_0.RobloxGui.Modules.LuaApp.Http.Url);
return function(v4, v5, v6)
    assert(type(v6) == "string", "invalid challenge has been passed into PostVerifyPhoneNumber");
    assert(type(v5) == "string", "invalid code has been passed into PostVerifyPhoneNumber");
    return v4(string.format("%sv1/verified-signup/voucher", v3.AUTH_URL), "POST", {
        postBody = l_HttpService_0:JSONEncode({
            code = v5, 
            challenge = v6
        }), 
        maxRetryCount = 0
    });
end;
