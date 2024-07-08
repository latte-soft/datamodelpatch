local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Cryo);
local v3 = require(l_CorePackages_0.Packages.Dash);
local v4 = require(l_CorePackages_0.UIBlox);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v6 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local l_ItemTileEnums_0 = v4.Tile.ItemTileEnums;
local v8 = require(l_CorePackages_0.Packages.tutils);
local v9 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXLimitedBundlesHandleNewData);
local v10 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXFixCatalogDataOverride);
local v11 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXFixRecommendedItemCollectibles);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v19 = {
    CreateRestrictionInfo = function(v13)
        if v13 then
            local v14 = v2.List.toSet(v13);
            local v15 = v14[v6.ItemRestrictions.Limited];
            local v16 = v14[v6.ItemRestrictions.LimitedUnique];
            local v17 = v14[v6.ItemRestrictions.Collectible];
            local v18 = nil;
            if not (not (v15 or v16) and not v17) then
                v18 = {
                    [l_ItemTileEnums_0.Restriction.Limited] = v15, 
                    [l_ItemTileEnums_0.Restriction.LimitedUnique] = v16, 
                    [l_ItemTileEnums_0.Restriction.Collectible] = v17
                };
            end;
            return v14, v18;
        else
            return nil, nil;
        end;
    end
};
if not (not v9() and not v11()) then
    v19.DEPRECATED_itemDataFromAssetInfo = function(v20, v21)
        local v22 = v8.deepCopy(v21 or {});
        if not v10() then
            v22.id = tostring(v20.id);
            v22.assetType = tostring(v20.assetType);
            v22.name = v20.name;
            v22.description = v20.description;
            v22.product = {
                id = tostring(v20.productId)
            };
            v22.genres = v20.genres;
            v22.creator = {
                id = tostring(v20.creatorTargetId), 
                name = v20.creatorName, 
                type = v20.creatorType, 
                hasVerifiedBadge = v20.creatorHasVerifiedBadge
            };
            v22.priceInRobux = v20.price;
            v22.lowestPrice = v20.lowestPrice;
            v22.favoriteCount = v20.favoriteCount;
            v22.itemStatus = v20.itemStatus;
            local v23, v24 = v19.CreateRestrictionInfo(v20.itemRestrictions);
            v22.itemRestrictions = v23;
            v22.tileRestrictionsMap = v24;
            v22.priceStatus = v20.priceStatus;
            v22.numberRobloxHasAvailable = v20.unitsAvailableForConsumption or v20.numberRobloxHasAvailable;
            v22.totalQuantity = v20.totalQuantity;
            v22.isForRent = v20.isForRent;
            v22.isOwned = v20.owned;
            v22.isPurchasable = v20.isPurchasable;
            v22.expectedSellerId = tostring(v20.expectedSellerId);
            v22.premiumPricing = v20.premiumPricing;
            v22.collectibleItemId = v20.collectibleItemId;
            v22.saleLocationType = v20.saleLocationType;
            v22.hasResellers = v20.hasResellers;
            return v22;
        else
            local v25, v26 = v19.CreateRestrictionInfo(v20.itemRestrictions);
            return (v3.join(v22, {
                id = if not v20.id then nil else tostring(v20.id), 
                assetType = if not v20.assetType then nil else tostring(v20.assetType), 
                name = v20.name, 
                description = v20.description, 
                product = if not v20.productId then nil else {
                    id = tostring(v20.productId)
                }, 
                genres = v20.genres, 
                creator = if not v20.creatorTargetId then nil else {
                    id = tostring(v20.creatorTargetId), 
                    name = v20.creatorName, 
                    type = v20.creatorType, 
                    hasVerifiedBadge = v20.creatorHasVerifiedBadge
                }, 
                priceInRobux = v20.price, 
                lowestPrice = v20.lowestPrice, 
                favoriteCount = v20.favoriteCount, 
                itemStatus = v20.itemStatus, 
                itemRestrictions = v25, 
                tileRestrictionsMap = v26, 
                priceStatus = v20.priceStatus, 
                numberRobloxHasAvailable = v20.unitsAvailableForConsumption or v20.numberRobloxHasAvailable, 
                totalQuantity = v20.totalQuantity, 
                isForRent = v20.isForRent, 
                isOwned = v20.owned, 
                isPurchasable = v20.isPurchasable, 
                expectedSellerId = if not v20.expectedSellerId then nil else tostring(v20.expectedSellerId), 
                premiumPricing = v20.premiumPricing, 
                collectibleItemId = v20.collectibleItemId, 
                saleLocationType = v20.saleLocationType, 
                hasResellers = v20.hasResellers
            }));
        end;
    end;
    v19.DEPRECATED_itemDataFromBundleInfo = function(v27, v28, v29)
        local v30 = v8.deepCopy(v29 or {});
        if not v10() then
            v30.id = tostring(v27.id);
            v30.itemType = v27.itemType;
            v30.bundleType = v28;
            v30.name = v27.name;
            v30.description = v27.description;
            v30.product = {
                id = tostring(v27.productId)
            };
            v30.genres = v27.genres;
            v30.creator = {
                id = tostring(v27.creatorTargetId), 
                name = v27.creatorName, 
                type = v27.creatorType, 
                hasVerifiedBadge = v27.creatorHasVerifiedBadge
            };
            v30.priceInRobux = v27.price;
            v30.favoriteCount = v27.favoriteCount;
            v30.itemStatus = v27.itemStatus;
            local v31, v32 = v19.CreateRestrictionInfo(v27.itemRestrictions);
            v30.itemRestrictions = v31;
            v30.tileRestrictionsMap = v32;
            v30.lowestPrice = v27.lowestPrice;
            v30.priceStatus = v27.priceStatus;
            v30.numberRobloxHasAvailable = v27.unitsAvailableForConsumption or v27.numberRobloxHasAvailable;
            v30.isForRent = v27.isForRent;
            v30.isOwned = v27.owned;
            v30.isPurchasable = v27.isPurchasable;
            v30.expectedSellerId = tostring(v27.expectedSellerId);
            v31 = {};
            if v27.bundledItems then
                for _, v34 in v27.bundledItems, nil, nil do
                    table.insert(v31, {
                        id = tostring(v34.id), 
                        type = v34.type
                    });
                end;
                v30.items = v31;
            end;
            v30.totalQuantity = v27.totalQuantity;
            v30.premiumPricing = v27.premiumPricing;
            v30.collectibleItemId = v27.collectibleItemId;
            v30.saleLocationType = v27.saleLocationType;
            v30.hasResellers = v27.hasResellers;
            return v30;
        else
            local v35, v36 = v19.CreateRestrictionInfo(v27.itemRestrictions);
            local v37 = if not v27.productId then nil else {
                id = tostring(v27.productId)
            };
            local v38 = if not v27.creatorTargetId then nil else {
                id = tostring(v27.creatorTargetId), 
                name = v27.creatorName, 
                type = v27.creatorType, 
                hasVerifiedBadge = v27.creatorHasVerifiedBadge
            };
            local v39 = nil;
            if v27.bundledItems then
                v39 = {};
                for _, v41 in v27.bundledItems, nil, nil do
                    table.insert(v39, {
                        id = tostring(v41.id), 
                        type = v41.type
                    });
                end;
            end;
            return (v3.join(v30, {
                id = if not v27.id then nil else tostring(v27.id), 
                itemType = v27.itemType, 
                bundleType = v28, 
                name = v27.name, 
                description = v27.description, 
                product = v37, 
                genres = v27.genres, 
                creator = v38, 
                priceInRobux = v27.price, 
                favoriteCount = v27.favoriteCount, 
                itemStatus = v27.itemStatus, 
                itemRestrictions = v35, 
                tileRestrictionsMap = v36, 
                lowestPrice = v27.lowestPrice, 
                priceStatus = v27.priceStatus, 
                numberRobloxHasAvailable = v27.unitsAvailableForConsumption or v27.numberRobloxHasAvailable, 
                isForRent = v27.isForRent, 
                isOwned = v27.owned, 
                isPurchasable = v27.isPurchasable, 
                expectedSellerId = if not v27.expectedSellerId then nil else tostring(v27.expectedSellerId), 
                items = v39, 
                totalQuantity = v27.totalQuantity, 
                premiumPricing = v27.premiumPricing, 
                collectibleItemId = v27.collectibleItemId, 
                saleLocationType = v27.saleLocationType, 
                hasResellers = v27.hasResellers
            }));
        end;
    end;
end;
return v19;
