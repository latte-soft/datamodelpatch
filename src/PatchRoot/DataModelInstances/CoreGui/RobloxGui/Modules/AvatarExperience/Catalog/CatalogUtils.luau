local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.UIBlox);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v5 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local _ = require(l_Modules_0.AvatarExperience.Catalog.Http.WebApi);
local v7 = require(l_Modules_0.LuaApp.Enum.RetrievalStatus);
local l_ItemTileEnums_0 = v2.Tile.ItemTileEnums;
local v9 = require(l_CorePackages_0.Packages.Dash);
local l_memoize_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).memoize;
local v11 = require(l_CorePackages_0.tutils);
local v12 = require(l_CorePackages_0.Packages.t);
local v13 = require(l_Modules_0.AvatarExperience.Catalog.GetCatalogCategories);
local _ = require(l_Modules_0.AvatarExperience.Common.Reducers.CollectiblesItemInfo);
local _ = require(l_Modules_0.AvatarExperience.Common.Reducers.CollectiblesResellersInstances);
local _ = require(l_Modules_0.AvatarExperience.Common.Reducers.CollectiblesResellableInstances);
local _ = require(l_Modules_0.AvatarExperience.Common.Models.CollectibleInfo);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local l_Constants_0 = require(l_CorePackages_0.Workspace.Packages.UserLib).Utils.Constants;
local v20 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v21 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXLimitedBundlesHandleNewData);
local v22 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagCollectiblesCatalogFollowUpForSaleLocation);
local v23 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagIsCollectibleSellableInShopFix);
local v24 = require(l_Modules_0.AvatarExperience.Flags.GetAXInExperienceItemLinking);
local v25 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXGateUGC4ACollectibleAssetsBundles);
local v26 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXFixNoItemsFoundWidgetsResults);
local v27 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXFixItemTypeHandling);
local v28 = {};
if not v27 then
    v28.DEPRECATED_HasAttribution = function(v29)
        if v29 and v29.creatingUniverseId then
            return true;
        else
            return false;
        end;
    end;
    v28.DEPRECATED_GetItemSubType = function(v30, v31)
        if v31 then
            if v30 == v4.ItemType.Asset then
                return v31.assetType;
            elseif v30 == v4.ItemType.Bundle then
                return v31.bundleType;
            else
                return nil;
            end;
        else
            return ;
        end;
    end;
end;
v28.Round = function(v32)
    return (math.floor(v32 + 0.5));
end;
v28.bankersRounding = function(v33)
    local v34 = math.floor(v33);
    if v33 - v34 == 0.5 then
        if v34 % 2 == 0 then
            return v34;
        else
            return v34 + 1;
        end;
    else
        return (math.round(v33));
    end;
end;
if not v27 then
    v28.DEPRECATED_HasPremiumBenefits = function(v35)
        if v35 then
            return v35.premiumPricing ~= nil;
        else
            return false;
        end;
    end;
    v28.DEPRECATED_IsPremiumExclusive = function(v36)
        if v36 then
            local v37 = false;
            if v36.priceInRobux == nil then
                v37 = v28.DEPRECATED_HasPremiumBenefits(v36);
            end;
            return v37;
        else
            return false;
        end;
    end;
    v28.DEPRECATED_IsResellable = function(v38)
        if v38 then
            if v38 then
                local l_numberRobloxHasAvailable_0 = v38.numberRobloxHasAvailable;
                local l_itemRestrictions_0 = v38.itemRestrictions;
                return (l_itemRestrictions_0 and l_itemRestrictions_0[v5.ItemRestrictions.Limited] or l_itemRestrictions_0 and l_itemRestrictions_0[v5.ItemRestrictions.Collectible]) or ((l_itemRestrictions_0 and l_itemRestrictions_0[v5.ItemRestrictions.LimitedUnique]) and l_numberRobloxHasAvailable_0) and l_numberRobloxHasAvailable_0 == 0;
            else
                return ;
            end;
        else
            return false;
        end;
    end;
    if not (not v25() and not v21()) then
        v28.DEPRECATED_isLimitedCollectible = function(v41)
            if v41 then
                return not not v41.itemRestrictions and (v41.itemRestrictions[v5.ItemRestrictions.Collectible] or false);
            else
                return false;
            end;
        end;
        v28.DEPRECATED_hasLimitedQuantity = function(v42)
            if v42 then
                local l_itemRestrictions_1 = v42.itemRestrictions;
                return (l_itemRestrictions_1 and l_itemRestrictions_1[v5.ItemRestrictions.Limited] or l_itemRestrictions_1 and l_itemRestrictions_1[v5.ItemRestrictions.LimitedUnique]) or l_itemRestrictions_1 and l_itemRestrictions_1[v5.ItemRestrictions.Collectible];
            else
                return nil;
            end;
        end;
        v28.DEPRECATED_isUnlimitedCollectibleAsset = function(v44, v45)
            if v44 and v45 then
                return (not v28.DEPRECATED_hasLimitedQuantity(v45) and (v45.collectibleItemId and v45.collectibleItemId ~= "")) and (v44 and v44 == v4.ItemType.Asset);
            else
                return nil;
            end;
        end;
        v28.DEPRECATED_isLimitedBundle = function(v46, v47)
            if v46 and v47 then
                return (v28.DEPRECATED_hasLimitedQuantity(v47) and (v47.collectibleItemId and v47.collectibleItemId ~= "")) and (v46 and v46 == v4.ItemType.Bundle);
            else
                return nil;
            end;
        end;
        v28.DEPRECATED_isUnlimitedCollectibleBundle = function(v48, v49)
            if v48 and v49 then
                return (not v28.DEPRECATED_hasLimitedQuantity(v49) and (v49.collectibleItemId and v49.collectibleItemId ~= "")) and (v48 and v48 == v4.ItemType.Bundle);
            else
                return nil;
            end;
        end;
    end;
end;
v28.isUnlimitedCollectibleAsset = function(v50)
    if v50 then
        assert(v50, "");
        return (not v50.hasLimitedQuantity and (v50.collectibleItemId and v50.collectibleItemId ~= "")) and (v50.itemType and v50.itemType == v4.ItemType.Asset);
    else
        return nil;
    end;
end;
v28.isLimitedBundle = function(v51)
    if v51 then
        assert(v51, "silence type checker");
        return v51.isLimitedBundle;
    else
        return nil;
    end;
end;
v28.isUnlimitedCollectibleBundle = function(v52)
    if v52 then
        assert(v52, "");
        return (not v52.hasLimitedQuantity and (v52.collectibleItemId and v52.collectibleItemId ~= "")) and (v52.itemType and v52.itemType == v4.ItemType.Bundle);
    else
        return nil;
    end;
end;
v28.isOriginalStockSellableInShop = function(v53)
    if not v53 then
        return true;
    else
        local v54 = v53.saleLocationType or v5.SaleLocationType.Invalid;
        local v55 = true;
        if v54 ~= v5.SaleLocationType.ShopOnly then
            v55 = true;
            if v54 ~= v5.SaleLocationType.ShopAndMyExperiences then
                v55 = v54 == v5.SaleLocationType.ShopAndAllExperiences;
            end;
        end;
        return v55;
    end;
end;
v28.isCollectibleSellableInShop = function(v56)
    if v56 then
        assert(v56, "silence type checker");
        local v57 = v28.isOriginalStockSellableInShop(v56);
        local v58 = nil;
        v58 = if not v23() then v56.unitsAvailableForConsumption and v56.unitsAvailableForConsumption > 0 else ((v56.unitsAvailableForConsumption or v56.numberRobloxHasAvailable) or 0) > 0;
        local l_hasResellers_0 = v56.hasResellers;
        if not (v56.resaleRestriction == v5.ResaleRestriction.Disabled) or v58 then
            if not v24() then
                return not not v58 and v57 or l_hasResellers_0;
            else
                return not not v58 and (v57 or v56.experiences and #v56.experiences > 0) or l_hasResellers_0;
            end;
        else
            return false;
        end;
    else
        return true;
    end;
end;
local function _(v60, v61)
    if not (not v60 or not v60.quantityLimitPerUser) and v61 then
        local v62 = false;
        if v60.quantityLimitPerUser > 0 then
            v62 = v60.quantityLimitPerUser <= v11.fieldCount(v61);
        end;
        return v62;
    else
        return false;
    end;
end;
v28.reachQuantityLimit = function(v64, v65)
    if not (not v64 or not v64.quantityLimitPerUser) and v65 then
        local v66 = false;
        if v64.quantityLimitPerUser > 0 then
            v66 = v64.quantityLimitPerUser <= v11.fieldCount(v65);
        end;
        return v66;
    else
        return false;
    end;
end;
v28.shouldShowQuantityLimit = function(v67)
    return v67 and v67 > 0;
end;
v28.GetRbxThumbType = function(v68)
    if v68 == v4.ItemType.Asset then
        return l_Constants_0.RbxthumbTypes.Asset;
    elseif v68 == v4.ItemType.Bundle then
        return l_Constants_0.RbxthumbTypes.BundleThumbnail;
    else
        return nil;
    end;
end;
v28.GetSponsoredItemsKey = function(v69, v70)
    return v5.SponsoredItemsDataKey .. "." .. tostring(v69) .. "." .. tostring(v70);
end;
v28.GetItemDetailsKey = function(v71, v72)
    if v71 and v72 then
        return v5.ItemDetailsKey .. v71 .. v72;
    else
        return v5.ItemDetailsKey;
    end;
end;
v28.GetBatchItemDetailsKey = function(v73, v74)
    if v73 and v74 then
        return v5.BatchItemDetailsKey .. v74 .. table.concat(v73, ",");
    else
        return v5.BatchItemDetailsKey;
    end;
end;
v28.GetSortDataStatus = function(v75, v76, v77)
    local v78 = v75.AvatarExperience.Catalog.SortsContents.DataStatus[v76];
    if v78 then
        local v79 = v78[v77];
        if v79 then
            return v79;
        end;
    end;
    return v7.NotStarted;
end;
if v26() then
    v28.getFetchWidgetInfoFetchKey = function(v80, v81)
        return v5.FetchWidgetInfoKey .. (v80 or "") .. (v81 or "");
    end;
end;
if not v27 then
    v28.DEPRECATED_GetStatus = function(v82)
        if v82 then
            local l_itemStatus_0 = v82.itemStatus;
            if l_itemStatus_0 then
                if #l_itemStatus_0 == 0 then
                    return ;
                else
                    local v84 = {};
                    for _, v86 in l_itemStatus_0, nil, nil do
                        v84[v86] = true;
                    end;
                    local v87 = nil;
                    local v88 = nil;
                    if not v84[v5.ItemStatus.Sale] then
                        if v84[v5.ItemStatus.New] then
                            v87 = l_ItemTileEnums_0.StatusStyle.Info;
                            v88 = v5.ItemStatusLocale.New;
                        end;
                        return v87, v88;
                    else
                        return l_ItemTileEnums_0.StatusStyle.Alert, v5.ItemStatusLocale.Sale;
                    end;
                end;
            else
                return ;
            end;
        else
            return ;
        end;
    end;
    v28.DEPRECATED_getIsTradable = function(v89)
        local v90 = v89 and v89.itemRestrictions;
        if v90 then
            if not v90[v5.ItemRestrictions.Limited] then
                if not v90[v5.ItemRestrictions.LimitedUnique] then
                    if not v90[v5.ItemRestrictions.Collectible] then
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
    end;
end;
v28.splitEntries = l_memoize_0(function(v91, v92, v93)
    local v94 = math.max(1, 1 + (v92 - 1) * v93);
    return v9.slice(v91, 1, v94 - 1), (v9.slice(v91, v94));
end);
v28.getTopicRequestKey = function(v95, v96, v97)
    local v98 = not v97 and "" or ("[%*]"):format(v97 or "");
    if #v95 > 0 then
        local v99 = table.clone(v95);
        table.sort(v99);
        v98 = v98 .. table.concat(v99, ",");
    end;
    if #v98 > 0 then
        return v98;
    elseif not v96 then
        return "";
    else
        return table.concat(v9.map(v96, function(v100)
            return tostring(v100.itemType) .. tostring(v100.targetId);
        end, ","));
    end;
end;
local v101 = nil;
local function v111(v102)
    for _, v104 in (v13()), nil, nil do
        if not v104.Subcategories then
            if v104.AssetTypeIdStrings then
                for _, v106 in v104.AssetTypeIdStrings, nil, nil do
                    if v106 == v102 then
                        return true;
                    end;
                end;
            end;
        else
            for _, v108 in v104.Subcategories, nil, nil do
                if not (not (v108.Name ~= "Community") or not v108.AssetTypeIdStrings) then
                    for _, v110 in v108.AssetTypeIdStrings, nil, nil do
                        if v110 == v102 then
                            return true;
                        end;
                    end;
                end;
            end;
        end;
    end;
    return false;
end;
v28.doesAssetTypeHaveCatalogPage = function(v112)
    if not v101 then
        v101 = {};
        for _, v114 in v4.AssetTypeIdStrings, nil, nil do
            if v111(v114) then
                v101[v114] = true;
            end;
        end;
    end;
    return v101[v112] == true;
end;
v28.getRecommendedItemsGridItemTitleHeight = function(v115)
    return (v115.BaseSize * v115.Header2.RelativeSize) * 2;
end;
v28.findCheapestCollectiblePurchaseInfo = l_memoize_0(function(v116, v117, v118, v119)
    local v120 = {};
    if v116 then
        assert(v116, "silence type checker");
        local v121 = v117[v116];
        if not (not v121 or not v121.unitsAvailableForConsumption) and v121.price then
            local v122 = true;
            if v22() then
                v122 = v28.isOriginalStockSellableInShop(v121);
            end;
            local v123 = false;
            if not ((not v121.quantityLimitPerUser or not v119) or not v119[v116]) then
                local v124 = v119[v116];
                if not (not v121 or not v121.quantityLimitPerUser) and v124 then
                    v123 = false;
                    if v121.quantityLimitPerUser > 0 then
                        v123 = v121.quantityLimitPerUser <= v11.fieldCount(v124);
                    end;
                else
                    v123 = false;
                end;
            end;
            if not (not v122 or v123) and v121.unitsAvailableForConsumption > 0 then
                v120.price = v121.price;
            end;
            local v125 = v118[v116];
            if v125 and #v125.InstanceIdsList > 0 then
                local v126 = v125.Instances[v125.InstanceIdsList[1]];
                if not (((v122 and v121.unitsAvailableForConsumption ~= 0) and v126.price >= v120.price) and not v123) then
                    v120.collectibleInstanceId = v126.collectibleInstanceId;
                    v120.price = v126.price;
                    v120.expectedSellerId = v126.seller.sellerId;
                    v120.sellerName = v126.seller.name;
                end;
            end;
            return v120;
        else
            return v120;
        end;
    else
        return v120;
    end;
end);
if v21() then
    v28.findCheapestCollectiblePurchaseInfoV2 = function(v127, v128, v129, v130, v131)
        local v132 = {};
        if v127 then
            assert(v127, "silence type checker");
            local v133 = v129[v127];
            if not v133 or v128 then
                return (v28.findCheapestCollectiblePurchaseInfo(v127, v129, v130, v131));
            else
                v132.price = v133.price;
                return v132;
            end;
        else
            return v132;
        end;
    end;
end;
v28.getQueryStringForSearchWidgets = function(v134)
    if v134 and v134.searchKeyword then
        local v135 = {
            v134.searchKeyword
        };
        if not (not v134.sortAndFilters or not v134.sortAndFilters.SelectedTopics) then
            for _, v137 in v134.sortAndFilters.SelectedTopics, nil, nil do
                table.insert(v135, 1, v137);
            end;
        end;
        return table.concat(v135, " ");
    else
        return nil;
    end;
end;
v28.getCategoryName = function(v138)
    assert(v12.number(v138), "Expected categoryIndex to be a number");
    local v139 = v13()[v138];
    return v139 and v139.Name;
end;
v28.getSubcategoryName = function(v140, v141)
    assert(v12.tuple(v12.number, v12.number)(v140, v141), "Expected categoryIndex and subcategoryIndex to be numbers");
    local v142 = nil;
    local v143 = v13()[v140];
    if v143 then
        local v144 = v143.Subcategories and v143.Subcategories[v141];
        v142 = v144 and v144.Name;
    end;
    return v142;
end;
v28.getContextStringForWidgets = function(v145)
    assert(v12.array(v12.string)(v145));
    return (string.lower((string.gsub(string.gsub(table.concat(v145, ":"), " ", "-"), "%.", "-"))));
end;
v28.getContextForWidgets = function(v146, v147, v148)
    assert(v12.tuple(v12.string, v12.number, v12.optional(v12.number))(v146, v147, v148));
    local v149 = v20.AnalyticsContext[v146];
    local v150 = v28.getCategoryName(v147);
    if not v149 or not v150 then
        return nil;
    else
        local v151 = {
            (("%*-tab"):format(v149))
        };
        table.insert(v151, v150);
        if v148 and v148 ~= 0 then
            local v152 = v28.getSubcategoryName(v147, v148);
            if v152 then
                table.insert(v151, v152);
            end;
            if not (not v148 or v152) then
                return nil;
            end;
        end;
        return v28.getContextStringForWidgets(v151);
    end;
end;
return v28;
