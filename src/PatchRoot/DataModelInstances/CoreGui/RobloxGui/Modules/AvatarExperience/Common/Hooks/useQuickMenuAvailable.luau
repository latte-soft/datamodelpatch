local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_Modules_0.AvatarExperience.Common.Enum.FullView);
local l_IsVRAppBuild_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).IsVRAppBuild;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local v7 = require(l_Modules_0.AvatarExperience.Common.Hooks.useAvatarRoute);
local l_GetFFlagEnableAppCommonInputHooks_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableAppCommonInputHooks;
local v9 = nil;
v9 = if not l_GetFFlagEnableAppCommonInputHooks_0() then require(l_CorePackages_0.Packages.ReactFocusNavigation).useLastInputMethod else require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils).useLastInputMethod;
return function()
    local l_name_0 = v7().opaque.name;
    local v12 = l_useSelector_0((v3.useCallback(function(v11)
        return v11.AvatarExperience.Common.FullView[l_name_0] == v4.SceneFullView;
    end, {
        l_name_0
    })));
    local v13 = v9() == "Gamepad";
    if not (v12 or l_IsVRAppBuild_0()) and v13 then
        return true;
    else
        return false;
    end;
end;
