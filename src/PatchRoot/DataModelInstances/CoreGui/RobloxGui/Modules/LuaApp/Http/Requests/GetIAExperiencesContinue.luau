local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_HttpService_0 = game:GetService("HttpService");
local v2 = require(l_Modules_0.LuaApp.Http.UrlBuilder);
local v3 = require(l_Modules_0.LuaApp.Http.Url);
return function(v4)
    return v4(v2.new({
        base = v3.APIS_URL, 
        path = "/experience-api/get-user-recent-experiences"
    })(), "POST", {
        postBody = l_HttpService_0:JSONEncode({
            startRow = 0, 
            count = 50
        })
    });
end;
