local v0 = require(game:GetService("CorePackages").Packages.Dash);
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.Constants);
local v3 = require(l_Parent_0.Flags.GetFFlagIBEnableNewDataCollectionForCollectibleSystem);
local v4 = require(l_Parent_0.Flags.GetFFlagIBEnableCollectiblePurchaseForUnlimited);
local v5 = require(l_Parent_0.Flags.GetFFlagIBEnableRespectSaleLocation);
local v6 = require(l_Parent_0.Flags.GetFFlagIBEnableFixForOwnedText);
local v7 = require(l_Parent_0.Flags.GetFFlagIBEnableFixForSaleLocation);
local v8 = require(l_Parent_0.Flags.GetFFlagIBFixBuyingFromResellers);
local v9 = require(script.Parent.Parent.MockId);
local v10 = {
    new = function()
        return {};
    end
};
v10.mock = function()
    local v11 = v10.new();
    v11.name = "";
    v11.bundleId = v9();
    v11.description = "";
    v11.bundleType = "";
    v11.creatorId = "";
    v11.creatorName = "";
    v11.productId = "";
    v11.isForSale = false;
    v11.price = "";
    v11.assetIds = {};
    v11.numFavorites = 0;
    v11.costumeId = "";
    v11.owned = false;
    if v3() then
        v11.isForSale = false;
        v11.collectibleItemId = "";
        v11.collectibleIsLimited = nil;
        v11.collectibleProductId = "";
        v11.collectibleLowestResalePrice = 0;
        v11.collectibleLowestAvailableResaleProductId = "";
        v11.collectibleLowestAvailableResaleItemInstanceId = "";
        v11.collectibleQuantityLimitPerUser = 0;
        v11.remaining = 0;
        v11.productType = "";
    end;
    return v11;
end;
v10.fromGetAssetBundles = function(v12)
    local v13 = v10.new();
    v13.name = v12.name;
    v13.bundleId = tostring(v12.id);
    v13.description = v12.description;
    v13.bundleType = v12.bundleType;
    v13.creatorId = tostring(v12.creator.id);
    v13.creatorName = v12.creator.name;
    v13.productId = tostring(v12.product.id);
    if not (not v3() or not v12.collectibleItemDetail) then
        v13.isForSale = v12.collectibleItemDetail.saleStatus == v2.SaleStatus.OnSale;
        v13.collectibleItemId = v12.collectibleItemDetail.collectibleItemId or "";
        v13.collectibleProductId = v12.collectibleItemDetail.collectibleProductId or "";
        v13.collectibleLowestResalePrice = v12.collectibleItemDetail.lowestResalePrice or 0;
        v13.collectibleLowestAvailableResaleProductId = v12.collectibleItemDetail.lowestAvailableResaleProductId or "";
        v13.collectibleLowestAvailableResaleItemInstanceId = v12.collectibleItemDetail.lowestAvailableResaleItemInstanceId or "";
        v13.collectibleQuantityLimitPerUser = v12.collectibleItemDetail.quantityLimitPerUser or 0;
        v13.productType = v2.ProductType.CollectibleItem;
        v13.price = v12.collectibleItemDetail.price;
        v13.remaining = v12.collectibleItemDetail.unitsAvailable or 0;
        v13.collectibleIsLimited = v12.collectibleItemDetail.collectibleItemType == "Limited";
        if not v8() then
            if v5() then
                v13.saleLocation = v12.collectibleItemDetail.saleLocation;
                local l_saleLocation_0 = v13.saleLocation;
                local l_l_saleLocation_0_0 = l_saleLocation_0;
                if l_l_saleLocation_0_0 then
                    l_l_saleLocation_0_0 = false;
                    if l_saleLocation_0.saleLocationTypeId ~= v2.SaleLocationType.ExperiencesDevApiOnly then
                        l_l_saleLocation_0_0 = l_saleLocation_0.saleLocationTypeId ~= v2.SaleLocationType.ShopAndExperiencesById;
                    end;
                end;
                local v16 = l_saleLocation_0 and l_saleLocation_0.SaleLocationType ~= v2.SaleLocationType.ShopOnly;
                local l_l_saleLocation_0_1 = l_saleLocation_0;
                if l_l_saleLocation_0_1 then
                    if l_saleLocation_0.saleLocationTypeId ~= v2.SaleLocationType.ExperiencesDevApiOnly then
                        l_l_saleLocation_0_1 = false;
                        if not (l_saleLocation_0.saleLocationTypeId == v2.SaleLocationType.ShopAndExperiencesById) then
                            goto label0;
                        end;
                    end;
                    l_l_saleLocation_0_1 = false;
                    if type(l_saleLocation_0.universeIds) == "table" then
                        l_l_saleLocation_0_1 = table.find(l_saleLocation_0.universeIds, game.GameId) ~= nil;
                    end;
                end;
                ::label0::;
                local v18 = nil;
                if v7() then
                    l_l_saleLocation_0_0 = l_saleLocation_0 and l_saleLocation_0.SaleLocationType ~= v2.SaleLocationType.ShopAndExperiencesById;
                    local l_l_saleLocation_0_2 = l_saleLocation_0;
                    if l_l_saleLocation_0_2 then
                        l_l_saleLocation_0_2 = false;
                        if l_saleLocation_0.SaleLocationType == v2.SaleLocationType.ShopAndExperiencesById then
                            l_l_saleLocation_0_2 = false;
                            if type(l_saleLocation_0.UniverseIds) == "table" then
                                l_l_saleLocation_0_2 = table.find(l_saleLocation_0.UniverseIds, game.GameId) ~= nil;
                            end;
                        end;
                    end;
                    l_l_saleLocation_0_1 = l_l_saleLocation_0_2;
                    v18 = l_saleLocation_0 and l_saleLocation_0.SaleLocationType ~= v2.SaleLocationType.ExperiencesDevApiOnly;
                end;
                v13.isForSale = (v13.isForSale and v16) and (l_l_saleLocation_0_0 or l_l_saleLocation_0_1);
                if v7() then
                    v13.isForSale = v13.isForSale and v18;
                end;
            end;
        else
            v13.saleLocation = v12.collectibleItemDetail.saleLocation;
        end;
    end;
    v13.assetIds = {};
    for _, v21 in pairs(v12.items) do
        if v21.type == "UserOutfit" then
            v13.costumeId = tostring(v21.id);
        else
            table.insert(v13.assetIds, (tostring(v21.id)));
        end;
    end;
    return v13;
end;
v10.fromGetItemDetails = function(v22)
    if v4() then
        local v23 = v10.new();
        v23.bundleId = tostring(v22.Id);
        v23.owned = v22.Owned;
        v23.isForSale = v22.IsPurchasable;
        if not (not v6() or v8()) then
            v23.isForSale = v22.IsPurchasable and not v22.Owned;
        end;
        v23.price = v22.Price or 0;
        v23.hasResellers = v22.HasResellers;
        v23.collectibleItemId = v22.CollectibleItemId;
        return v23;
    else
        return ;
    end;
end;
v10.fromGetBundleFavoriteCount = function(v24, v25)
    local v26 = v10.new();
    v26.bundleId = tostring(v24);
    v26.numFavorites = v25;
    return v26;
end;
v10.fromGetEconomyProductInfo = function(v27, v28, v29, v30)
    local v31 = v10.new();
    v31.bundleId = tostring(v28);
    v31.owned = v27;
    v31.price = v29;
    v31.isForSale = v30;
    return v31;
end;
v10.fromPurchaseSuccess = function(v32)
    local v33 = v10.new();
    v33.bundleId = tostring(v32);
    v33.owned = true;
    return v33;
end;
if v8() then
    v10.getSaleDetailsForCollectibles = function(v34)
        local v35 = v0.joinDeep({}, v34);
        if v34.productType == v2.ProductType.CollectibleItem then
            if v5() then
                local l_saleLocation_1 = v35.saleLocation;
                local l_l_saleLocation_1_0 = l_saleLocation_1;
                if l_l_saleLocation_1_0 then
                    l_l_saleLocation_1_0 = false;
                    if l_saleLocation_1.saleLocationTypeId ~= v2.SaleLocationType.ExperiencesDevApiOnly then
                        l_l_saleLocation_1_0 = l_saleLocation_1.saleLocationTypeId ~= v2.SaleLocationType.ShopAndExperiencesById;
                    end;
                end;
                local v38 = l_saleLocation_1 and l_saleLocation_1.saleLocationTypeId ~= v2.SaleLocationType.ShopOnly;
                local l_l_saleLocation_1_1 = l_saleLocation_1;
                if l_l_saleLocation_1_1 then
                    if l_saleLocation_1.saleLocationTypeId ~= v2.SaleLocationType.ExperiencesDevApiOnly then
                        l_l_saleLocation_1_1 = false;
                        if not (l_saleLocation_1.saleLocationTypeId == v2.SaleLocationType.ShopAndExperiencesById) then
                            goto label1;
                        end;
                    end;
                    l_l_saleLocation_1_1 = false;
                    if type(l_saleLocation_1.universeIds) == "table" then
                        l_l_saleLocation_1_1 = table.find(l_saleLocation_1.universeIds, game.GameId) ~= nil;
                    end;
                end;
                ::label1::;
                local v40 = nil;
                if v7() then
                    l_l_saleLocation_1_0 = l_saleLocation_1 and l_saleLocation_1.saleLocationTypeId ~= v2.SaleLocationType.ShopAndExperiencesById;
                    local l_l_saleLocation_1_2 = l_saleLocation_1;
                    if l_l_saleLocation_1_2 then
                        l_l_saleLocation_1_2 = false;
                        if l_saleLocation_1.saleLocationTypeId == v2.SaleLocationType.ShopAndExperiencesById then
                            l_l_saleLocation_1_2 = false;
                            if type(l_saleLocation_1.universeIds) == "table" then
                                l_l_saleLocation_1_2 = table.find(l_saleLocation_1.universeIds, game.GameId) ~= nil;
                            end;
                        end;
                    end;
                    l_l_saleLocation_1_1 = l_l_saleLocation_1_2;
                    v40 = l_saleLocation_1 and l_saleLocation_1.saleLocationTypeId ~= v2.SaleLocationType.ExperiencesDevApiOnly;
                end;
                v35.isForSale = (v35.isForSale and v38) and (l_l_saleLocation_1_0 or l_l_saleLocation_1_1);
                if v7() then
                    v35.isForSale = v35.isForSale and v40;
                end;
            end;
            if not v34.collectibleIsLimited then
                v35.isForSale = v35.isForSale and not v35.owned;
            end;
        end;
        return v35;
    end;
end;
return v10;
