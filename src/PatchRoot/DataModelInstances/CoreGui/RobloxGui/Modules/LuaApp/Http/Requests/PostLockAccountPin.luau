local v0 = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Http.Url);
return function(v1)
    return v1(string.format("%sv1/account/pin/lock", v0.AUTH_URL), "POST", {
        postBody = ""
    });
end;
