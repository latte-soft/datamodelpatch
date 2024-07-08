local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local l_MockId_0 = require(l_CorePackages_0.Workspace.Packages.UnitTestHelpers).MockId;
local l_ItemTileEnums_0 = require(l_CorePackages_0.UIBlox).Tile.ItemTileEnums;
local v5 = require(l_CorePackages_0.Packages.tutils);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v8 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v9 = require(script.Parent.ModelsUtils);
local v10 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXLimitedBundlesHandleNewData);
local v11 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXFixRecommendedItemCollectibles);
local v12 = game:DefineFastFlag("FixEmptyLimitedBadges", false);
return {
    mock = function()
        local v13 = {
            receivedCatalogData = false, 
            receivedRecommendedData = false, 
            receivedFromRecommendedData = false, 
            receivedFromBundleItemData = false, 
            receivedFromInventoryFetch = false, 
            receivedFromOutfitDetails = false, 
            receivedFromResaleData = false, 
            receivedFromVersionData = false, 
            name = "", 
            description = "", 
            creatorName = "", 
            assetType = v8.AssetTypeIdStrings.Hat, 
            id = l_MockId_0(), 
            priceInRobux = 1, 
            creator = {
                id = l_MockId_0(), 
                name = "", 
                type = "", 
                targetId = "", 
                hasVerifiedBadge = false
            }, 
            created = "", 
            updated = "", 
            genres = {}, 
            minimumMembershipLevel = 0, 
            premiumPricing = nil, 
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
            totalQuantity = nil, 
            resellerUserAssetIds = {}, 
            soldCount = 0, 
            averagePrice = 0, 
            originalPrice = 0, 
            isForRent = false, 
            isOwned = false, 
            isPurchasable = false, 
            expectedSellerId = l_MockId_0(), 
            creatingUniverseId = nil
        };
        if v10() then
            v13.collectibleItemId = "0";
        end;
        return v13;
    end, 
    fromRecommendedItemSummaries = function(v14, v15)
        local v16 = v5.deepCopy(v15 or {});
        v16.receivedRecommendedData = true;
        v16.recommendedItemSummaries = v14;
        return v16;
    end, 
    fromGetRecommendedItemsDataV2 = function(v17, v18, v19)
        local v20 = nil;
        if not v11() then
            v20 = v5.deepCopy(v19 or {});
            v20.receivedFromRecommendedData = true;
            v20.name = v17.name;
            v20.id = tostring(v17.id);
            v20.priceInRobux = v17.price or v17.lowestPrice;
            if v17.productId then
                v20.product = {
                    id = tostring(v17.productId)
                };
            end;
            if v17.creatorName then
                v20.creator = {
                    id = tostring(v17.creatorTargetId), 
                    name = v17.creatorName, 
                    type = v17.creatorType, 
                    hasVerifiedBadge = not not v17.creatorHasVerifiedBadge and v17.creatorHasVerifiedBadge
                };
            end;
            if v18 then
                v20.assetType = v18;
            end;
            return v20;
        else
            v20 = v9.DEPRECATED_itemDataFromAssetInfo(v17, v19);
            v20.receivedFromRecommendedData = true;
            if v18 then
                v20.assetType = v18;
            end;
            return v20;
        end;
    end, 
    fromHydrateWidgetInfo = function(v21, v22)
        local v23 = v5.deepCopy(v22 or {});
        v23.id = tostring(v21.id);
        if not v21.failedToHydrate then
            v23.name = v21.name;
            if v21.creatorName then
                v23.creator = {
                    name = v21.creatorName
                };
            end;
            v23.assetType = v8.AssetTypeIdStrings[tostring(v21.assetType)];
            v23.priceInRobux = v21.price;
            v23.receivedWidgetHydration = true;
            if v21.premiumPrice then
                v23.premiumPricing = {
                    premiumPriceInRobux = v21.premiumPrice
                };
            end;
            local v24 = if not v12 then {} else nil;
            if not (not (v21.isLimited or v21.isLimitedUnique) and not v21.isCollectible) then
                v24 = {
                    [l_ItemTileEnums_0.Restriction.Limited] = not not v21.isLimited or false, 
                    [l_ItemTileEnums_0.Restriction.LimitedUnique] = not not v21.isLimitedUnique or false, 
                    [l_ItemTileEnums_0.Restriction.Collectible] = not not v21.isCollectible or false
                };
            end;
            v23.tileRestrictionsMap = v24;
            return v23;
        else
            v23.failedToHydrate = true;
            return v23;
        end;
    end, 
    fromGetRecommendedItemsData = function(v25, v26, v27)
        local v28 = v5.deepCopy(v27 or {});
        v28.receivedFromRecommendedData = true;
        if v25.item then
            v28.name = v25.item.name;
            v28.id = tostring(v25.item.assetId);
            v28.priceInRobux = v25.item.price;
        end;
        if not (not v25.product or not v25.product.isFree) then
            v28.priceInRobux = 0;
        end;
        if v25.product then
            v28.product = {
                id = tostring(v25.product.id)
            };
        end;
        if v25.creator then
            v28.creator = {
                id = tostring(v25.creator.creatorId), 
                name = v25.creator.name, 
                type = v25.creator.type
            };
        end;
        if v26 then
            v28.assetType = v26;
        end;
        return v28;
    end, 
    fromGetCatalogItemData = function(v29, v30)
        local v31 = nil;
        if not v10() then
            v31 = v5.deepCopy(v30 or {});
            v31.receivedCatalogData = true;
            v31.id = tostring(v29.id);
            v31.assetType = v8.AssetTypeIdStrings[tostring(v29.assetType)];
            v31.name = v29.name;
            v31.description = v29.description;
            v31.product = {
                id = tostring(v29.productId)
            };
            v31.genres = v29.genres;
            v31.creator = {
                id = tostring(v29.creatorTargetId), 
                name = v29.creatorName, 
                type = v29.creatorType, 
                hasVerifiedBadge = v29.creatorHasVerifiedBadge
            };
            v31.priceInRobux = v29.price;
            v31.lowestPrice = v29.lowestPrice;
            v31.favoriteCount = v29.favoriteCount;
            v31.itemStatus = v29.itemStatus;
            local v32, v33 = v9.CreateRestrictionInfo(v29.itemRestrictions);
            v31.itemRestrictions = v32;
            v31.tileRestrictionsMap = v33;
            v31.priceStatus = v29.priceStatus;
            v31.numberRobloxHasAvailable = v29.unitsAvailableForConsumption or v29.numberRobloxHasAvailable;
            v31.totalQuantity = v29.totalQuantity;
            v31.isForRent = v29.isForRent;
            v31.isOwned = v29.owned;
            v31.isPurchasable = v29.isPurchasable;
            v31.expectedSellerId = tostring(v29.expectedSellerId);
            v31.premiumPricing = v29.premiumPricing;
            v31.collectibleItemId = v29.collectibleItemId;
            v31.saleLocationType = v29.saleLocationType;
            v31.hasResellers = v29.hasResellers;
            return v31;
        else
            v31 = v9.DEPRECATED_itemDataFromAssetInfo(v29, v30);
            v31.receivedCatalogData = true;
            v31.assetType = v8.AssetTypeIdStrings[tostring(v29.assetType)];
            return v31;
        end;
    end, 
    fromBundleItemData = function(v34, v35)
        local v36 = v5.deepCopy(v35 or {});
        v36.receivedFromBundleItemData = true;
        v36.id = tostring(v34.id);
        v36.name = v34.name;
        v36.isOwned = v34.owned;
        return v36;
    end, 
    fromSortResults = function(v37, v38)
        local v39 = nil;
        if not v10() then
            v39 = v5.deepCopy(v38 or {});
            v39.receivedFromSortResults = true;
            v39.id = tostring(v37.id);
            v39.assetType = tostring(v37.assetType);
            v39.name = v37.name;
            v39.description = v37.description;
            v39.product = {
                id = tostring(v37.productId)
            };
            v39.genres = v37.genres;
            v39.creator = {
                id = tostring(v37.creatorTargetId), 
                name = v37.creatorName, 
                type = v37.creatorType, 
                hasVerifiedBadge = v37.creatorHasVerifiedBadge
            };
            v39.priceInRobux = v37.price;
            v39.lowestPrice = v37.lowestPrice;
            v39.favoriteCount = v37.favoriteCount;
            v39.itemStatus = v37.itemStatus;
            local v40, v41 = v9.CreateRestrictionInfo(v37.itemRestrictions);
            v39.itemRestrictions = v40;
            v39.tileRestrictionsMap = v41;
            v39.priceStatus = v37.priceStatus;
            v39.numberRobloxHasAvailable = v37.unitsAvailableForConsumption or v37.numberRobloxHasAvailable;
            v39.totalQuantity = v37.totalQuantity;
            v39.premiumPricing = v37.premiumPricing;
            v39.collectibleItemId = v37.collectibleItemId;
            v39.saleLocationType = v37.saleLocationType;
            v39.hasResellers = v37.hasResellers;
            return v39;
        else
            v39 = v9.DEPRECATED_itemDataFromAssetInfo(v37, v38);
            v39.receivedFromSortResults = true;
            return v39;
        end;
    end, 
    fromInventoryFetch = function(v42, v43)
        local v44 = v5.deepCopy(v43 or {});
        v44.receivedFromInventoryFetch = true;
        v44.id = tostring(v42.assetId);
        v44.name = v42.name;
        v44.assetType = v8.AssetTypeIdStrings[v42.assetType];
        return v44;
    end, 
    fromAssetGrant = function(v45, v46, v47)
        local v48 = v5.deepCopy(v47 or {});
        v2.isType(v45, "string", "AssetInfo.fromAssetGrant expects assetId to be a string");
        v2.isType(v46, "string", "AssetInfo.fromAssetGrant expects assetType to be a string");
        v48.id = v45;
        v48.assetType = v46;
        return v48;
    end, 
    fromOutfitDetails = function(v49, v50)
        local v51 = v5.deepCopy(v50 or {});
        v51.receivedFromOutfitDetails = true;
        v51.id = tostring(v49.id);
        v51.name = v49.name;
        v51.assetType = tostring(v49.assetType.id);
        return v51;
    end, 
    fromGetResellers = function(v52, v53)
        local v54 = v5.deepCopy(v53 or {});
        v54.resellerUserAssetIds = v52;
        return v54;
    end, 
    fromLowestPrice = function(v55, v56)
        local v57 = v5.deepCopy(v56 or {});
        v57.lowestPrice = v55;
        return v57;
    end, 
    fromResaleData = function(v58, v59)
        local v60 = v5.deepCopy(v59 or {});
        v60.receivedFromResaleData = true;
        v60.soldCount = v58.sales;
        v60.averagePrice = v58.recentAveragePrice;
        v60.originalPrice = v58.originalPrice;
        return v60;
    end, 
    fromIsOwned = function(v61, v62)
        local v63 = v5.deepCopy(v62 or {});
        v63.isOwned = v61;
        return v63;
    end, 
    fromReceivedAvatarData = function(v64)
        return {
            id = tostring(v64.id), 
            name = v64.name, 
            assetType = tostring(v64.assetType.id)
        };
    end, 
    fromVersionData = function(v65, v66)
        local v67 = v5.deepCopy(v66 or {});
        local v68 = v65.data[1];
        v67.receivedFromVersionData = true;
        v67.creatingUniverseId = if not v68.creatingUniverseId then nil else tostring(v68.creatingUniverseId);
        return v67;
    end
};
