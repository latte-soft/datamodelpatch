local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_Modules_0.LuaApp.Http.Url);
local l_HttpService_0 = game:GetService("HttpService");
local v4 = require(l_Modules_0.LuaApp.Http.UrlBuilder);
local v5 = require(l_CorePackages_0.Cryo);
local v6 = v4.new({
    base = v2.APIS_URL, 
    path = "discovery-api/omni-recommendation-metadata"
});
return function(v7, v8)
    return v7(v6(), "POST", {
        postBody = l_HttpService_0:JSONEncode({
            contents = v5.List.map(v8, function(v9)
                return {
                    contentType = v9.contentType, 
                    contentId = v9.contentId
                };
            end), 
            sessionId = "sessionId"
        })
    });
end;
