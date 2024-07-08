local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_HttpService_0 = game:GetService("HttpService");
local _ = game:GetService("CorePackages");
local v3 = require(l_Modules_0.LuaApp.Http.Url);
return function(v4, v5)
    assert(type(v5) == "string", "invalid delivery target");
    return v4(string.format("%sv1/verified-signup/challenge", v3.AUTH_URL), "POST", {
        postBody = l_HttpService_0:JSONEncode({
            deliveryMethod = 0, 
            deliveryTarget = v5
        })
    });
end;
