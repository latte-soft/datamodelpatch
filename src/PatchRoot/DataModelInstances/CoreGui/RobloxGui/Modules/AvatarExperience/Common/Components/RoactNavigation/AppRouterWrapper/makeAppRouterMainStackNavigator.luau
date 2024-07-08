local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.RoactNavigation);
local v3 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.createAvatarExperienceStackNavigator);
local v4 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AppRouterWrapper.buildMainStackConfigTable);
return function(v5)
    return (v3(v4(v5), {
        mode = v2.StackPresentationStyle.Overlay, 
        defaultNavigationOptions = {
            overlayEnabled = true, 
            overlayTransparency = 1, 
            absorbInput = false, 
            renderUnderlyingPage = true
        }
    }));
end;
