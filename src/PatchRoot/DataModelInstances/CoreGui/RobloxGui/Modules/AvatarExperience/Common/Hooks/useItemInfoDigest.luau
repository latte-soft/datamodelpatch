local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local v4 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectItemInfo);
local v5 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local _ = require(l_Modules_0.AvatarExperience.Common.Models.CollectibleInfo);
local v7 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v9 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagEnableCollectiblesSaleLocationCheck);
local v10 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXLimitedBundlesHandleNewData);
return function(v11, v12)
    local v14 = l_useSelector_0(function(v13)
        return v4(v13.AvatarExperience, v11, v12);
    end);
    local v15 = if not v14 then nil else v14.collectibleItemId;
    local v16 = if not v10() then nil else v14 and v14.isLimitedCollectible;
    local v18 = l_useSelector_0((v2.useCallback(function(v17)
        if not v15 then
            return nil;
        else
            return v17.AvatarExperience.Common.Collectibles.CollectiblesItemInfo[v15];
        end;
    end, {
        v15
    })));
    local v20 = l_useSelector_0((v2.useCallback(function(v19)
        if not v10() or v16 then
            if not v15 then
                return nil;
            else
                return v19.AvatarExperience.Common.Collectibles.CollectiblesResellableInstances[v15];
            end;
        else
            return nil;
        end;
    end, {
        v15, 
        if not v10() then nil else v16
    })));
    local v21 = false;
    local v22 = false;
    local v23 = false;
    if v14 then
        if v14.isResellable then
            v21 = true;
        end;
        if v14.isTradeable then
            v22 = true;
        end;
        if v14.hasAttribution then
            v23 = true;
        end;
    end;
    local v24 = 0;
    local v25 = false;
    local v26 = false;
    local v27 = not not v14 and if v14.resellerUserAssetIds then #v14.resellerUserAssetIds > 0 else false;
    local v28 = if not not v14 and v14.soldCount then v14.soldCount else 0;
    local v29 = if not not v14 and v14.totalQuantity then v14.totalQuantity else 0;
    local v30 = if not not v14 and v14.originalPrice then v14.originalPrice else 0;
    local v31 = if not not v14 and v14.averagePrice then v14.averagePrice else 0;
    local l_None_0 = v7.ResaleRestriction.None;
    if v18 then
        l_None_0 = if not v18.resaleRestriction then v7.ResaleRestriction.None else v18.resaleRestriction;
        v27 = not not v18.hasResellers and v18.hasResellers;
        local v33 = v18.assetStock or 0;
        local v34 = v18.unitsAvailableForConsumption or 0;
        v28 = if not not v33 and v34 then v33 - v34 else 0;
        v30 = v18.price or 0;
        v31 = v18.recentAveragePrice or 0;
        v29 = v18.assetStock or 0;
        v24 = v18.quantityLimitPerUser or 0;
        v26 = v5.reachQuantityLimit(v18, v20);
        v25 = v5.shouldShowQuantityLimit(v24);
    end;
    local v35 = v28 < v29;
    if v9() then
        v35 = v35 and v5.isOriginalStockSellableInShop(v18);
    end;
    return {
        averagePrice = v31, 
        hasResellers = v27, 
        hasAttribution = v23, 
        isStockAvailable = v35, 
        isTradeable = v22, 
        isResellable = v21, 
        itemStock = v29, 
        originalPrice = v30, 
        collectiblesResaleRestriction = l_None_0, 
        quantityLimit = v24, 
        reachedQuantityLimit = v26, 
        shouldShowQuantityLimit = v25, 
        soldCount = v28
    };
end;
