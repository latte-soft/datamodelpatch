local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_RoactNavigation_0 = v1.RoactNavigation;
return (l_RoactNavigation_0.createRobloxStackNavigator({
    {
        ModalStackNavigator = {
            screen = require(l_script_FirstAncestor_0.Navigator.ModalStackNavigator), 
            navigationOptions = {
                transparent = true, 
                absorbInputSelectable = false
            }
        }
    }, 
    {
        [require(l_script_FirstAncestor_0.EnumScreens).GenericToast] = {
            screen = v1.SocialLibraries.Components.ToastScreen, 
            navigationOptions = {
                overlayEnabled = true, 
                overlayTransparency = 1, 
                absorbInput = false, 
                renderUnderlyingPage = true
            }
        }
    }
}, {
    mode = l_RoactNavigation_0.StackPresentationStyle.Overlay
}));
