local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Rodux);
local v3 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
return v2.createReducer("", {
    [require(l_Modules_0.LuaApp.Actions.Authentication.SetSignUpSelectedBundleId).name] = function(_, v5)
        local l_bundleId_0 = v5.bundleId;
        v3.isTypeOrNil(l_bundleId_0, "string", "action.bundleId from SetSignUpSelectedBundleId");
        return l_bundleId_0;
    end
});
