local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Http.UrlBuilder).new({
    base = require(l_Modules_0.LuaApp.Http.Url).USERS_URL, 
    path = "display-names/validate", 
    query = "displayname={displayname}&birthdate={birthday}"
});
return function(v2, v3, v4)
    return v2(v1({
        displayname = v3, 
        birthday = v4
    }), "GET", {
        maxRetryCount = 0
    });
end;
