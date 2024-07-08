local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CoreGui_0.RobloxGui.Modules.LuaApp.Actions.ClearUserSpecificData);
local l_HttpCanceller_0 = require(l_CorePackages_0.Workspace.Packages.Http).NetworkLayers.HttpCanceller;
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
return function()
    return function(v5)
        v5:dispatch(v2());
        l_HttpCanceller_0.cancel();
        l_PerformFetch_0.ClearOutstandingPromiseStatus();
    end;
end;
