local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.RoactNavigation);
local l_createNavigator_0 = v1.createNavigator;
local l_RobloxStackView_0 = v1.RobloxStackView;
local l_LuaAppStackRouter_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppNavigation).LuaAppStackRouter;
return function(v5, v6)
    return l_createNavigator_0(l_RobloxStackView_0, l_LuaAppStackRouter_0(v5, v6), v6 or {});
end;
