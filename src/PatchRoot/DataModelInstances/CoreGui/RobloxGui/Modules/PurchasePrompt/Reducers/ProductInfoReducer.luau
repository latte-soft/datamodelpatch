local l_Parent_0 = script.Parent.Parent;
local l_Rodux_0 = require(game:GetService("CorePackages").PurchasePromptDeps).Rodux;
local v2 = require(l_Parent_0.Misc.Constants);
local v3 = require(l_Parent_0.Actions.CompleteRequest);
local v4 = require(l_Parent_0.Actions.ProductInfoReceived);
local v5 = require(l_Parent_0.Actions.BundleProductInfoReceived);
local v6 = require(l_Parent_0.Enums.ItemType);
local v7 = require(l_Parent_0.getPreviewImageUrl);
local v8 = require(l_Parent_0.Flags.GetFFlagTranslateDevProducts);
return (l_Rodux_0.createReducer({}, {
    [v4.name] = function(_, v10)
        local l_productInfo_0 = v10.productInfo;
        local v12 = "";
        local v13 = "";
        if l_productInfo_0.ProductType == v2.ProductType.CollectibleItem then
            v12 = l_productInfo_0.CollectibleItemId;
            v13 = l_productInfo_0.CollectibleProductId;
        end;
        return {
            name = not not v8() and (l_productInfo_0.DisplayName or l_productInfo_0.Name) or l_productInfo_0.Name, 
            price = l_productInfo_0.PriceInRobux or 0, 
            premiumPrice = l_productInfo_0.PremiumPriceInRobux, 
            imageUrl = v7(l_productInfo_0), 
            assetTypeId = l_productInfo_0.AssetTypeId, 
            productId = l_productInfo_0.ProductId, 
            productType = l_productInfo_0.ProductType, 
            membershipTypeRequired = l_productInfo_0.MinimumMembershipLevel, 
            itemType = l_productInfo_0.AssetTypeId, 
            collectibleItemId = v12, 
            collectibleProductId = v13
        };
    end, 
    [v5.name] = function(_, v15)
        local l_bundleProductInfo_0 = v15.bundleProductInfo;
        local v17 = nil;
        for _, v19 in ipairs(l_bundleProductInfo_0.items) do
            if v19.type == "UserOutfit" then
                v17 = v19.id;
            end;
        end;
        l_bundleProductInfo_0.costumeId = v17;
        l_bundleProductInfo_0.itemType = v6.Bundle;
        return {
            name = l_bundleProductInfo_0.name, 
            price = l_bundleProductInfo_0.product.priceInRobux or 0, 
            imageUrl = v7(l_bundleProductInfo_0), 
            assetTypeId = nil, 
            productId = l_bundleProductInfo_0.product.id, 
            membershipTypeRequired = nil, 
            itemType = l_bundleProductInfo_0.itemType
        };
    end, 
    [v3.name] = function(_, _)
        return {};
    end
}));
