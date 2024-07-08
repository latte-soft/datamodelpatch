local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Cryo);
local v3 = require(l_CorePackages_0.RoactNavigation);
local v4 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local v5 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarPromptDescriptors);
local v6 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AppRouterWrapper.makeAppRouterMainStackNavigator);
local function v8(v7)
    return (v2.List.join({
        {
            [v4.AvatarExperienceMainStackNavigator] = v6(v7)
        }
    }, v5));
end;
return function(v9)
    return (v3.createRobloxStackNavigator(v8(v9), {
        mode = v3.StackPresentationStyle.Overlay, 
        defaultNavigationOptions = {
            absorbInput = false, 
            overlayEnabled = true, 
            overlayTransparency = 1
        }
    }));
end;
