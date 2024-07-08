local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.React);
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.useNavigation;
local v5 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
return function(v6)
    local v7 = l_useNavigation_0();
    return (v3.useCallback(function()
        if v7 then
            v7.navigate(v5.AvatarExperienceQuickMenu, {
                onOverlayClosed = v6
            });
        end;
    end, {
        v6, 
        v7
    }));
end;
