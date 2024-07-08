local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Packages.Dash);
local l_Parent_0 = script.Parent.Parent;
local v4 = require(l_Parent_0.MockId);
local v5 = require(l_Parent_0.Constants);
local v6 = require(l_CoreGui_0.RobloxGui.Modules.Flags.FFlagEnableRestrictedAssetSaleLocationInspectAndBuy);
local v7 = require(l_Parent_0.Flags.GetCollectibleItemInInspectAndBuyEnabled);
local v8 = require(l_Parent_0.Flags.GetFFlagIBGateUGC4ACollectibleAssetsBundles);
local v9 = require(l_Parent_0.Flags.GetFFlagIBEnableCollectiblesSystemSupport);
local v10 = require(l_Parent_0.Flags.GetFFlagIBEnableNewDataCollectionForCollectibleSystem);
local v11 = require(l_Parent_0.Flags.GetFFlagIBEnableCollectiblePurchaseForUnlimited);
local v12 = require(l_Parent_0.Flags.GetFFlagIBEnableRespectSaleLocation);
local v13 = require(l_Parent_0.Flags.GetFFlagIBEnableFixForOwnedText);
local v14 = require(l_Parent_0.Flags.GetFFlagIBEnableFixForSaleLocation);
local v15 = require(l_Parent_0.Flags.GetFFlagIBFixBuyingFromResellers);
local v16 = require(l_Parent_0.Flags.GetFFlagIBEnableLimitedBundle);
local v17 = game:DefineFastFlag("IBFixLegacyItemStatus", false);
local v18 = {
    new = function()
        return {};
    end
};
v18.mock = function()
    local v19 = v18.new();
    v19.name = "";
    v19.assetId = v4();
    v19.assetTypeId = "";
    v19.creatorId = "";
    v19.creatorName = "";
    v19.creatorHasVerifiedBadge = false;
    v19.owned = false;
    v19.isForSale = false;
    v19.description = "";
    v19.price = "";
    v19.productId = "";
    v19.isLimited = false;
    v19.isLimitedUnique = if not v9() then nil else false;
    v19.collectibleIsLimited = if not v9() then nil else false;
    v19.bundlesAssetIsIn = {};
    if v10() then
        v19.parentBundleId = nil;
    end;
    v19.numFavorites = 0;
    v19.minimumMembershipLevel = 0;
    v19.collectibleItemId = "";
    v19.collectibleProductId = "";
    v19.collectibleLowestResalePrice = 0;
    v19.collectibleLowestAvailableResaleProductId = "";
    v19.collectibleLowestAvailableResaleItemInstanceId = "";
    v19.collectibleQuantityLimitPerUser = 0;
    v19.remaining = 0;
    v19.creatingUniverseId = nil;
    return v19;
end;
v18.fromGetProductInfo = function(v20)
    local v21 = v18.new();
    v21.name = v20.Name;
    v21.description = v20.Description;
    v21.price = v20.PriceInRobux;
    v21.productType = v20.ProductType;
    v21.remaining = v20.Remaining;
    v21.creatorId = tostring(v20.Creator.Id);
    v21.creatorName = v20.Creator.Name;
    v21.assetId = tostring(v20.AssetId);
    v21.assetTypeId = tostring(v20.AssetTypeId);
    v21.productId = tostring(v20.ProductId);
    if not v15() then
        if v7() and v21.productType == v5.ProductType.CollectibleItem then
            local l_IsForSale_0 = v20.IsForSale;
            if l_IsForSale_0 then
                l_IsForSale_0 = false;
                if (v20.Remaining or 0) > 0 then
                    l_IsForSale_0 = v20.CanBeSoldInThisGame and v20.SaleLocation.SaleLocationType ~= v5.SaleLocationType.ExperiencesDevApiOnly;
                end;
            end;
            v21.isForSale = l_IsForSale_0;
            if v12() then
                l_IsForSale_0 = v20.SaleLocation;
                local l_l_IsForSale_0_0 = l_IsForSale_0;
                if l_l_IsForSale_0_0 then
                    l_l_IsForSale_0_0 = false;
                    if l_IsForSale_0.SaleLocationType ~= v5.SaleLocationType.ExperiencesDevApiOnly then
                        l_l_IsForSale_0_0 = l_IsForSale_0.SaleLocationType ~= v5.SaleLocationType.ShopAndExperiencesById;
                    end;
                end;
                local v24 = l_IsForSale_0 and l_IsForSale_0.SaleLocationType ~= v5.SaleLocationType.ShopOnly;
                local l_l_IsForSale_0_1 = l_IsForSale_0;
                if l_l_IsForSale_0_1 then
                    if l_IsForSale_0.SaleLocationType ~= v5.SaleLocationType.ExperiencesDevApiOnly then
                        l_l_IsForSale_0_1 = false;
                        if not (l_IsForSale_0.SaleLocationType == v5.SaleLocationType.ShopAndExperiencesById) then
                            goto label0;
                        end;
                    end;
                    l_l_IsForSale_0_1 = false;
                    if type(l_IsForSale_0.UniverseIds) == "table" then
                        l_l_IsForSale_0_1 = table.find(l_IsForSale_0.UniverseIds, game.GameId) ~= nil;
                    end;
                end;
                ::label0::;
                local v26 = nil;
                if v14() then
                    l_l_IsForSale_0_0 = l_IsForSale_0 and l_IsForSale_0.SaleLocationType ~= v5.SaleLocationType.ShopAndExperiencesById;
                    local l_l_IsForSale_0_2 = l_IsForSale_0;
                    if l_l_IsForSale_0_2 then
                        l_l_IsForSale_0_2 = false;
                        if l_IsForSale_0.SaleLocationType == v5.SaleLocationType.ShopAndExperiencesById then
                            l_l_IsForSale_0_2 = false;
                            if type(l_IsForSale_0.UniverseIds) == "table" then
                                l_l_IsForSale_0_2 = table.find(l_IsForSale_0.UniverseIds, game.GameId) ~= nil;
                            end;
                        end;
                    end;
                    l_l_IsForSale_0_1 = l_l_IsForSale_0_2;
                    v26 = l_IsForSale_0 and l_IsForSale_0.SaleLocationType ~= v5.SaleLocationType.ExperiencesDevApiOnly;
                end;
                v21.isForSale = ((v20.IsForSale and v20.CanBeSoldInThisGame) and v24) and (l_l_IsForSale_0_0 or l_l_IsForSale_0_1);
                if v14() then
                    v21.isForSale = v21.isForSale and v26;
                end;
            end;
            v21.collectibleItemId = v20.CollectibleItemId or "";
            v21.collectibleProductId = v20.CollectibleProductId or "";
            v21.remaining = v20.Remaining or 0;
            if v20.CollectiblesItemDetails then
                v21.collectibleLowestResalePrice = v20.CollectiblesItemDetails.CollectibleLowestResalePrice or 0;
                v21.collectibleLowestAvailableResaleProductId = v20.CollectiblesItemDetails.CollectibleLowestAvailableResaleProductId or "";
                v21.collectibleLowestAvailableResaleItemInstanceId = v20.CollectiblesItemDetails.CollectibleLowestAvailableResaleItemInstanceId or "";
                v21.collectibleQuantityLimitPerUser = v20.CollectiblesItemDetails.CollectibleQuantityLimitPerUser or 0;
                v21.collectibleIsLimited = if v8() or v9() then v20.CollectiblesItemDetails.IsLimited else nil;
            end;
        elseif not v6 then
            v21.isForSale = v20.IsForSale;
        else
            v21.isForSale = v20.IsForSale and v20.CanBeSoldInThisGame;
            if v17 and v20.CanBeSoldInThisGame == nil then
                v21.isForSale = v20.IsForSale;
            end;
        end;
    else
        v21.isForSale = v20.IsForSale;
        v21.canBeSoldInThisGame = v20.CanBeSoldInThisGame;
        v21.saleLocation = v20.SaleLocation;
        v21.remaining = v20.Remaining or 0;
        if v21.productType == v5.ProductType.CollectibleItem then
            v21.collectibleItemId = v20.CollectibleItemId or "";
            v21.collectibleProductId = v20.CollectibleProductId or "";
            if v20.CollectiblesItemDetails then
                v21.collectibleLowestResalePrice = v20.CollectiblesItemDetails.CollectibleLowestResalePrice or 0;
                v21.collectibleLowestAvailableResaleProductId = v20.CollectiblesItemDetails.CollectibleLowestAvailableResaleProductId or "";
                v21.collectibleLowestAvailableResaleItemInstanceId = v20.CollectiblesItemDetails.CollectibleLowestAvailableResaleItemInstanceId or "";
                v21.collectibleQuantityLimitPerUser = v20.CollectiblesItemDetails.CollectibleQuantityLimitPerUser or 0;
                v21.collectibleIsLimited = v20.CollectiblesItemDetails.IsLimited;
            end;
        end;
    end;
    v21.creatorHasVerifiedBadge = v20.Creator.HasVerifiedBadge;
    if not v9() then
        v21.isLimited = v20.IsLimited or v20.IsLimitedUnique;
        return v21;
    else
        v21.isLimited = v20.IsLimited;
        v21.isLimitedUnique = v20.IsLimitedUnique;
        return v21;
    end;
end;
v18.fromHumanoidDescription = function(v28)
    local v29 = v18.new();
    v29.assetId = tostring(v28);
    return v29;
end;
v18.fromGetAssetBundles = function(v30, v31)
    local v32 = v18.new();
    v32.assetId = tostring(v30);
    v32.bundlesAssetIsIn = v31;
    return v32;
end;
if v10() then
    v18.fromBundleInfo = function(v33, v34)
        local v35 = v18.new();
        v35.assetId = tostring(v33);
        v35.parentBundleId = v34.bundleId;
        v35.bundlesAssetIsIn = {
            v34.bundleId
        };
        v35.collectibleItemId = v34.collectibleItemId;
        v35.collectibleProductId = v34.collectibleProductId;
        v35.collectibleLowestResalePrice = v34.collectibleLowestResalePrice;
        v35.collectibleLowestAvailableResaleProductId = v34.collectibleLowestAvailableResaleProductId;
        v35.collectibleLowestAvailableResaleItemInstanceId = v34.collectibleLowestAvailableResaleItemInstanceId;
        v35.collectibleQuantityLimitPerUser = v34.collectibleQuantityLimitPerUser;
        v35.collectibleIsLimited = v34.collectibleIsLimited;
        v35.isForSale = v34.isForSale;
        v35.remaining = v34.remaining;
        if v16() then
            v35.owned = v34.owned;
            if not v35.collectibleIsLimited then
                v35.isForSale = v35.isForSale and not v35.owned;
            end;
        end;
        v35.description = v34.description or "";
        v35.productType = v5.ProductType.CollectibleItem;
        if v34.price then
            v35.price = v34.price;
        end;
        return v35;
    end;
end;
v18.fromGetAssetFavoriteCount = function(v36, v37)
    local v38 = v18.new();
    v38.assetId = tostring(v36);
    v38.numFavorites = v37;
    return v38;
end;
v18.fromGetEconomyProductInfo = function(v39, v40, v41, v42, v43)
    local v44 = v18.new();
    v44.assetId = tostring(v39.assetId);
    v44.owned = v40;
    if v41 then
        v44.price = v41;
    end;
    v44.isForSale = v42;
    v44.premiumPricing = v43;
    return v44;
end;
v18.fromGetItemDetails = function(v45)
    if v11() then
        local v46 = v18.new();
        v46.assetId = tostring(v45.Id);
        v46.owned = v45.Owned;
        v46.isForSale = v45.IsPurchasable;
        if not (not v13() or v15()) then
            v46.isForSale = v45.IsPurchasable and not v45.Owned;
        end;
        v46.price = v45.Price or 0;
        v46.hasResellers = v45.HasResellers;
        v46.collectibleItemId = v45.CollectibleItemId;
        return v46;
    else
        return ;
    end;
end;
v18.fromPurchaseSuccess = function(v47)
    local v48 = v18.new();
    v48.assetId = tostring(v47);
    v48.owned = true;
    return v48;
end;
v18.fromGetVersionInfo = function(v49, v50)
    local v51 = v18.new();
    v51.assetId = tostring(v49);
    v51.creatingUniverseId = if not v50.creatingUniverseId then nil else tostring(v50.creatingUniverseId);
    return v51;
end;
if v15() then
    v18.getSaleDetailsForCollectibles = function(v52)
        local v53 = v2.joinDeep({}, v52);
        local l_saleLocation_0 = v52.saleLocation;
        if v52.productType == v5.ProductType.CollectibleItem then
            local l_isForSale_0 = v52.isForSale;
            if l_isForSale_0 then
                l_isForSale_0 = false;
                if (v52.remaining or 0) > 0 then
                    l_isForSale_0 = v52.canBeSoldInThisGame and l_saleLocation_0.SaleLocationType ~= v5.SaleLocationType.ExperiencesDevApiOnly;
                end;
            end;
            v53.isForSale = l_isForSale_0;
            if v12() then
                l_isForSale_0 = l_saleLocation_0;
                if l_isForSale_0 then
                    l_isForSale_0 = false;
                    if l_saleLocation_0.SaleLocationType ~= v5.SaleLocationType.ExperiencesDevApiOnly then
                        l_isForSale_0 = l_saleLocation_0.SaleLocationType ~= v5.SaleLocationType.ShopAndExperiencesById;
                    end;
                end;
                local v56 = l_saleLocation_0 and l_saleLocation_0.SaleLocationType ~= v5.SaleLocationType.ShopOnly;
                local l_l_saleLocation_0_0 = l_saleLocation_0;
                if l_l_saleLocation_0_0 then
                    if l_saleLocation_0.SaleLocationType ~= v5.SaleLocationType.ExperiencesDevApiOnly then
                        l_l_saleLocation_0_0 = false;
                        if not (l_saleLocation_0.SaleLocationType == v5.SaleLocationType.ShopAndExperiencesById) then
                            goto label1;
                        end;
                    end;
                    l_l_saleLocation_0_0 = false;
                    if type(l_saleLocation_0.UniverseIds) == "table" then
                        l_l_saleLocation_0_0 = table.find(l_saleLocation_0.UniverseIds, game.GameId) ~= nil;
                    end;
                end;
                ::label1::;
                local v58 = nil;
                if v14() then
                    l_isForSale_0 = l_saleLocation_0 and l_saleLocation_0.SaleLocationType ~= v5.SaleLocationType.ShopAndExperiencesById;
                    local l_l_saleLocation_0_1 = l_saleLocation_0;
                    if l_l_saleLocation_0_1 then
                        l_l_saleLocation_0_1 = false;
                        if l_saleLocation_0.SaleLocationType == v5.SaleLocationType.ShopAndExperiencesById then
                            l_l_saleLocation_0_1 = false;
                            if type(l_saleLocation_0.UniverseIds) == "table" then
                                l_l_saleLocation_0_1 = table.find(l_saleLocation_0.UniverseIds, game.GameId) ~= nil;
                            end;
                        end;
                    end;
                    l_l_saleLocation_0_0 = l_l_saleLocation_0_1;
                    v58 = l_saleLocation_0 and l_saleLocation_0.SaleLocationType ~= v5.SaleLocationType.ExperiencesDevApiOnly;
                end;
                v53.isForSale = ((v52.isForSale and v52.canBeSoldInThisGame) and v56) and (l_isForSale_0 or l_l_saleLocation_0_0);
                if v14() then
                    v53.isForSale = v53.isForSale and v58;
                end;
            end;
            if not v52.collectibleIsLimited then
                v53.isForSale = v53.isForSale and not v53.owned;
                return v53;
            end;
        elseif not v6 then
            v53.isForSale = v52.isForSale;
        else
            v53.isForSale = v52.isForSale and v52.canBeSoldInThisGame;
            if v17 and v52.canBeSoldInThisGame == nil then
                v53.isForSale = v52.isForSale;
                return v53;
            end;
        end;
        return v53;
    end;
end;
return v18;
