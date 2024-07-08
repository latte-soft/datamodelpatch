local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local v2 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.ItemDetailsScreen);
local v3 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.AssetManagement.OutfitDetailsScreen);
local v4 = require(l_Modules_0.AvatarExperience.Catalog.Components.Resellers.ResellersPage);
local v5 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.SellPage.SellPage);
local v6 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.ItemOwnershipPage.ItemOwnershipPage);
local v7 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.SellPage.SellItemPeekView);
local v8 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.TryOnItemScreen);
local v9 = require(l_Modules_0.AvatarExperience.Common.Components.AvatarBackground);
local v10 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withStackVisibilityWrapper);
local v11 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXEnableOutfitAttribution);
local v12 = {
    [v1.ItemDetails] = v2, 
    [v1.ResellersPage] = v4, 
    [v1.SellItemPage] = v5, 
    [v1.TryOnItem] = v8, 
    [v1.ItemOwnershipPage] = v6, 
    [v1.SellItemPeekView] = v7, 
    [v1.AvatarBackground] = v10(v9)
};
if v11 then
    v12[v1.OutfitDetails] = v3;
end;
return v12;
