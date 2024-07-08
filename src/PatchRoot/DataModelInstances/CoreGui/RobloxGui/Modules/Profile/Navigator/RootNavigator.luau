local l_script_FirstAncestor_0 = script:FindFirstAncestor("Profile");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_RoactNavigation_0 = v1.RoactNavigation;
local v3 = require(l_script_FirstAncestor_0.Common.ProfileScreens);
return (l_RoactNavigation_0.createRobloxStackNavigator({
    {
        [v3.ProfilePeekView] = {
            screen = require(l_script_FirstAncestor_0.Components.ProfilePeekView), 
            navigationOptions = {}
        }
    }, 
    {
        [v3.ContextualMenu] = {
            screen = require(l_script_FirstAncestor_0.Components.ProfileContextualMenuOverlay), 
            navigationOptions = {}
        }
    }, 
    {
        [v3.GenericToast] = {
            screen = v1.SocialLibraries.Components.ToastScreen, 
            navigationOptions = {}
        }
    }, 
    {
        [v3.PurchaseExperienceModal] = {
            screen = require(l_script_FirstAncestor_0.Components.PurchaseExperienceModal), 
            navigationOptions = {
                overlayEnabled = true, 
                overlayTransparency = 0.5, 
                absorbInput = true, 
                renderUnderlyingPage = true
            }
        }
    }, 
    {
        [v3.UnableToJoinExperienceModal] = {
            screen = require(l_script_FirstAncestor_0.Components.UnableToJoinExperienceModal), 
            navigationOptions = {
                overlayEnabled = true, 
                overlayTransparency = 0.5, 
                absorbInput = true, 
                renderUnderlyingPage = true
            }
        }
    }, 
    {
        [v3.SetAliasModal] = {
            screen = v1.SetAlias.SetAliasModal, 
            navigationOptions = {
                overlayEnabled = true, 
                overlayTransparency = 0.5, 
                absorbInput = true, 
                renderUnderlyingPage = true
            }
        }
    }, 
    {
        [v3.EditProfilePage] = {
            screen = v1.EditProfile.EditProfilePage, 
            navigationOptions = {
                overlayEnabled = true, 
                overlayTransparency = 0.5, 
                absorbInput = true, 
                renderUnderlyingPage = true
            }
        }
    }, 
    {
        [v3.EditDisplayNameModal] = {
            screen = v1.EditProfile.EditDisplayNameModal, 
            navigationOptions = {
                overlayEnabled = true, 
                overlayTransparency = 0.5, 
                absorbInput = true, 
                renderUnderlyingPage = true
            }
        }
    }, 
    {
        [v3.EditDescriptionModal] = {
            screen = v1.EditProfile.EditDescriptionModal, 
            navigationOptions = {
                overlayEnabled = true, 
                overlayTransparency = 0.5, 
                absorbInput = true, 
                renderUnderlyingPage = true
            }
        }
    }, 
    {
        [v3.EditDisplayNameErrorModal] = {
            screen = v1.EditProfile.EditDisplayNameErrorModal, 
            navigationOptions = {
                overlayEnabled = true, 
                overlayTransparency = 0.5, 
                absorbInput = true, 
                renderUnderlyingPage = true
            }
        }
    }, 
    {
        [v3.UsernameInsufficientFundsModal] = {
            screen = v1.EditProfile.UsernameInsufficientFundsModal, 
            navigationOptions = {
                overlayEnabled = true, 
                overlayTransparency = 0.5, 
                absorbInput = true, 
                renderUnderlyingPage = true
            }
        }
    }
}, {
    mode = l_RoactNavigation_0.StackPresentationStyle.Overlay, 
    defaultNavigationOptions = {
        overlayEnabled = true, 
        overlayTransparency = 1, 
        absorbInput = false, 
        renderUnderlyingPage = true
    }
}));
