local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v4 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v5 = require(l_CorePackages_0.Packages.t);
local v6 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local l_ItemTileEnums_0 = require(l_CorePackages_0.UIBlox).Tile.ItemTileEnums;
local v8 = require(l_Modules_0.AvatarExperience.Common.Utils);
local l_memoize_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).memoize;
local v10 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXGateUGC4ACollectibleAssetsBundles);
local v11 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXLimitedBundlesHandleNewData);
local v12 = {};
local v19 = l_memoize_0(function(v13)
    if v13 then
        if #v13 == 0 then
            return nil, nil;
        else
            local v14 = {};
            for _, v16 in v13, nil, nil do
                v14[v16] = true;
            end;
            local v17 = nil;
            local v18 = nil;
            if not v14[v6.ItemStatus.Sale] then
                if v14[v6.ItemStatus.New] then
                    v17 = l_ItemTileEnums_0.StatusStyle.Info;
                    v18 = v6.ItemStatusLocale.New;
                end;
                return v17, v18;
            else
                return l_ItemTileEnums_0.StatusStyle.Alert, v6.ItemStatusLocale.Sale;
            end;
        end;
    else
        return nil, nil;
    end;
end);
local v21 = l_memoize_0(function(v20)
    if v20 then
        if not v20[v6.ItemRestrictions.Limited] then
            if not v20[v6.ItemRestrictions.LimitedUnique] then
                if not v20[v6.ItemRestrictions.Collectible] then
                    return nil;
                else
                    return false;
                end;
            else
                return true;
            end;
        else
            return true;
        end;
    else
        return nil;
    end;
end);
local v24 = l_memoize_0(function(v22, v23)
    return (v23 and v23[v6.ItemRestrictions.Limited] or v23 and v23[v6.ItemRestrictions.Collectible]) or ((v23 and v23[v6.ItemRestrictions.LimitedUnique]) and v22) and v22 == 0;
end);
local v27 = l_memoize_0(function(v25, v26)
    if not v11() then
        return v26 ~= nil;
    elseif not v25 then
        return false;
    else
        return v25[v6.ItemRestrictions.Collectible] ~= nil;
    end;
end);
local v28 = nil;
if v10() then
    v28 = function(v29)
        return (v29 and v29[v6.ItemRestrictions.Limited] or v29 and v29[v6.ItemRestrictions.LimitedUnique]) or v29 and v29[v6.ItemRestrictions.Collectible];
    end;
end;
v12.fromOutfitInfo = l_memoize_0(function(v30)
    local v31 = {};
    for _, v33 in v30.assets, nil, nil do
        for v34, _ in v33, nil, nil do
            table.insert(v31, {
                id = v34, 
                type = v4.ItemType.Asset
            });
        end;
    end;
    return {
        itemType = v4.ItemType.Outfit, 
        itemId = v30.outfitId, 
        name = v30.name, 
        hasPremiumBenefits = false, 
        isPremiumExclusive = false, 
        isEditable = v30.isEditable, 
        hasAttribution = not not v30.creatingUniverseId or false, 
        updateCounter = v30.updateCounter, 
        itemSubType = v30.outfitType, 
        itemIconType = v8.getItemIconTypeFromOutfit(v30), 
        includedItems = v31, 
        outfitInfo = v30
    };
end);
v12.fromAssetInfo = l_memoize_0(function(v36)
    local v37, v38 = v19(v36.itemStatus);
    local v39 = v36.premiumPricing ~= nil;
    return {
        itemType = v4.ItemType.Asset, 
        itemId = v36.id, 
        name = v36.name, 
        description = v36.description, 
        hasPremiumBenefits = v39, 
        isPremiumExclusive = v39 and v36.priceInRobux == nil, 
        isEditable = false, 
        itemSubType = v36.assetType, 
        priceInRobux = v36.priceInRobux, 
        productId = v36.product and v36.product.id, 
        collectibleItemId = v36.collectibleItemId, 
        statusStyle = v37, 
        statusText = v38, 
        resellerUserAssetIds = v36.resellerUserAssetIds, 
        receivedCatalogData = v36.receivedCatalogData, 
        lowestPrice = v36.lowestPrice, 
        premiumPricing = v36.premiumPricing, 
        isOwned = v36.isOwned, 
        isTradeable = v21(v36.itemRestrictions), 
        isResellable = v24(v36.numberRobloxHasAvailable, v36.itemRestrictions), 
        hasLimitedQuantity = if not v10() then nil else v28(v36.itemRestrictions), 
        hasAttribution = not not v36.creatingUniverseId or false, 
        expectedSellerId = v36.expectedSellerId, 
        creator = v36.creator, 
        receivedRecommendedData = v36.receivedRecommendedData, 
        recommendedItemSummaries = v36.recommendedItemSummaries, 
        favoriteCount = v36.favoriteCount, 
        soldCount = v36.soldCount, 
        totalQuantity = v36.totalQuantity, 
        originalPrice = v36.originalPrice, 
        averagePrice = v36.averagePrice, 
        creatingUniverseId = v36.creatingUniverseId, 
        isForRent = v36.isForRent, 
        isPurchasable = v36.isPurchasable, 
        isLimitedCollectible = v27(v36.itemRestrictions, v36.collectibleItemId), 
        assetInfo = v36
    };
end);
v12.fromBundleInfo = l_memoize_0(function(v40)
    local v41, v42 = v19(v40.itemStatus);
    local v43 = if not v10() then nil else v28(v40.itemRestrictions);
    local v44 = if not v11() then nil else v40.collectibleItemId;
    local v45 = false;
    if v44 ~= nil then
        v45 = v43;
    end;
    return {
        itemType = v4.ItemType.Bundle, 
        itemId = v40.id, 
        name = v40.name, 
        description = v40.description, 
        hasPremiumBenefits = false, 
        isPremiumExclusive = false, 
        isEditable = false, 
        itemSubType = v40.bundleType, 
        priceInRobux = v40.priceInRobux, 
        productId = v40.product and v40.product.id, 
        statusStyle = v41, 
        statusText = v42, 
        receivedCatalogData = v40.receivedCatalogData, 
        lowestPrice = v40.lowestPrice, 
        isOwned = v40.isOwned, 
        isTradeable = v21(v40.itemRestrictions), 
        isResellable = v24(v40.numberRobloxHasAvailable, v40.itemRestrictions), 
        hasLimitedQuantity = v43, 
        itemIconType = l_ItemTileEnums_0.ItemIconType.Bundle, 
        expectedSellerId = v40.expectedSellerId, 
        creator = v40.creator, 
        receivedRecommendedData = v40.receivedRecommendedData, 
        recommendedItemSummaries = v40.recommendedItemSummaries, 
        favoriteCount = v40.favoriteCount, 
        includedItems = v40.items, 
        isForRent = v40.isForRent, 
        isPurchasable = v40.isPurchasable, 
        isLimitedBundle = v45, 
        collectibleItemId = v44, 
        isLimitedCollectible = v27(v40.itemRestrictions, v40.collectibleItemId), 
        bundleInfo = v40
    };
end);
v12.Validator = v5.strictInterface({
    itemType = v5.string, 
    itemId = v5.optional(v5.string), 
    name = v5.optional(v5.string), 
    description = v5.optional(v5.string), 
    itemSubType = v5.optional(v5.string), 
    priceInRobux = v5.optional(v5.number), 
    productId = v5.optional(v5.string), 
    collectibleItemId = v5.optional(v5.string), 
    statusStyle = v5.optional(v5.string), 
    statusText = v5.optional(v5.string), 
    resellerUserAssetIds = v5.optional(v5.table), 
    lowestPrice = v5.optional(v5.number), 
    premiumPricing = v5.optional(v5.table), 
    tileRestrictionsMap = v5.optional(v5.table), 
    updateCounter = v5.optional(v5.number), 
    itemIconType = v5.optional(v5.userdata), 
    expectedSellerId = v5.optional(v5.string), 
    creator = v5.optional(v5.table), 
    recommendedItemSummaries = v5.optional(v5.table), 
    favoriteCount = v5.optional(v5.number), 
    includedItems = v5.optional(v5.table), 
    soldCount = v5.optional(v5.number), 
    totalQuantity = v5.optional(v5.number), 
    originalPrice = v5.optional(v5.number), 
    averagePrice = v5.optional(v5.number), 
    creatingUniverseId = v5.optional(v5.string), 
    hasAttribution = v5.optional(v5.boolean), 
    hasLimitedQuantity = if not v10() then nil else v5.optional(v5.boolean), 
    hasPremiumBenefits = v5.optional(v5.boolean), 
    isEditable = v5.optional(v5.boolean), 
    isForRent = v5.optional(v5.boolean), 
    isLimitedCollectible = v5.optional(v5.boolean), 
    isLimitedBundle = v5.optional(v5.boolean), 
    isOwned = v5.optional(v5.boolean), 
    isPremiumExclusive = v5.optional(v5.boolean), 
    isPurchasable = v5.optional(v5.boolean), 
    isResellable = v5.optional(v5.boolean), 
    isTradeable = v5.optional(v5.boolean), 
    receivedCatalogData = v5.optional(v5.boolean), 
    receivedRecommendedData = v5.optional(v5.boolean), 
    assetInfo = v5.optional(v5.table), 
    bundleInfo = v5.optional(v5.table), 
    outfitInfo = v5.optional(v5.table)
});
return v12;
