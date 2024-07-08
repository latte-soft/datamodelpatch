local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local v4 = require(l_CorePackages_0.Cryo);
local v5 = require(l_CorePackages_0.Packages.Dash);
local v6 = require(l_Modules_0.AvatarExperience.Common.Debug.LogTree).logger("ax.rn.screenprops");
local _ = require(l_Modules_0.AvatarExperience.Common.Constants);
local v8 = game:DefineFastFlag("AXEnableMultiTryOnUI", false);
local v9 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXEnableOutfitAttribution);
local v10 = {
    isTransparent = false, 
    coversSceneWhenExpanded = false, 
    isMultiTryOn = false, 
    isTryOnOutfitResetPage = false, 
    isRefinementPage = false, 
    refinementButtonVisible = false, 
    VRPanelRoundedCorners = false, 
    VRPanelPlacement = "Center"
};
local v11 = {
    [v3.AccessoryAdjustment] = {
        isRefinementPage = true, 
        isMultiTryOn = v8
    }, 
    [v3.AvatarExperienceLandingPage] = {
        isTryOnOutfitResetPage = true
    }, 
    [v3.AvatarExperienceRoot] = {}, 
    [v3.AvatarBackground] = {
        isTransparent = false
    }, 
    [v3.Catalog] = {
        refinementButtonVisible = true, 
        VRPanelPlacement = "None", 
        VRPanelRoundedCorners = true, 
        isMultiTryOn = v8
    }, 
    [v3.CatalogContextMenu] = {
        VRPanelPlacement = "Right"
    }, 
    [v3.CatalogSearch] = {
        refinementButtonVisible = true, 
        VRPanelPlacement = "None", 
        VRPanelRoundedCorners = true, 
        isMultiTryOn = v8
    }, 
    [v3.ItemDetails] = {
        isTransparent = true, 
        coversSceneWhenExpanded = true, 
        VRPanelPlacement = "Right", 
        VRPanelRoundedCorners = true
    }, 
    [v3.OutfitDetails] = if not v9 then nil else {
        isTransparent = true, 
        coversSceneWhenExpanded = true, 
        VRPanelPlacement = "Right", 
        VRPanelRoundedCorners = true
    }, 
    [v3.ItemOwnershipPage] = {
        isTransparent = true
    }, 
    [v3.CreateOrUpdateOutfitMenu] = {
        VRPanelPlacement = "Left"
    }, 
    [v3.LayeredClothingSort] = {
        isRefinementPage = true, 
        VRPanelPlacement = "Center", 
        isMultiTryOn = v8
    }, 
    [v3.LCSortContextMenu] = {
        VRPanelPlacement = "Right"
    }, 
    [v3.AvatarEditor] = {
        isTryOnOutfitResetPage = true, 
        refinementButtonVisible = true, 
        VRPanelPlacement = "None", 
        VRPanelRoundedCorners = true
    }, 
    [v3.AvatarRefinement] = {
        VRPanelPlacement = "Right", 
        VRPanelRoundedCorners = true
    }, 
    [v3.ManageOutfitPage] = {
        isTransparent = true
    }, 
    [v3.ProfilePictureEditorEmotes] = {
        isTryOnOutfitResetPage = true
    }, 
    [v3.ResellersPage] = {
        isTransparent = true
    }, 
    [v3.SellItemPage] = {
        isTransparent = true
    }, 
    [v3.SellItemPeekView] = {
        isTransparent = true
    }, 
    [v3.SortAndFilters] = {
        isTransparent = true, 
        VRPanelPlacement = "Left"
    }, 
    [v3.TryOnItem] = {
        isTransparent = false
    }, 
    [v3.TryOnManager] = {
        isTransparent = true
    }, 
    [v3.UpdateOutfitPage] = {
        isTransparent = true, 
        VRPanelPlacement = "Left", 
        VRPanelRoundedCorners = true
    }, 
    [v3.AdjustAccessoryView] = {
        isTransparent = false
    }
};
local v12 = {};
for _, v14 in v3, nil, nil do
    v12[v14] = v4.Dictionary.join(v10, v11[v14] or {});
end;
if v6.active[v6.Levels.Trace] then
    v6:trace("AvatarScreenProperties = {}", v5.pretty(v12, {
        multiline = true
    }));
end;
return v12;
