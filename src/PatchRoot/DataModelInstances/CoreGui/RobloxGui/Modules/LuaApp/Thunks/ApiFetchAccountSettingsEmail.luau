local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_PerformFetch_0 = require(game:GetService("CorePackages").Workspace.Packages.Http).PerformFetch;
local v2 = require(l_Modules_0.LuaApp.Http.Requests.GetAccountSettingsEmail);
local v3 = require(l_Modules_0.LuaApp.Actions.SetEmailNotificationCount);
return function(v4)
    return l_PerformFetch_0.Single("luaapp.accountsettingsapi.email", function(v5)
        return v2(v4):andThen(function(v6)
            v5:dispatch(v3(v6.responseBody.verified == false and 1 or 0));
            return v6;
        end);
    end);
end;
