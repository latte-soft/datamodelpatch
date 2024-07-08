local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v4 = require(l_Modules_0.LuaApp.Http.Requests.UserHeartbeats.PostUserHeartbeatsActionReport);
return function(v5, v6)
    return l_PerformFetch_0.Single("luaapp.userheartbeats.actionreport", function(_)
        return v4(v5, v6);
    end);
end;
