local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.RoactNavigation);
local v4 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarExperienceMainStackContainer);
local v5 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local v6 = require(l_CorePackages_0.Workspace.Packages.TenFootUiCommon);
return v3.createRobloxStackNavigator({
    {
        [v5.AvatarExperienceMainStackNavigator] = {
            screen = v4, 
            navigationOptions = function(v7)
                return {
                    overlayTransparency = 1, 
                    absorbInput = false, 
                    backButtonAction = v3.getActiveChildNavigationOptions(v7.navigation).backButtonAction
                };
            end
        }
    }
}, {
    defaultNavigationOptions = {
        overlayEnabled = true, 
        absorbInput = true, 
        screenKind = v6.TenFootUiRNTypes.ScreenKind.FullScreen, 
        globalNavDisplayOption = v6.TenFootUiRNTypes.GlobalNavDisplayOption.HideAll
    }, 
    mode = v3.StackPresentationStyle.Modal
});
