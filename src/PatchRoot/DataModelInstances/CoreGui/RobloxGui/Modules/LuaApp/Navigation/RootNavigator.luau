local l_CorePackages_0 = game:GetService("CorePackages");
local l_createRootNavigator_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppNavigation).createRootNavigator;
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v3 = require(l_Modules_0.LuaApp.Navigation.getAppRoutes);
local v4 = require(l_Modules_0.LuaApp.Navigation.getSwitchRoutesArray);
local v5 = require(l_Modules_0.LuaApp.Navigation.wrapWithSwitchVisibility);
if require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagUnifyNavigationGraph then
    return v5(l_createRootNavigator_0(v3(), v4()));
else
    return nil;
end;
