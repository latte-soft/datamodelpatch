local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.RoactNavigation);
local v5 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarExperienceRootContainer);
local v6 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.Debug.makeNavigationStateLogger);
local v7 = require(l_Modules_0.LuaApp.Thunks.SetNavigationLocked);
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local v9 = v4.createAppContainer(v5);
local v10 = v6("AvatarExperience");
return function(v11)
    local v12 = l_useDispatch_0();
    return v3.createElement(v9, {
        onNavigationStateChange = v3.useCallback(function(v13, v14, v15)
            v10(v13, v14, v15);
            if not v14.isTransitioning then
                v12(v7(false));
            end;
        end), 
        isVisible = v11.isVisible
    });
end;
