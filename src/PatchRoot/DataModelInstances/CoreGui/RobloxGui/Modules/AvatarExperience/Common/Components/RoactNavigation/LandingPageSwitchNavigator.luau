local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.RoactNavigation);
local v4 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local v5 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.AvatarEditorPage);
local v6 = require(l_Modules_0.AvatarExperience.Catalog.Components.CatalogPage);
local v7 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.Components.ProfilePictureEditorEmotesPage);
local v8 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.BackButtonAction);
local v9 = require(l_Modules_0.AvatarExperience.Common.Components.LandingPage);
local v10 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.createPreloadingSwitchNavigator);
local l_IsVRAppBuild_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).IsVRAppBuild;
local v12 = require(l_CorePackages_0.Workspace.Packages.TenFootUiCommon);
local l_ScreenKind_0 = v12.TenFootUiRNTypes.ScreenKind;
local l_GlobalNavDisplayOption_0 = v12.TenFootUiRNTypes.GlobalNavDisplayOption;
local v15 = require(l_Modules_0.AvatarExperience.Common.Util.IXPUtils);
local v16 = require(l_Modules_0.AvatarExperience.Flags.AXAlternateLandingPageIXP);
local l_FFlagAvatarAndroidBackButton_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAvatarAndroidBackButton;
return v10({
    {
        [v4.AvatarExperienceLandingPage] = {
            screen = v9, 
            navigationOptions = {
                alwaysRendered = not l_IsVRAppBuild_0(), 
                tabBarVisible = true, 
                backButtonAction = v8.Unhandled, 
                screenKind = l_ScreenKind_0.Default, 
                globalNavDisplayOption = l_GlobalNavDisplayOption_0.ShowAll
            }
        }
    }, 
    {
        [v4.AvatarEditor] = {
            screen = v5, 
            navigationOptions = {
                alwaysRendered = not l_IsVRAppBuild_0()
            }
        }
    }, 
    {
        [v4.Catalog] = {
            screen = v6, 
            navigationOptions = {
                alwaysRendered = not l_IsVRAppBuild_0()
            }
        }
    }, 
    {
        [v4.ProfilePictureEditorEmotes] = v7
    }
}, {
    backBehavior = v3.BackBehavior.InitialRoute, 
    defaultNavigationOptions = function(v18)
        local v19 = {
            overlayEnabled = true, 
            overlayTransparency = 1, 
            absorbInput = false, 
            screenKind = l_ScreenKind_0.FullScreen, 
            globalNavDisplayOption = l_GlobalNavDisplayOption_0.HideAll
        };
        if v15.readTestVariable(v16.EnabledForUser) then
            local l_key_0 = v18.navigation.state.key;
            v19.backButtonAction = if not (l_key_0 ~= "AvatarEditor") or l_key_0 == "Catalog" then if not l_FFlagAvatarAndroidBackButton_0 then v8 else v8.NoOp else nil;
        end;
        return v19;
    end, 
    keepVisitedScreensMounted = not l_IsVRAppBuild_0()
});
