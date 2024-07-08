local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_RoactNavigation_0 = v1.RoactNavigation;
return (l_RoactNavigation_0.createRobloxSwitchNavigator({
    {
        [v1.SocialModalsCommon.EnumScreens.DiscoverabilityOverlay] = require(l_Parent_0.Components.DiscoverabilityOverlay)
    }
}, {
    defaultNavigationOptions = {
        overlayEnabled = true, 
        absorbInput = true, 
        overlayTransparency = 1
    }, 
    mode = l_RoactNavigation_0.StackPresentationStyle.Modal
}));
