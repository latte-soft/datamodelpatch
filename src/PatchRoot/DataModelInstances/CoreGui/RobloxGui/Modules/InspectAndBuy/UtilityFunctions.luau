local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.Constants);
local v2 = require(l_Parent_0.Flags.GetFFlagIBGateUGC4ACollectibleAssetsBundles);
local v3 = require(l_Parent_0.Flags.GetFFlagIBEnableCollectiblesSystemSupport);
local v4 = require(l_Parent_0.Flags.GetFFlagIBEnableLimitedItemBugFixAndAlignment);
local v5 = require(l_Parent_0.Flags.GetFFlagIBEnableNewDataCollectionForCollectibleSystem);
local v8 = {
    getBundleId = function(v6)
        if not v5() then
            if v6.bundlesAssetIsIn then
                return v6.bundlesAssetIsIn[1];
            else
                return nil;
            end;
        elseif v6.parentBundleId ~= nil then
            return v6.parentBundleId;
        else
            return nil;
        end;
    end, 
    isCollectibles = function(v7)
        return (v7 and v7.productType) and v7.productType == v1.ProductType.CollectibleItem;
    end
};
if not (not v2() and not v3()) then
    v8.hasLimitedQuantity = function(v9)
        if v9 then
            return (v9.isLimited or if not v3() then nil else v9.isLimitedUnique) or v9.collectibleIsLimited;
        else
            return nil;
        end;
    end;
    if v4() then
        v8.isLimited1Point0 = function(v10)
            if v10 then
                return v10.isLimited or v10.isLimitedUnique;
            else
                return nil;
            end;
        end;
        v8.isLimited1Point0_LimitedUnique = function(v11)
            if v11 then
                return v11.isLimitedUnique;
            else
                return nil;
            end;
        end;
        v8.isLimited2Point0_Or_LimitedCollectible = function(v12)
            if v12 then
                return v12.collectibleIsLimited;
            else
                return nil;
            end;
        end;
    end;
    v8.isUnlimitedCollectibleAsset = function(v13, v14)
        if v13 and v14 then
            return (not v8.hasLimitedQuantity(v14) and v14.productType == v1.ProductType.CollectibleItem) and v13 == v1.ItemType.Asset;
        else
            return nil;
        end;
    end;
    v8.isLimitedBundle = function(v15, v16)
        if v15 and v16 then
            return v16.collectibleIsLimited and v15 == v1.ItemType.Bundle;
        else
            return nil;
        end;
    end;
    v8.isUnlimitedCollectibleBundle = function(v17, v18)
        if v17 and v18 then
            return (not v18.collectibleIsLimited and v18.productType == v1.ProductType.CollectibleItem) and v17 == v1.ItemType.Bundle;
        else
            return nil;
        end;
    end;
    v8.isLimitedCollectible = function(v19)
        if v19 then
            return v8.hasLimitedQuantity(v19) and v19.productType == v1.ProductType.CollectibleItem;
        else
            return nil;
        end;
    end;
end;
return v8;
