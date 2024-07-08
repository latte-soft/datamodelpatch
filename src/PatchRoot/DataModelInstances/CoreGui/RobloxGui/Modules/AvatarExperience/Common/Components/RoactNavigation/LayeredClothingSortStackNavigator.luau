local l_CoreGui_0 = game:GetService("CoreGui");
local v1 = require(game:GetService("CorePackages").RoactNavigation);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
return v1.createRobloxStackNavigator({
    {
        [require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen).LayeredClothingSort] = {
            screen = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Components.LayeredClothingSortPage)
        }
    }
}, {
    defaultNavigationOptions = {
        overlayEnabled = true, 
        overlayTransparency = 1, 
        absorbInput = false
    }, 
    mode = v1.StackPresentationStyle.Default
});
