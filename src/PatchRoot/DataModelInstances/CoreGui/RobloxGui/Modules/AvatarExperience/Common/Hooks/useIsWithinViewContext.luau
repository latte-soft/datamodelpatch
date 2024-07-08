local l_CoreGui_0 = game:GetService("CoreGui");
local v1 = require(game:GetService("CorePackages").Packages.React);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_Modules_0.AvatarExperience.Common.Hooks.useAvatarRoute);
local v4 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
return function(v5)
    local v6, v7 = v1.useState(false);
    local v8 = v3();
    v1.useEffect(function()
        v7((v4.isWithinViewContext(v8, v5)));
    end, {
        v8
    });
    return v6;
end;
