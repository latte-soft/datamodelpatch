local l_CoreGui_0 = game:GetService("CoreGui");
local v1 = require(game:GetService("CorePackages").RoactNavigation);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AccessoryAdjustmentStackNavigator);
local v4 = require(l_Modules_0.AvatarExperience.Common.Components.Refinement.AvatarRefinement);
local v5 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
return v1.createRobloxSwitchNavigator({
    {
        [v5.AvatarRefinement] = v4
    }, 
    {
        [v5.AccessoryAdjustmentStackNavigator] = v3
    }, 
    {
        [v5.LayeredClothingSortStackNavigator] = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.LayeredClothingSortStackNavigator)
    }
}, {
    backBehavior = v1.BackBehavior.History, 
    defaultNavigationOptions = {
        overlayEnabled = true, 
        overlayTransparency = 1, 
        absorbInput = false, 
        renderUnderlyingPage = false, 
        isTransparent = true
    }, 
    mode = v1.StackPresentationStyle.Default
});
