local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local l_Focusable_0 = require(l_CorePackages_0.Packages.RoactGamepad).Focusable;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.useNavigation;
local l_NumberLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).NumberLocalization;
local v8 = require(l_Modules_0.AvatarExperience.Common.Selectors.DEPRECATED_ItemData);
local v9 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectItemInfo);
local v10 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXFixItemTypeHandling);
local v11 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXEnableOutfitAttribution);
local v12 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.ItemInfo.AttributionItemInfoRow);
local v13 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.ItemInfo.ItemInfoRow);
local v14 = require(l_Modules_0.AvatarExperience.Catalog.Hooks.DEPRECATED_useItemDataDigest);
local v15 = require(l_Modules_0.AvatarExperience.Common.Hooks.useItemInfoDigest);
local v16 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v17 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v18 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local v19 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local v20 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.FetchAssetResaleData);
local v21 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.FetchAssetVersionData);
local _ = require(l_Modules_0.AvatarExperience.Common.Models.CollectibleInfo);
local v23 = require(l_Modules_0.LuaApp.Http.UrlBuilder);
local v24 = require(l_Modules_0.LuaApp.AppPage);
local v25 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v26 = require(l_Modules_0.LuaApp.Services.RoactLocalization);
local v27 = require(l_Modules_0.LuaApp.Hooks.useLocalization);
local v28 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local v29 = require(l_Modules_0.LuaApp.Hooks.useAppPolicy);
local v30 = game:DefineFastFlag("UseItemDataHookRefactor", false);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v32 = require(l_Modules_0.AvatarExperience.Flags.FFlagEnableAttributionItemRow);
local v33 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagEnableCollectiblesSaleLocationCheck);
local v34 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXLimitedBundlesHandleNewData);
local function _(v35, v36)
    if v35 then
        return l_NumberLocalization_0.localize(v35, v36:GetLocale());
    else
        return nil;
    end;
end;
local function v43(v38, v39, v40)
    local v41 = nil;
    local _ = nil;
    if not v10 then
        v41 = if not v38 then if v40 and v40.product then v40.product.id else nil else v38.collectibleProductId;
        if not v38 then
            if not v40 then
                return v41, nil;
            else
                return v41, v40.creator;
            end;
        else
            return v41, v38.creator;
        end;
    else
        v41 = if not v38 then if v39 then v39.productId else nil else v38.collectibleProductId;
        if not v38 then
            if not v39 then
                return v41, nil;
            else
                return v41, v39.creator;
            end;
        else
            return v41, v38.creator;
        end;
    end;
end;
local _ = function(v44, v45, v46)
    local _ = nil;
    if not v11 or not v46 then
        if not v10 then
            if not v45 then
                return nil;
            else
                return v45.creatingUniverseId;
            end;
        elseif not v44 then
            return nil;
        else
            return v44.creatingUniverseId;
        end;
    else
        return v46.creatingUniverseId;
    end;
end;
return (v2.forwardRef(function(v49, v50)
    local v51 = nil;
    local v52 = nil;
    local v53 = nil;
    local v54 = nil;
    local v55 = nil;
    local v56 = nil;
    local v57 = nil;
    local v58 = nil;
    if not v10 then
        v57 = l_useSelector_0(function(v59)
            return v8(v59.AvatarExperience.Common, v49.itemId, v49.itemType);
        end);
    else
        v58 = l_useSelector_0(function(v60)
            return v9(v60.AvatarExperience, v49.itemId, v49.itemType);
        end);
    end;
    (function()
        if not v10 then
            if v57 then
                v51 = v57.collectibleItemId;
                local l_resellerUserAssetIds_0 = v57.resellerUserAssetIds;
                local l_l_resellerUserAssetIds_0_0 = l_resellerUserAssetIds_0;
                if l_l_resellerUserAssetIds_0_0 then
                    l_l_resellerUserAssetIds_0_0 = false;
                    if #l_resellerUserAssetIds_0 > 0 then
                        l_l_resellerUserAssetIds_0_0 = l_resellerUserAssetIds_0[1];
                    end;
                end;
                v52 = l_l_resellerUserAssetIds_0_0;
                v54 = if not v57.creator then nil else v57.creator.id;
                v55 = if not v57.creator then nil else v57.creator.type;
                v56 = v18.DEPRECATED_GetItemSubType(v49.itemType, v57);
                v53 = if not v34() then v51 else v18.DEPRECATED_isLimitedCollectible(v57);
            end;
        elseif v58 then
            v51 = v58.collectibleItemId;
            local l_resellerUserAssetIds_1 = v58.resellerUserAssetIds;
            local l_l_resellerUserAssetIds_1_0 = l_resellerUserAssetIds_1;
            if l_l_resellerUserAssetIds_1_0 then
                l_l_resellerUserAssetIds_1_0 = false;
                if #l_resellerUserAssetIds_1 > 0 then
                    l_l_resellerUserAssetIds_1_0 = l_resellerUserAssetIds_1[1];
                end;
            end;
            v52 = l_l_resellerUserAssetIds_1_0;
            v54 = if not v58.creator then nil else v58.creator.id;
            v55 = if not v58.creator then nil else v58.creator.type;
            v56 = if not v58 then nil else v58.itemSubType;
            v53 = if not v34() then v51 else v58.isLimitedCollectible;
            return ;
        end;
    end)();
    local v66 = v29(function(v65)
        return v65.getWebViewSupport();
    end);
    local v67 = {
        v51
    };
    if v34() then
        v67 = {
            v51, 
            v53
        };
    end;
    local v69 = l_useSelector_0((v2.useCallback(function(v68)
        if not v51 then
            return nil;
        else
            return v68.AvatarExperience.Common.Collectibles.CollectiblesItemInfo[v51];
        end;
    end, {
        v51
    })));
    local v71 = if v30 then nil else l_useSelector_0((v2.useCallback(function(v70)
        if not v34() or v53 then
            if not v51 then
                return nil;
            else
                return v70.AvatarExperience.Common.Collectibles.CollectiblesResellableInstances[v51];
            end;
        else
            return nil;
        end;
    end, v67)));
    local v73 = l_useSelector_0(function(v72)
        return v72.UserRobux[v72.LocalUserId];
    end);
    local v79 = l_useSelector_0(function(v74)
        if not v51 then
            if not v52 then
                return nil;
            else
                local v75 = v74.AvatarExperience.Catalog.UserAssets[v52];
                if not v75 then
                    return nil;
                else
                    return v75.priceInRobux;
                end;
            end;
        elseif not v34() or v53 then
            local v76 = v74.AvatarExperience.Common.Collectibles.CollectiblesResellersInstances[v51];
            local l_v76_0 = v76;
            if l_v76_0 then
                l_v76_0 = false;
                if #v76.InstanceIdsList > 0 then
                    l_v76_0 = v76.InstanceIdsList[1];
                end;
            end;
            local v78 = if not l_v76_0 then nil else v76.Instances[l_v76_0];
            if not v78 then
                return nil;
            else
                return v78.price;
            end;
        else
            return nil;
        end;
    end);
    local v80 = l_useDispatch_0();
    local v81 = l_useNavigation_0();
    local v82 = v28(v25);
    local v83 = v2.useCallback(function()
        if v54 then
            v81.navigate(v24.GenericWebPage, {
                detail = if v55 == v16.CreatorType.Group then v23.user.group({
                    groupId = v54
                }) else v23.user.profile({
                    userId = v54
                }), 
                extraProps = {
                    titleKey = "CommonUI.Features.Label.Profile"
                }
            });
        end;
    end, {
        v54, 
        v55
    });
    local v84 = v2.useCallback(function()
        v81.navigate(v19.ResellersPage, {
            itemId = v49.itemId, 
            collectibleItemId = v51, 
            itemType = v49.itemType, 
            fromProfile = v81.getParam("fromProfile")
        });
    end, {
        v81, 
        v49.itemId, 
        v57, 
        v58, 
        v49.itemType, 
        v81.getParam("fromProfile")
    });
    local v85 = nil;
    local v86 = nil;
    if v49.itemType == v17.ItemType.Asset then
        v85 = v17.AssetCategoriesLocalized[v17.AssetTypeIdToCategory[v56]];
        v86 = v17.AssetTypeLocalized[v56];
    end;
    local v87 = v28(v26);
    local v88 = v27({
        bundle = "Feature.Catalog.Label.Bundle", 
        category = v85, 
        subType = v86, 
        yesText = "Feature.Catalog.Label.Yes", 
        noText = "Feature.Catalog.Label.No", 
        noneText = "Feature.Catalog.Label.None", 
        fromResalePrice = {
            "Feature.Catalog.Label.FromPrice"; 
            itemPrice = v16.RobloxEmoji.Robux .. (not v79 and "" or l_NumberLocalization_0.localize(v79, v87:GetLocale()))
        }
    });
    local v89 = if (v49.itemType == v17.ItemType.Asset and v88.category) and v88.subType then ("%* | %*"):format(v88.category, v88.subType) else if v49.itemType == v17.ItemType.Bundle then v88.bundle else "";
    local v90 = nil;
    local v91 = nil;
    local v92 = nil;
    local v93 = nil;
    local v94 = nil;
    local v95 = nil;
    local v96 = nil;
    local v97 = nil;
    local v98 = nil;
    local v99 = nil;
    local v100 = nil;
    local v101 = nil;
    local v102 = nil;
    local v103 = false;
    (function()
        if not v10 then
            if not v30 then
                v90 = v18.DEPRECATED_IsResellable(v57);
                v91 = v18.DEPRECATED_getIsTradable(v57);
                v92 = if not v32 then nil else v18.DEPRECATED_HasAttribution(v57);
                v101 = 0;
                v93 = false;
                v94 = false;
                v95 = not not v57 and if v57.resellerUserAssetIds then #v57.resellerUserAssetIds > 0 else false;
                v97 = if not not v57 and v57.soldCount then v57.soldCount else 0;
                v98 = if not not v57 and v57.totalQuantity then v57.totalQuantity else 0;
                v99 = if not not v57 and v57.originalPrice then v57.originalPrice else 0;
                v100 = if not not v57 and v57.averagePrice then v57.averagePrice else 0;
                if v69 then
                    v102 = if not v69.resaleRestriction then v16.ResaleRestriction.None else v69.resaleRestriction;
                    v95 = not not v69.hasResellers and v69.hasResellers;
                    local v104 = v69.assetStock or 0;
                    local v105 = v69.unitsAvailableForConsumption or 0;
                    v97 = if not not v104 and v105 then v104 - v105 else 0;
                    v99 = v69.price or 0;
                    v100 = v69.recentAveragePrice or 0;
                    v98 = v69.assetStock or 0;
                    v101 = v69.quantityLimitPerUser or 0;
                    v94 = v18.reachQuantityLimit(v69, v71);
                    v93 = v18.shouldShowQuantityLimit(v101);
                end;
                v96 = v97 < v98;
                if v33() then
                    v96 = v96 and v18.isOriginalStockSellableInShop(v69);
                end;
            else
                local v106 = v14(v49.itemId, v49.itemType);
                v90 = v106.isResellable;
                v91 = v106.isTradable;
                v92 = v106.hasAttribution;
                v93 = v106.shouldShowQuantityLimit;
                v94 = v106.reachedQuantityLimit;
                v95 = v106.hasResellers;
                v97 = v106.soldCount;
                v98 = v106.itemStock;
                v99 = v106.originalPrice;
                v100 = v106.averagePrice;
                v101 = v106.quantityLimit;
                v96 = v106.isStockAvailable;
                v102 = v106.collectiblesResaleRestriction;
            end;
            if not ((not v90 or not v57) or v51) then
                v103 = true;
            end;
        else
            local v107 = v15(v49.itemId, v49.itemType);
            v90 = v107.isResellable;
            v91 = v107.isTradable;
            v92 = v107.hasAttribution;
            v93 = v107.shouldShowQuantityLimit;
            v94 = v107.reachedQuantityLimit;
            v95 = v107.hasResellers;
            v96 = v107.isStockAvailable;
            v97 = v107.soldCount;
            v98 = v107.itemStock;
            v99 = v107.originalPrice;
            v100 = v107.averagePrice;
            v101 = v107.quantityLimit;
            v102 = v107.collectiblesResaleRestriction;
            if not ((not v90 or not v58) or v51) then
                v103 = true;
                return ;
            end;
        end;
    end)();
    if not (not v11 or not v49.outfitInfo) then
        v92 = v49.outfitInfo.creatingUniverseId ~= nil;
    end;
    local v108 = false;
    if v102 == v16.ResaleRestriction.Disabled then
        v108 = not v96;
    end;
    local l_v97_0 = v97;
    local v110 = if l_v97_0 then l_NumberLocalization_0.localize(l_v97_0, v87:GetLocale()) else nil;
    local l_v98_0 = v98;
    l_v97_0 = if l_v98_0 then l_NumberLocalization_0.localize(l_v98_0, v87:GetLocale()) else nil;
    local l_v99_0 = v99;
    l_v98_0 = if l_v99_0 then l_NumberLocalization_0.localize(l_v99_0, v87:GetLocale()) else nil;
    local v113;
    l_v99_0, v113 = v43(v69, v58, v57);
    local v117 = v2.useCallback(function()
        local v114 = if not v113 then nil else v113.id;
        local v115 = if not v113 then nil else v113.name;
        local v116 = v81.getParam("fromProfile");
        if not (not v99 or not v73) and v99 <= v73 then
            v81.navigate(v19.PurchaseCatalogItem, {
                itemId = v49.itemId, 
                itemType = v49.itemType, 
                productId = l_v99_0, 
                priceInRobux = v99, 
                sellerId = v114, 
                sellerName = v115, 
                userAssetId = nil, 
                collectibleInstanceId = nil, 
                fromProfile = v116
            });
            return ;
        else
            v81.navigate(v19.InsufficientRobuxPrompt, {});
            return ;
        end;
    end, {
        l_v99_0, 
        v113, 
        v69, 
        v81, 
        v49.itemId, 
        v49.itemType, 
        v99
    });
    v2.useEffect(function()
        if v103 then
            v80(v20(v82, v49.itemId));
        end;
        if v32 and v49.itemType == v17.ItemType.Asset then
            v80(v21(v82, v49.itemId));
        end;
    end, {
        v103, 
        v82, 
        v49.itemId
    });
    local v118;
    if not v11 then
        local l_v58_0 = v58;
        local l_v57_0 = v57;
        local _ = nil;
        v118 = if not v10 then if l_v57_0 then l_v57_0.creatingUniverseId else nil else if l_v58_0 then l_v58_0.creatingUniverseId else nil;
    else
        local l_v58_1 = v58;
        local l_v57_1 = v57;
        local l_outfitInfo_0 = v49.outfitInfo;
        local _ = nil;
        v118 = if not not v11 and l_outfitInfo_0 then l_outfitInfo_0.creatingUniverseId else if not v10 then if l_v57_1 then l_v57_1.creatingUniverseId else nil else if l_v58_1 then l_v58_1.creatingUniverseId else nil;
    end;
    local l_createElement_0 = v2.createElement;
    local l_Frame_0 = l_Focusable_0.Frame;
    local v128 = {
        Size = UDim2.fromScale(1, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        LayoutOrder = v49.LayoutOrder
    };
    local v129 = {
        Layout = v2.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        Creator = v2.createElement(v13, {
            infoName = "Feature.Catalog.Label.Filter.Creator", 
            infoData = not v113 and "" or v113.name, 
            onActivate = if v66 then v83 else nil, 
            hasVerifiedBadge = not not v113 and v113.hasVerifiedBadge, 
            LayoutOrder = 2
        }), 
        Attribution = (v32 and v92) and v2.createElement(v12, {
            infoName = "Feature.Catalog.Label.Attribution", 
            creatingUniverseId = v118, 
            LayoutOrder = 3, 
            attributionRef = v49.attributionRef, 
            NextSelectionUp = if not v90 then v49.NextSelectionUp else v49.resellerRef, 
            NextSelectionDown = v49.NextSelectionDown
        })
    };
    local l_createElement_1 = v2.createElement;
    local l_v13_0 = v13;
    local v132 = {
        infoName = "Feature.Catalog.Label.CategoryType", 
        infoData = v89
    };
    local v133 = false;
    if v91 == nil then
        v133 = not v90 and not v93;
    end;
    v132.hideDivider = v133;
    v132.LayoutOrder = not v32 and 3 or 4;
    v129.CategoryType = l_createElement_1(l_v13_0, v132);
    l_createElement_1 = false;
    if v91 ~= nil then
        l_createElement_1 = v2.createElement(v13, {
            infoName = "Feature.Catalog.Label.Tradable", 
            infoData = if not v91 then v88.noText else v88.yesText, 
            hideDivider = not v90 and not v93, 
            LayoutOrder = not v32 and 4 or 5
        });
    end;
    v129.Tradeability = l_createElement_1;
    l_createElement_1 = false;
    if v102 == v16.ResaleRestriction.Disabled then
        l_createElement_1 = v2.createElement(v13, {
            infoName = "Feature.Catalog.Label.Resellable", 
            infoData = v88.noText, 
            hideDivider = not v90 and not v93, 
            LayoutOrder = not v32 and 5 or 6
        });
    end;
    v129.Resellability = l_createElement_1;
    v129.QuantityLimit = v93 and v2.createElement(v13, {
        infoName = "Feature.Catalog.Label.MaxPerUser", 
        infoData = v101, 
        hideDivider = not v90, 
        LayoutOrder = not v32 and 6 or 7
    });
    l_createElement_1 = v90;
    if l_createElement_1 then
        l_createElement_1 = v2.createElement;
        l_v13_0 = v2.Fragment;
        v132 = nil;
        v133 = {};
        local v134 = false;
        if v102 ~= v16.ResaleRestriction.Disabled then
            v134 = v2.createElement(l_Focusable_0[v13], {
                infoName = "Feature.Catalog.Heading.Resellers", 
                infoData = if v95 then if v79 then v88.fromResalePrice else "" else v88.noneText, 
                onActivate = if not v95 then nil else v84, 
                TextScaled = true, 
                LayoutOrder = 1, 
                ref = if not v32 then v50 else v49.resellerRef, 
                NextSelectionUp = v49.NextSelectionUp, 
                NextSelectionDown = if not not v32 and v92 then v49.attributionRef else v49.NextSelectionDown
            });
        end;
        v133.Sellers = v134;
        v133.SoldCount = v2.createElement(v13, {
            infoName = "Feature.Catalog.Label.QuantitySold", 
            infoData = if v98 == 0 then v110 else ("%*/%*"):format(v110, l_v97_0), 
            TextScaled = true, 
            LayoutOrder = not v32 and 7 or 8
        });
        v133.Price = v2.createElement(v13, {
            infoName = v102 == v16.ResaleRestriction.Disabled and "Feature.Catalog.Label.Price" or "Feature.Catalog.Label.OriginalPrice", 
            infoData = not l_v98_0 and "" or v16.RobloxEmoji.Robux .. l_v98_0, 
            onActivate = if not v96 or v94 then nil else v117, 
            LayoutOrder = (v96 or v108) and 0 or (v32 and 9 or 8)
        });
        v133.AveragePrice = v2.createElement(v13, {
            infoName = "Feature.Catalog.Label.AveragePrice", 
            infoData = tostring(v100), 
            hideDivider = true, 
            LayoutOrder = not v32 and 9 or 10
        });
        l_createElement_1 = l_createElement_1(l_v13_0, v132, v133);
    end;
    v129.ResellerInfo = l_createElement_1;
    return l_createElement_0(l_Frame_0, v128, v129);
end));
