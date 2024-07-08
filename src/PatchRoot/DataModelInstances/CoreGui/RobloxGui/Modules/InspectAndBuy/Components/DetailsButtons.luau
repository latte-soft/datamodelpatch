local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_GuiService_0 = game:GetService("GuiService");
local l_Players_0 = game:GetService("Players");
local l_Parent_0 = script.Parent.Parent;
local v5 = require(l_CorePackages_0.Roact);
local v6 = require(l_CorePackages_0.RoactRodux);
local v7 = require(l_Parent_0.Constants);
local v8 = require(l_Parent_0.UtilityFunctions);
local v9 = require(l_Parent_0.Components.FavoritesButton);
local v10 = require(l_Parent_0.Components.TryOnButton);
local v11 = require(l_Parent_0.Components.BuyButton);
local v12 = require(l_Parent_0.Components.InspectAndBuyControllerBar);
local v13 = require(l_Parent_0.Selectors.GetIsFavorite);
local v14 = require(l_CoreGui_0.RobloxGui.Modules.RobloxTranslator);
local v15 = require(l_CorePackages_0.tutils);
local v16 = require(l_Parent_0.Flags.FFlagEnableFavoriteButtonForUgc);
local v17 = require(l_Parent_0.Flags.GetCollectibleItemInInspectAndBuyEnabled);
local v18 = require(l_Parent_0.Flags.FFlagAttributionInInspectAndBuy);
local v19 = require(l_Parent_0.Flags.GetFFlagIBGateUGC4ACollectibleAssetsBundles);
local v20 = require(l_Parent_0.Flags.GetFFlagIBEnableCollectiblesSystemSupport);
local v21 = require(l_Parent_0.Flags.GetFFlagIBEnableNewDataCollectionForCollectibleSystem);
local v22 = require(l_Parent_0.Flags.GetFFlagIBEnableCollectiblePurchaseForUnlimited);
local v23 = game:DefineFastFlag("IBDisableBuyButtonForUnlimitedAsset", false);
local v24 = game:DefineFastFlag("IBDisableBuyButtonForUnlimitedBundle", false);
local v25 = game:DefineFastFlag("IBFixBundlePurchase", false);
local v26 = require(l_Parent_0.Flags.GetFFlagIBEnableLimitedBundle);
local v27 = game:DefineFastFlag("IBFixResaleAfterQuantityLimit", false);
local v28 = v5.PureComponent:extend("DetailsButtons");
local function _(v29)
    return v7.AnimationAssetTypes[v29] ~= nil;
end;
local function v37(v31, v32, v33, v34)
    local v35 = nil;
    local v36 = v31.isLimited or v20() and v31.isLimitedUnique;
    if not v34 then
        if not v33 or not v31.isForSale then
            if not (v31.price ~= nil and v31.productType == v7.ProductType.CollectibleItem) or not v31.isForSale then
                if not v31.owned then
                    if not v36 then
                        if v31.isForSale or v36 then
                            if v31.isForSale then
                                if v31.premiumPricing ~= nil then
                                    if l_Players_0.LocalPlayer.MembershipType == Enum.MembershipType.Premium then
                                        return v31.premiumPricing.premiumPriceInRobux;
                                    elseif v31.price == nil then
                                        return (v14:FormatByKeyForLocale("InGame.InspectMenu.Label.PremiumOnly", v32));
                                    else
                                        return v31.price;
                                    end;
                                else
                                    v35 = v31.price;
                                end;
                            end;
                            return v35;
                        else
                            return (v14:FormatByKeyForLocale("InGame.InspectMenu.Label.Offsale", v32));
                        end;
                    else
                        return (v14:FormatByKeyForLocale("InGame.InspectMenu.Label.Limited", v32));
                    end;
                else
                    return (v14:FormatByKeyForLocale("InGame.InspectMenu.Label.Owned", v32));
                end;
            else
                return v31.price;
            end;
        else
            return (v14:FormatByKeyForLocale("InGame.InspectMenu.Action.LimitReached", v32));
        end;
    else
        return (v14:FormatByKeyForLocale("InGame.InspectMenu.Action.FromResale", v32, {
            PRICE = tostring(v34)
        }));
    end;
end;
v28.init = function(v38)
    v38.tryOnButtonRef = v5.createRef();
    v38.buyButtonRef = v5.createRef();
    v38.favoriteButtonRef = v5.createRef();
end;
v28.didUpdate = function(v39, v40)
    local l_detailsInformation_0 = v39.props.detailsInformation;
    local l_gamepadEnabled_0 = v39.props.gamepadEnabled;
    local v43 = false;
    if v40.assetInfo.bundlesAssetIsIn == nil then
        v43 = false;
        if v39.props.assetInfo.bundlesAssetIsIn ~= nil then
            v43 = l_detailsInformation_0.viewingDetails;
        end;
    end;
    if v21() then
        v43 = l_detailsInformation_0.viewingDetails;
    end;
    if not v43 then
        if not ((not (v39.props.assetInfo.bundlesAssetIsIn == nil) or not l_detailsInformation_0.viewingDetails) or not l_gamepadEnabled_0) then
            l_GuiService_0.SelectedCoreObject = nil;
        end;
    else
        local l_assetInfo_0 = v39.props.assetInfo;
        local v45 = not (v7.AnimationAssetTypes[l_assetInfo_0.assetTypeId] ~= nil);
        local l_visible_0 = v39.props.visible;
        if not (not l_gamepadEnabled_0 or not l_visible_0) then
            local v47 = not not l_assetInfo_0 and l_assetInfo_0.creatorId or 0;
            if not v16 then
                if v47 == "1" then
                    l_GuiService_0.SelectedCoreObject = v39.favoriteButtonRef.current;
                elseif not v45 then
                    l_GuiService_0.SelectedCoreObject = v39.buyButtonRef.current;
                else
                    l_GuiService_0.SelectedCoreObject = v39.tryOnButtonRef.current;
                end;
            else
                l_GuiService_0.SelectedCoreObject = v39.favoriteButtonRef.current;
            end;
        end;
    end;
    if v18 then
        local l_overlay_0 = v39.props.overlay;
        local l_overlay_1 = v40.overlay;
        if not (not (not (not l_gamepadEnabled_0 or not l_overlay_0) and l_overlay_0.overlay == nil) or not l_overlay_1) and l_overlay_1.overlay ~= nil then
            l_GuiService_0.SelectedCoreObject = v39.tryOnButtonRef.current;
        end;
    end;
end;
v28.calculateBuyStatusForLimitedItem = function(v50, v51, v52, v53)
    local v54 = v8.isLimited2Point0_Or_LimitedCollectible(v51);
    local v55 = v8.isLimited1Point0(v51) or v8.isLimited1Point0_LimitedUnique(v51);
    local v56 = nil;
    local v57 = nil;
    local v58 = nil;
    local v59 = nil;
    local v60 = nil;
    if not v54 then
        v53 = (v51.isForSale and not v51.owned) and not v55;
    else
        v53 = v51.isForSale;
        local l_resellableInstances_0 = v50.props.resellableInstances;
        local v62 = (l_resellableInstances_0 and l_resellableInstances_0[v51.collectibleItemId]) and v15.fieldCount(l_resellableInstances_0[v51.collectibleItemId]);
        local l_v62_0 = v62;
        if l_v62_0 then
            l_v62_0 = false;
            if v51.collectibleQuantityLimitPerUser ~= nil then
                l_v62_0 = false;
                if v51.collectibleQuantityLimitPerUser > 0 then
                    l_v62_0 = v51.collectibleQuantityLimitPerUser <= v62;
                end;
            end;
        end;
        v56 = l_v62_0;
        l_v62_0 = v51.collectibleLowestAvailableResaleProductId and v51.collectibleLowestAvailableResaleProductId ~= "";
        local v64 = false;
        v64 = if not v27 then l_v62_0 and v51.collectibleLowestResalePrice < (v51.price or 0) else if not (v51.remaining > 0) then l_v62_0 and v51.collectibleLowestResalePrice else l_v62_0 and v51.collectibleLowestResalePrice < (v51.price or 0);
        if not l_v62_0 then
            if v56 then
                v53 = false;
            end;
        elseif not (not (not v53 or v56) and not v64) then
            v57 = v51.collectibleLowestResalePrice;
            v58 = v51.collectibleLowestAvailableResaleItemInstanceId;
            v59 = v51.collectibleLowestAvailableResaleProductId;
            v60 = v51.collectibleItemId;
            v53 = true;
        end;
    end;
    if (v53 and v51.price == nil) and v51.premiumPricing ~= nil then
        v53 = l_Players_0.LocalPlayer.MembershipType == Enum.MembershipType.Premium;
    end;
    local v65 = v37(v51, v52, v56, v57);
    local v66;
    if not (not (v51.price ~= nil) or v51.owned) then
        v66 = v53;
        if v66 then
            goto label0;
        end;
    end;
    v66 = true;
    if v57 == nil then
        v66 = false;
        if v51.price ~= nil then
            v66 = false;
            if v51.productType == v7.ProductType.CollectibleItem then
                v66 = v53;
            end;
        end;
    end;
    ::label0::;
    return {
        buyText = v65, 
        showRobuxIcon = v66, 
        forSale = v53, 
        collectibleQuantityLimitReached = v56, 
        collectibleLowestResalePrice = v57, 
        collectibleLowestAvailableResaleItemInstanceId = v58, 
        collectibleLowestAvailableResaleProductId = v59, 
        collectibleItemId = v60
    };
end;
v28.render = function(v67)
    local l_locale_0 = v67.props.locale;
    local l_assetInfo_1 = v67.props.assetInfo;
    local l_bundleInfo_0 = v67.props.bundleInfo;
    local v71 = (l_assetInfo_1.isLimited or v20() and l_assetInfo_1.isLimitedUnique) or false;
    local v72 = false;
    local v73 = false;
    local v74 = not not l_assetInfo_1 and l_assetInfo_1.creatorId or 0;
    local v75 = nil;
    local v76 = nil;
    local v77 = nil;
    local v78 = nil;
    local v79 = nil;
    local v80 = nil;
    local v81 = nil;
    local v82 = false;
    local v83 = nil;
    local v84 = nil;
    local v85 = nil;
    local v86 = nil;
    if l_assetInfo_1 then
        v77 = l_assetInfo_1.bundlesAssetIsIn and #l_assetInfo_1.bundlesAssetIsIn == 1;
        if v21() then
            v77 = l_assetInfo_1.parentBundleId ~= nil;
        end;
        v81 = v77 and not l_assetInfo_1.isForSale;
        local l_v81_0 = v81;
        if v25 then
            l_v81_0 = v77;
        end;
        if not l_v81_0 then
            v79 = v7.ItemType.Asset;
            if not ((not v21() or v26()) or not v77) then
                v79 = v7.ItemType.Bundle;
            end;
            v80 = l_assetInfo_1.assetId;
            if not v26() then
                local v88 = if not v20() then l_assetInfo_1.productType == v7.ProductType.CollectibleItem else v8.isLimitedCollectible(l_assetInfo_1);
                if v22() then
                    v88 = v8.isLimited2Point0_Or_LimitedCollectible(l_assetInfo_1);
                end;
                if not v17() or not v88 then
                    v76 = ((l_assetInfo_1.isForSale and not l_assetInfo_1.owned) and not v71) and l_assetInfo_1.owned ~= nil;
                    if v22() then
                        v76 = (l_assetInfo_1.isForSale and not l_assetInfo_1.owned) and not v71;
                    end;
                else
                    v76 = l_assetInfo_1.isForSale;
                    local l_resellableInstances_1 = v67.props.resellableInstances;
                    local v90 = (l_resellableInstances_1 and l_resellableInstances_1[l_assetInfo_1.collectibleItemId]) and v15.fieldCount(l_resellableInstances_1[l_assetInfo_1.collectibleItemId]);
                    local l_v90_0 = v90;
                    if l_v90_0 then
                        l_v90_0 = false;
                        if l_assetInfo_1.collectibleQuantityLimitPerUser ~= nil then
                            l_v90_0 = false;
                            if l_assetInfo_1.collectibleQuantityLimitPerUser > 0 then
                                l_v90_0 = l_assetInfo_1.collectibleQuantityLimitPerUser <= v90;
                            end;
                        end;
                    end;
                    v82 = l_v90_0;
                    l_v90_0 = l_assetInfo_1.collectibleLowestAvailableResaleProductId and l_assetInfo_1.collectibleLowestAvailableResaleProductId ~= "";
                    local v92 = false;
                    v92 = if not v27 then l_v90_0 and l_assetInfo_1.collectibleLowestResalePrice < (l_assetInfo_1.price or 0) else if not (l_assetInfo_1.remaining > 0) then l_v90_0 and l_assetInfo_1.collectibleLowestResalePrice else l_v90_0 and l_assetInfo_1.collectibleLowestResalePrice < (l_assetInfo_1.price or 0);
                    if not l_v90_0 then
                        if v82 then
                            v76 = false;
                        end;
                    elseif not (not (not v76 or v82) and not v92) then
                        v84 = l_assetInfo_1.collectibleLowestResalePrice;
                        v86 = l_assetInfo_1.collectibleLowestAvailableResaleItemInstanceId;
                        v85 = l_assetInfo_1.collectibleLowestAvailableResaleProductId;
                        v83 = l_assetInfo_1.collectibleItemId;
                        v76 = true;
                    end;
                end;
                if (v76 and l_assetInfo_1.price == nil) and l_assetInfo_1.premiumPricing ~= nil then
                    v76 = l_Players_0.LocalPlayer.MembershipType == Enum.MembershipType.Premium;
                end;
                v75 = v37(l_assetInfo_1, l_locale_0, v82, v84);
                local v93;
                if not (not (l_assetInfo_1.price ~= nil) or l_assetInfo_1.owned) then
                    v93 = v76;
                    if v93 then
                        goto label1;
                    end;
                end;
                v93 = true;
                if v84 == nil then
                    v93 = false;
                    if l_assetInfo_1.price ~= nil then
                        v93 = false;
                        if l_assetInfo_1.productType == v7.ProductType.CollectibleItem then
                            v93 = v76;
                        end;
                    end;
                end;
                ::label1::;
                v72 = v93;
            end;
        else
            v78 = v8.getBundleId(l_assetInfo_1);
            v79 = v7.ItemType.Bundle;
            v80 = v78;
            if not (v26() or not l_bundleInfo_0[v78]) then
                v75 = v37(l_bundleInfo_0[v78], l_locale_0, v82, v84);
                v76 = l_bundleInfo_0[v78].isForSale and not l_bundleInfo_0[v78].owned;
                local v94 = false;
                if l_bundleInfo_0[v78].price ~= nil then
                    v94 = not l_bundleInfo_0[v78].owned and v76;
                end;
                v72 = v94;
            end;
        end;
        if v26() then
            local v95 = v67:calculateBuyStatusForLimitedItem(l_assetInfo_1, l_locale_0, v76);
            v75 = v95.buyText;
            v72 = v95.showRobuxIcon;
            v76 = v95.forSale;
            v82 = v95.collectibleQuantityLimitReached;
            v84 = v95.collectibleLowestResalePrice;
            v85 = v95.collectibleLowestAvailableResaleProductId;
            v86 = v95.collectibleLowestAvailableResaleItemInstanceId;
            v83 = v95.collectibleItemId;
        end;
        v73 = not (v7.AnimationAssetTypes[l_assetInfo_1.assetTypeId] ~= nil);
        if v7.AssetTypeIdStringToHumanoidDescriptionProp[l_assetInfo_1.assetTypeId] == nil and v7.AssetTypeIdToAccessoryTypeEnum[l_assetInfo_1.assetTypeId] == nil then
            v73 = false;
        end;
    end;
    local v96 = nil;
    if v19() then
        v96 = (v8.isUnlimitedCollectibleAsset(v79, l_assetInfo_1) or v8.isLimitedBundle(v79, l_assetInfo_1)) or v8.isUnlimitedCollectibleBundle(v79, l_assetInfo_1);
    end;
    if not (not v22() or not l_assetInfo_1) then
        v83 = l_assetInfo_1.collectibleItemId;
        local v97 = v77 and #v67.props.assetBundles[l_assetInfo_1.assetId] > 1;
        v96 = v8.isLimitedBundle(v79, l_assetInfo_1) or v97;
        if v26() then
            v96 = v97;
        end;
    end;
    if not (not v23 and not v24) then
        if not v23 or not v24 then
            if not v23 then
                if v24 then
                    v96 = v96 or v8.isUnlimitedCollectibleBundle(v79, l_assetInfo_1);
                end;
            else
                v96 = v96 or v8.isUnlimitedCollectibleAsset(v79, l_assetInfo_1);
            end;
        else
            v96 = (v96 or v8.isUnlimitedCollectibleAsset(v79, l_assetInfo_1)) or v8.isUnlimitedCollectibleBundle(v79, l_assetInfo_1);
        end;
    end;
    return v5.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 0, 51), 
        Position = UDim2.new(0, 0, 1, -51)
    }, {
        UIListLayout = v5.createElement("UIListLayout", {
            Padding = UDim.new(0, 10), 
            FillDirection = Enum.FillDirection.Horizontal, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        ControllerBar = (v67.props.detailsInformation.viewingDetails and v67.props.gamepadEnabled) and v5.createElement(v12, {
            showTryOn = v73, 
            tryingOn = v67.props.tryingOn, 
            showFavorite = not not v16 or v74 == "1", 
            isFavorited = v67.props.isFavorited
        }), 
        FavoriteButton = v5.createElement(v9, {
            favoriteButtonRef = v67.favoriteButtonRef
        }), 
        TryOnButton = v5.createElement(v10, {
            showTryOn = v73, 
            assetInfo = l_assetInfo_1, 
            partOfBundleAndOffsale = v81, 
            bundleId = v78, 
            tryOnButtonRef = v67.tryOnButtonRef, 
            localPlayerModel = v67.props.localPlayerModel
        }), 
        TryOnFiller = v5.createElement("ImageLabel", {
            AnchorPoint = Vector2.new(0.5, 0), 
            BackgroundTransparency = 1, 
            Size = UDim2.new(0.5, -32, 0, 44), 
            Visible = not v73, 
            LayoutOrder = 2, 
            Image = "", 
            ScaleType = Enum.ScaleType.Slice, 
            SliceCenter = Rect.new(5, 5, 120, 20)
        }), 
        BuyButton = if not not v19() and v96 then nil else v5.createElement(v11, {
            itemType = v79, 
            itemId = v80, 
            showRobuxIcon = v72, 
            forSale = v76, 
            buyText = v75, 
            buyButtonRef = v67.buyButtonRef, 
            collectibleItemId = v83, 
            collectibleLowestAvailableResaleProductId = v85, 
            collectibleLowestAvailableResaleItemInstanceId = v86, 
            collectibleLowestResalePrice = v84
        })
    });
end;
return v6.UNSTABLE_connect2(function(v98, _)
    return {
        visible = v98.visible, 
        assetInfo = v98.assets[v98.detailsInformation.assetId] or {}, 
        assetBundles = if not v22() then nil else v98.assetBundles, 
        detailsInformation = v98.detailsInformation, 
        bundleInfo = v98.bundles, 
        locale = v98.locale, 
        gamepadEnabled = v98.gamepadEnabled, 
        isFavorited = v13(v98), 
        tryingOn = v98.tryingOnInfo.tryingOn, 
        resellableInstances = v98.collectibleResellableInstances, 
        overlay = if not v18 then nil else v98.overlay
    };
end)(v28);
