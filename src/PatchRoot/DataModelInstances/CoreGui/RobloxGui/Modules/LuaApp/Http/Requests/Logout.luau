local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local _ = require(l_CorePackages_0.Workspace.Packages.Http);
local v4 = require(l_Modules_0.LuaApp.Http.Url);
return function(v5)
    return v5(string.format("%sv1/logout", v4.AUTH_URL), "POST", {
        postBody = "", 
        maxRetryCount = 0
    });
end;
