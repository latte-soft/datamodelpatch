local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.tutils);
local l_MockId_0 = require(l_CorePackages_0.Workspace.Packages.UnitTestHelpers).MockId;
local l_ItemTileEnums_0 = require(l_CorePackages_0.UIBlox).Tile.ItemTileEnums;
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v6 = require(l_Modules_0.AvatarExperience.Common.Constants);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v8 = require(script.Parent.ModelsUtils);
local v9 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXLimitedBundlesHandleNewData);
local v10 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXFixRecommendedItemCollectibles);
local v11 = game:DefineFastFlag("FixEmptyLimitedBadgesForBundles", false);
local v13 = {
    mock = function()
        local v12 = {
            receivedCatalogData = false, 
            receivedRecommendedData = false, 
            receivedFromRecommendedData = false, 
            name = "", 
            description = "", 
            bundleType = "", 
            id = "", 
            items = {}, 
            creator = {
                id = l_MockId_0(), 
                name = "", 
                type = "", 
                hasVerifiedBadge = false
            }, 
            priceInRobux = 1, 
            isPublicDomain = true, 
            product = {
                id = l_MockId_0(), 
                type = "", 
                isForSale = true
            }, 
            recommendedItemSummaries = {}, 
            favoriteCount = 0, 
            priceStatus = "", 
            itemRestrictions = {}, 
            itemStatus = {}, 
            lowestPrice = nil, 
            numberRobloxHasAvailable = nil, 
            isForRent = false, 
            isOwned = false, 
            isPurchasable = false, 
            expectedSellerId = l_MockId_0()
        };
        if v9() then
            v12.collectibleItemId = "0";
            v12.totalQuantity = nil;
            v12.soldCount = 0;
            v12.averagePrice = 0;
            v12.originalPrice = 0;
            v12.premiumPricing = nil;
        end;
        return v12;
    end
};
local function v16(v14)
    local _ = nil;
    if v14 == Enum.BundleType.BodyParts.Name then
        return v6.BundleTypeIdStrings.BodyParts;
    elseif v14 == "AvatarAnimaions" then
        return v6.BundleTypeIdStrings.Animations;
    elseif v14 == Enum.BundleType.Animations.Name then
        return v6.BundleTypeIdStrings.Animations;
    elseif v14 == Enum.BundleType.DynamicHead.Name then
        return v6.BundleTypeIdStrings.DynamicHead;
    elseif v14 == Enum.BundleType.Shoes.Name then
        return v6.BundleTypeIdStrings.Shoes;
    else
        return (tostring(v14));
    end;
end;
v13.fromGetRecommendedItemsDataV2 = function(v17, v18)
    local v19 = nil;
    if not v10() then
        v19 = v2.deepCopy(v18 or {});
        v19.receivedFromRecommendedData = true;
        v19.name = v17.name;
        v19.id = tostring(v17.id);
        v19.description = v17.description;
        v19.creator = {
            id = tostring(v17.creatorTargetId), 
            name = v17.creatorName, 
            type = v17.creatorType, 
            hasVerifiedBadge = v17.creatorHasVerifiedBadge
        };
        v19.itemType = v17.itemType;
        v19.bundleType = tostring(v17.bundleType);
        v19.product = {
            id = tostring(v17.productId)
        };
        v19.priceInRobux = v17.price;
        v19.favoriteCount = v17.favoriteCount;
        return v19;
    else
        v19 = v8.DEPRECATED_itemDataFromBundleInfo(v17, v16(v17.bundleType), v18);
        v19.receivedFromRecommendedData = true;
        return v19;
    end;
end;
v13.fromHydrateWidgetInfo = function(v20, v21)
    local v22 = v2.deepCopy(v21 or {});
    v22.id = tostring(v20.id);
    if not v20.failedToHydrate then
        v22.name = v20.name;
        if v20.creatorName then
            v22.creator = {
                name = v20.creatorName
            };
        end;
        v22.bundleType = v16(v20.bundleType);
        v22.priceInRobux = v20.price;
        v22.receivedWidgetHydration = true;
        local v23 = if not v11 then {} else nil;
        if not (not (v20.isLimited or v20.isLimitedUnique) and not v20.isCollectible) then
            v23 = {
                [l_ItemTileEnums_0.Restriction.Limited] = not not v20.isLimited or false, 
                [l_ItemTileEnums_0.Restriction.LimitedUnique] = not not v20.isLimitedUnique or false, 
                [l_ItemTileEnums_0.Restriction.Collectible] = not not v20.isCollectible or false
            };
        end;
        v22.tileRestrictionsMap = v23;
        return v22;
    else
        v22.failedToHydrate = true;
        return v22;
    end;
end;
v13.fromGetCatalogItemData = function(v24, v25)
    local v26 = nil;
    if not v9() then
        v26 = v2.deepCopy(v25 or {});
        v26.receivedCatalogData = true;
        v26.id = tostring(v24.id);
        v26.itemType = v24.itemType;
        v26.bundleType = v16(v24.bundleType);
        v26.name = v24.name;
        v26.description = v24.description;
        v26.product = {
            id = tostring(v24.productId)
        };
        v26.genres = v24.genres;
        v26.creator = {
            id = tostring(v24.creatorTargetId), 
            name = v24.creatorName, 
            type = v24.creatorType, 
            hasVerifiedBadge = v24.creatorHasVerifiedBadge
        };
        v26.priceInRobux = v24.price;
        v26.favoriteCount = v24.favoriteCount;
        v26.itemStatus = v24.itemStatus;
        local v27, v28 = v8.CreateRestrictionInfo(v24.itemRestrictions);
        v26.itemRestrictions = v27;
        v26.tileRestrictionsMap = v28;
        v26.lowestPrice = v24.lowestPrice;
        v26.priceStatus = v24.priceStatus;
        v26.numberRobloxHasAvailable = v24.unitsAvailableForConsumption or v24.numberRobloxHasAvailable;
        v26.isForRent = v24.isForRent;
        v26.isOwned = v24.owned;
        v26.isPurchasable = v24.isPurchasable;
        v26.expectedSellerId = tostring(v24.expectedSellerId);
        v27 = {};
        if v24.bundledItems then
            for _, v30 in v24.bundledItems, nil, nil do
                table.insert(v27, {
                    id = tostring(v30.id), 
                    type = v30.type
                });
            end;
            v26.items = v27;
        end;
        return v26;
    else
        v26 = v8.DEPRECATED_itemDataFromBundleInfo(v24, v16(v24.bundleType), v25);
        v26.receivedCatalogData = true;
        return v26;
    end;
end;
v13.fromRecommendedItemSummaries = function(v31, v32)
    local v33 = v2.deepCopy(v32 or {});
    v33.receivedRecommendedData = true;
    v33.recommendedItemSummaries = v31;
    return v33;
end;
v13.fromSortResults = function(v34, v35)
    local v36 = nil;
    if not v9() then
        v36 = v2.deepCopy(v35 or {});
        v36.receivedFromSortResults = true;
        v36.id = tostring(v34.id);
        v36.bundleType = v16(v34.bundleType);
        v36.name = v34.name;
        v36.description = v34.description;
        v36.product = {
            id = tostring(v34.productId)
        };
        v36.genres = v34.genres;
        v36.creator = {
            id = tostring(v34.creatorTargetId), 
            name = v34.creatorName, 
            type = v34.creatorType, 
            hasVerifiedBadge = v34.creatorHasVerifiedBadge
        };
        v36.priceInRobux = v34.price;
        v36.lowestPrice = v34.lowestPrice;
        v36.favoriteCount = v34.favoriteCount;
        v36.itemStatus = v34.itemStatus;
        if v34.itemRestrictions then
            local v37 = {};
            for _, v39 in v34.itemRestrictions, nil, nil do
                v37[v39] = true;
            end;
            v36.itemRestrictions = v37;
        end;
        v36.priceStatus = v34.priceStatus;
        v36.numberRobloxHasAvailable = v34.unitsAvailableForConsumption or v34.numberRobloxHasAvailable;
        return v36;
    else
        v36 = v8.DEPRECATED_itemDataFromBundleInfo(v34, v16(v34.bundleType), v35);
        v36.receivedFromSortResults = true;
        return v36;
    end;
end;
v13.fromIsOwned = function(v40, v41)
    local v42 = v2.deepCopy(v41 or {});
    v42.isOwned = v40;
    return v42;
end;
return v13;
