local l_HttpService_0 = game:GetService("HttpService");
local v1 = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Http.Url);
return function(v2, v3, v4)
    return v2(string.format("%saccount-security-service/v1/prompt-assignments", v1.APIS_URL), "POST", {
        postBody = l_HttpService_0:JSONEncode({
            promptType = v3, 
            action = v4
        })
    });
end;
