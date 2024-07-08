local l_CoreGui_0 = game:GetService("CoreGui");
local v1 = require(game:GetService("CorePackages").RoactNavigation);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_Modules_0.AvatarExperience.AccessoryAdjustment.Components.AccessoryAdjustmentPage);
local v4 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
return v1.createRobloxStackNavigator({
    {
        [v4.AccessoryAdjustment] = {
            screen = v3
        }
    }, 
    {
        [v4.AdjustAccessoryView] = {
            screen = require(l_Modules_0.AvatarExperience.AccessoryAdjustment.Components.AdjustAccessoryView)
        }
    }
}, {
    defaultNavigationOptions = {
        overlayEnabled = true, 
        overlayTransparency = 1, 
        absorbInput = false
    }, 
    mode = v1.StackPresentationStyle.Default, 
    transitionConfig = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils).instantTransitionConfig
});
