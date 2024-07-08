local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.RoactNavigation);
local l_Components_0 = l_Modules_0.AvatarExperience.Common.Components;
local v5 = require(l_Components_0.RoactNavigation.AvatarScreen);
local v6 = require(l_Components_0.RoactNavigation.BackButtonAction);
local v7 = require(l_Components_0.RoactNavigation.LandingPageSwitchNavigator);
local v8 = require(l_Components_0.ItemDetails.ItemDetailsScreen);
local v9 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.AssetManagement.OutfitDetailsScreen);
local v10 = require(l_Components_0.RoactNavigation.createAvatarExperienceStackNavigator);
local v11 = require(l_Components_0.AvatarBackground);
local v12 = require(l_Components_0.RoactNavigation.AvatarRefinementSwitchNavigator);
local v13 = require(l_Components_0.ItemDetails.SellPage.SellPage);
local v14 = require(l_Components_0.ItemDetails.ItemOwnershipPage.ItemOwnershipPage);
local v15 = require(l_Components_0.ItemDetails.SellPage.SellItemPeekView);
local l_Components_1 = l_Modules_0.AvatarExperience.Catalog.Components;
local v17 = require(l_Components_1.Search.CatalogSearchPage);
local v18 = require(l_Components_1.Resellers.ResellersPage);
local v19 = require(l_Components_1.TryOnManager.TryOnManagerScreen);
local l_Components_2 = l_Modules_0.AvatarExperience.ProfilePictureEditor.Components;
local v21 = require(l_Components_2.ProfilePictureEditorCameraPage);
local v22 = require(l_Components_2.ProfilePictureEditorFinalPage);
local l_Components_3 = l_Modules_0.AvatarExperience.AvatarEditor.Components;
local v24 = require(l_Components_3.AssetManagement.UpdateOutfitPage);
local v25 = require(l_Components_3.AssetManagement.ManageOutfitPage);
local v26 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Components.LayeredClothingSortPage);
local v27 = require(l_Components_1.Filters.SortAndFiltersScreen);
local v28 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAccessoryAdjustmentEnabled);
local v29 = require(l_CorePackages_0.Workspace.Packages.TenFootUiCommon);
local l_ScreenKind_0 = v29.TenFootUiRNTypes.ScreenKind;
local l_GlobalNavDisplayOption_0 = v29.TenFootUiRNTypes.GlobalNavDisplayOption;
local v32 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXEnableOutfitAttribution);
local v33 = game:DefineFastFlag("AXEnabledShowLeftNavBarForDesktopAndVR1", false);
local v34 = nil;
local v35 = nil;
if v33 then
    local l_Platform_0 = game:GetService("UserInputService"):GetPlatform();
    local v37 = true;
    if l_Platform_0 ~= Enum.Platform.Windows then
        v37 = true;
        if l_Platform_0 ~= Enum.Platform.OSX then
            v37 = l_Platform_0 == Enum.Platform.Linux;
        end;
    end;
    v34 = v37;
    v35 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).IsVRAppBuild;
end;
local v40 = {
    {
        [v5.LandingPageSwitchNavigator] = {
            screen = v7, 
            navigationOptions = function(v38)
                local v39 = v3.getActiveChildNavigationOptions(v38.navigation);
                return {
                    tabBarVisible = v39.tabBarVisible, 
                    backButtonAction = v39.backButtonAction
                };
            end
        }
    }, 
    {
        [v5.AvatarBackground] = {
            screen = v11, 
            navigationOptions = {
                backButtonAction = v6.NoOp
            }
        }
    }, 
    {
        [v5.ItemDetails] = v8
    }, 
    {
        [v5.CatalogSearch] = v17
    }, 
    {
        [v5.SellItemPage] = v13
    }, 
    {
        [v5.ResellersPage] = v18
    }, 
    {
        [v5.UpdateOutfitPage] = v24
    }, 
    {
        [v5.ManageOutfitPage] = v25
    }, 
    {
        [v5.ProfilePictureEditorCamera] = v21
    }, 
    {
        [v5.ProfilePictureEditorFinal] = v22
    }, 
    {
        [v5.SortAndFilters] = v27
    }, 
    {
        [v5.TryOnManager] = v19
    }, 
    {
        [v5.ItemOwnershipPage] = v14
    }, 
    {
        [v5.SellItemPeekView] = v15
    }
};
if v28() then
    table.insert(v40, {
        [v5.AvatarRefinementSwitchNavigator] = {
            screen = v12
        }
    });
end;
if not v28() then
    table.insert(v40, {
        [v5.LayeredClothingSort] = v26
    });
end;
if v32 then
    table.insert(v40, {
        [v5.OutfitDetails] = v9
    });
end;
local v41 = false;
if not (not v33 or not v34 and not v35()) then
    v41 = true;
end;
return v10(v40, {
    defaultNavigationOptions = {
        overlayEnabled = true, 
        overlayTransparency = 1, 
        absorbInput = false, 
        tabBarVisible = v41, 
        screenKind = l_ScreenKind_0.FullScreen, 
        globalNavDisplayOption = l_GlobalNavDisplayOption_0.HideAll
    }, 
    mode = v3.StackPresentationStyle.Overlay
});
