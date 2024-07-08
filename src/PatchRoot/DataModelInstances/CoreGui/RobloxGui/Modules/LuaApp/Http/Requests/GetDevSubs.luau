local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Http.UrlBuilder).new({
    base = require(l_Modules_0.LuaApp.Http.Url).APIS_URL, 
    path = "developer-subscriptions/v1/subscriptions", 
    query = "{userId}&{status}&{includeLookupData}&{cursor|}"
});
return function(v2, v3, v4, v5)
    return v2(v1({
        userId = v3, 
        status = v4, 
        cursor = v5, 
        includeLookupData = "true"
    }), "GET");
end;
