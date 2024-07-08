local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_HttpService_0 = game:GetService("HttpService");
local v2 = require(l_Modules_0.LuaApp.Http.Url);
return function(v3, v4)
    assert(type(v4) == "string", "PostRegisterAppPresence request expects locationId to be a string");
    return v3(string.format("%s/presence/register-app-presence", v2.PRESENCE_URL), "POST", {
        postBody = l_HttpService_0:JSONEncode({
            location = v4
        })
    });
end;
