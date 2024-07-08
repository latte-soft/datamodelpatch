local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_HttpService_0 = game:GetService("HttpService");
local _ = require(l_Modules_0.LuaApp.Http.Url);
local v3 = require(l_Modules_0.LuaApp.Http.UrlBuilder).fromString("apis:developer-subscriptions/v1/subscriptions/{subscriptionId}");
return function(v4, v5, v6)
    return v4(v3({
        subscriptionId = v5
    }), "PATCH", {
        postBody = l_HttpService_0:JSONEncode({
            isAutoRenewing = v6
        })
    });
end;
