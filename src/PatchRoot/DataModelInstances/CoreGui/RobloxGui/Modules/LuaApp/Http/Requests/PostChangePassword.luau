local l_HttpService_0 = game:GetService("HttpService");
local v1 = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Http.Url);
return function(v2, v3, v4)
    assert(type(v3) == "string", "invalid current password");
    assert(type(v4) == "string", "invalid new password");
    return v2(string.format("%sv2/user/passwords/change", v1.AUTH_URL), "POST", {
        postBody = l_HttpService_0:JSONEncode({
            currentPassword = v3, 
            newPassword = v4
        })
    });
end;
