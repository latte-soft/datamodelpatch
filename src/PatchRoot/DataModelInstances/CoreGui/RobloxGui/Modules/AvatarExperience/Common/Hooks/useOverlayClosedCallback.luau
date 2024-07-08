local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.Debug.logOnOverlayClosed);
local v5 = require(l_Modules_0.AvatarExperience.Common.Hooks.useAvatarRoute);
local l_GetFFlagEnableAppCommonInputHooks_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableAppCommonInputHooks;
local v7 = nil;
v7 = if not l_GetFFlagEnableAppCommonInputHooks_0() then require(l_CorePackages_0.Packages.ReactFocusNavigation).useLastInputMethod else require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils).useLastInputMethod;
return function(v8)
    local l_name_0 = v5().opaque.name;
    local v10 = v7() == "Gamepad";
    return (v3.useCallback(function()
        local l_v10_0 = v10;
        v4(l_name_0, l_v10_0);
        if not (not l_v10_0 or not v8) then
            v8.captureFocus();
        end;
    end, {
        v10, 
        l_name_0, 
        v8
    }));
end;
