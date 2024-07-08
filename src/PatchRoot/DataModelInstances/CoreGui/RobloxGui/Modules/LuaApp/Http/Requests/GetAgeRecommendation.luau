local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Http.Url);
local v2 = require(l_Modules_0.LuaApp.Http.UrlBuilder);
local l_HttpService_0 = game:GetService("HttpService");
local v4 = v2.new({
    base = v1.APIS_URL, 
    path = "experience-guidelines-api/experience-guidelines/get-age-recommendation"
});
return function(v5, v6)
    return v5(v4(), "POST", {
        postBody = l_HttpService_0:JSONEncode({
            universeId = v6
        })
    });
end;
