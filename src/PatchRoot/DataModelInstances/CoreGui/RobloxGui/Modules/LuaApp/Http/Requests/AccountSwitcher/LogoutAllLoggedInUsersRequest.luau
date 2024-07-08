local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local _ = require(l_CorePackages_0.Workspace.Packages.Http);
local _ = require(l_CorePackages_0.Workspace.Packages.Http).Url;
local l_HttpService_0 = game:GetService("HttpService");
local v6 = require(l_Modules_0.LuaApp.Http.UrlBuilder);
return function(v7, v8)
    return v7(v6.fromString("apis:account-switcher/v1/logoutAllLoggedInUsers")(), "POST", {
        postBody = l_HttpService_0:JSONEncode({
            encrypted_users_data_blob = v8
        })
    });
end;
