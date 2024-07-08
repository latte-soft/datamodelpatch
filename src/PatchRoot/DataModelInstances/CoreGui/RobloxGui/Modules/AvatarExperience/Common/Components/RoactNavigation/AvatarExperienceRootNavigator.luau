local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.RoactNavigation);
local v4 = require(l_CorePackages_0.Cryo);
local v5 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local v6 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.ModalPromptsStackNavigator);
local v7 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarPromptDescriptors);
local v8 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local v9 = require(l_CorePackages_0.Workspace.Packages.TenFootUiCommon);
return v3.createRobloxStackNavigator(v4.List.join({
    {
        [v5.ModalPromptsStackNavigator] = {
            screen = v6, 
            navigationOptions = function(v10)
                return {
                    overlayTransparency = 1, 
                    absorbInput = false, 
                    backButtonAction = v3.getActiveChildNavigationOptions(v10.navigation).backButtonAction
                };
            end
        }
    }
}, v7), {
    defaultNavigationOptions = {
        overlayEnabled = true, 
        absorbInput = false, 
        screenKind = v9.TenFootUiRNTypes.ScreenKind.FullScreen, 
        globalNavDisplayOption = v9.TenFootUiRNTypes.GlobalNavDisplayOption.HideAll
    }, 
    transitionConfig = v8.instantTransitionConfig, 
    mode = v3.StackPresentationStyle.Overlay
});
