local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local _ = require(l_CorePackages_0.Workspace.Packages.Http);
local v4 = require(l_Modules_0.LuaApp.Components.Authentication.SingleSignOn.getSingleSignOnUrls);
local l_ConsoleAuthRequestWrapper_0 = require(l_CorePackages_0.Workspace.Packages.Http).Utils.ConsoleAuthRequestWrapper;
local v6 = require(l_Modules_0.LuaApp.Promise);
return function(v7)
    local l_disconnect_0 = v4().disconnect;
    if not l_disconnect_0 then
        return v6.reject({});
    else
        return l_ConsoleAuthRequestWrapper_0(v7, l_disconnect_0(), "POST", {
            postBody = "", 
            maxRetryCount = 0
        });
    end;
end;
