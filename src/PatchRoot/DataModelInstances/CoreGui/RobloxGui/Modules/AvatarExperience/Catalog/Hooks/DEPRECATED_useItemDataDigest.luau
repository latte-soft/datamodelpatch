local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local v4 = require(l_Modules_0.AvatarExperience.Common.Selectors.DEPRECATED_ItemData);
local v5 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local _ = require(l_Modules_0.AvatarExperience.Common.Models.CollectibleInfo);
local v7 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v9 = require(l_Modules_0.AvatarExperience.Flags.FFlagEnableAttributionItemRow);
local v10 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagEnableCollectiblesSaleLocationCheck);
local v11 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXLimitedBundlesHandleNewData);
return function(v12, v13)
    local v15 = l_useSelector_0(function(v14)
        return v4(v14.AvatarExperience.Common, v12, v13);
    end);
    local v16 = if not v15 then nil else v15.collectibleItemId;
    local v17 = if not v11() then nil else v5.DEPRECATED_isLimitedCollectible(v15);
    local v19 = l_useSelector_0((v2.useCallback(function(v18)
        if not v16 then
            return nil;
        else
            return v18.AvatarExperience.Common.Collectibles.CollectiblesItemInfo[v16];
        end;
    end, {
        v16
    })));
    local v21 = l_useSelector_0((v2.useCallback(function(v20)
        if not v11() or v17 then
            if not v16 then
                return nil;
            else
                return v20.AvatarExperience.Common.Collectibles.CollectiblesResellableInstances[v16];
            end;
        else
            return nil;
        end;
    end, {
        v16, 
        if not v11() then nil else v17
    })));
    local v22 = v5.DEPRECATED_IsResellable(v15) or false;
    local v23 = v5.DEPRECATED_getIsTradable(v15);
    local v24 = if not v9 then nil else v5.DEPRECATED_HasAttribution(v15);
    local v25 = 0;
    local v26 = false;
    local v27 = false;
    local v28 = not not v15 and if v15.resellerUserAssetIds then #v15.resellerUserAssetIds > 0 else false;
    local v29 = if not not v15 and v15.soldCount then v15.soldCount else 0;
    local v30 = if not not v15 and v15.totalQuantity then v15.totalQuantity else 0;
    local v31 = if not not v15 and v15.originalPrice then v15.originalPrice else 0;
    local v32 = if not not v15 and v15.averagePrice then v15.averagePrice else 0;
    local l_None_0 = v7.ResaleRestriction.None;
    if v19 then
        l_None_0 = if not v19.resaleRestriction then v7.ResaleRestriction.None else v19.resaleRestriction;
        v28 = not not v19.hasResellers and v19.hasResellers;
        local v34 = v19.assetStock or 0;
        local v35 = v19.unitsAvailableForConsumption or 0;
        v29 = if not not v34 and v35 then v34 - v35 else 0;
        v31 = v19.price or 0;
        v32 = v19.recentAveragePrice or 0;
        v30 = v19.assetStock or 0;
        v25 = v19.quantityLimitPerUser or 0;
        v27 = v5.reachQuantityLimit(v19, v21);
        v26 = v5.shouldShowQuantityLimit(v25);
    end;
    local v36 = v29 < v30;
    if v10() then
        v36 = v36 and v5.isOriginalStockSellableInShop(v19);
    end;
    return {
        averagePrice = v32, 
        hasResellers = v28, 
        isResellable = v22, 
        hasAttribution = v24, 
        isStockAvailable = v36, 
        isTradable = v23, 
        itemStock = v30, 
        originalPrice = v31, 
        collectiblesResaleRestriction = l_None_0, 
        quantityLimit = v25, 
        reachedQuantityLimit = v27, 
        shouldShowQuantityLimit = v26, 
        soldCount = v29
    };
end;
