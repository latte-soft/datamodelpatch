local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.t);
local v5 = require(l_CorePackages_0.tutils);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local v7 = require(l_CorePackages_0.Promise);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v9 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v10 = require(l_Modules_0.LuaApp.Services.RoactLocalization);
local v11 = require(l_Modules_0.AvatarExperience.Common.Components.withOverlayFocusHandling);
local v12 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withMappedNavigationParams);
local v13 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local v15 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local v16 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.PurchaseProduct);
local v17 = require(l_Modules_0.AvatarExperience.Catalog.Services.Analytics);
local v18 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v19 = require(l_Modules_0.AvatarExperience.AvatarEditor.Services.Analytics);
local v20 = require(l_Modules_0.AvatarExperience.Common.Selectors.DEPRECATED_ItemData);
local v21 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectItemInfo);
local v22 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXFixItemTypeHandling);
local v23 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local v24 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.WearAfterOutfitPurchase);
local v25 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local v26 = require(l_Modules_0.LuaApp.Enum.ToastType);
local l_memoize_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).memoize;
local v28 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.Prompts.PurchasePromptInteractiveAlert);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local _ = require(l_Modules_0.AvatarExperience.Common.Reducers.OutfitTryOn);
local v31 = require(l_Modules_0.LuaApp.Thunks.Challenge.RenderPurchaseChallenge);
local v32 = require(l_Modules_0.AvatarExperience.Flags.FFlagEnableSpendFrictionTwoFactor);
local v33 = require(l_Modules_0.AvatarExperience.Flags.FFlagEnableTwoStepCatalogAnalytics);
local v34 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXLimitedBundlesHandleNewData);
local v35 = v2.PureComponent:extend("PurchaseOutfitPrompt");
v35.validateProps = v4.strictInterface({
    navigation = v4.table, 
    itemsToPurchase = v4.table, 
    ownedTryOnItems = v4.table, 
    totalOutfitPrice = v4.integer, 
    onRenderTwoStepChallenge = v4.optional(v4.callback), 
    entryPoint = v4.optional(v4.string), 
    DEPRECATED_itemDataTable = if not v22 then v4.table else nil, 
    itemInfoTable = if not v22 then nil else v4.table, 
    userAssets = v4.table, 
    userId = v4.optional(v4.string), 
    collectiblesItemInfo = v4.table, 
    collectiblesResellersInstances = v4.table, 
    collectiblesResellableInstances = v4.table, 
    purchaseProduct = v4.callback, 
    setCurrentToastMessage = v4.callback, 
    wearAfterOutfitPurchase = v4.callback, 
    renderPurchaseChallenge = v4.callback, 
    networking = v4.callback, 
    analytics = v4.table, 
    aeAnalytics = v4.table, 
    localization = v4.table, 
    enablePurchasePromptIncludingWarning = v4.boolean, 
    focusController = v4.optional(v4.table), 
    defaultChildRef = v4.optional(v4.table), 
    onOverlayClosed = v4.optional(v4.callback)
});
local function _(v36)
    v13.closeOverlay(v36);
end;
local function _(v38)
    v13.closeOverlay(v38);
    v13.closeFocusedScreen(v38);
end;
local v40 = nil;
local v41 = nil;
if not v22 then
    local v47 = l_memoize_0(function(v42, v43)
        local v44 = {};
        for v45, v46 in v43, nil, nil do
            v44[v45] = v20(v42, v45, v46.itemType);
        end;
        return v44;
    end);
    local l_v47_0 = v47 --[[ copy: 40 -> 43 ]];
    v40 = function(v49, v50)
        return l_v47_0(v49.AvatarExperience.Common, v50);
    end;
else
    local v56 = l_memoize_0(function(v51, v52)
        local v53 = {};
        for v54, v55 in v52, nil, nil do
            v53[v54] = v21(v51, v54, v55.itemType);
        end;
        return v53;
    end);
    local l_v56_0 = v56 --[[ copy: 40 -> 42 ]];
    v41 = function(v58, v59)
        return l_v56_0(v58.AvatarExperience, v59);
    end;
end;
v35.getToast = function(v60, v61, v62, _)
    local v64 = nil;
    local v65 = nil;
    local l_localization_0 = v60.props.localization;
    local v67 = {
        numItems = v61
    };
    local v68 = l_localization_0:Format("Feature.Avatar.Label.OutfitPurchaseSuccess", v67);
    local v69 = l_localization_0:Format("Feature.Avatar.Label.OutfitPurchaseFailure", v67);
    if not v62 then
        v64 = v69;
        v65 = v26.NetworkingError;
    else
        v64 = v68;
        v65 = v26.InformationMessage;
    end;
    return {
        toastMessage = v64, 
        isLocalized = true, 
        toastType = v65
    };
end;
local _ = function(v70)
    local v71 = 0;
    local v72 = 0;
    for _, v74 in v70, nil, nil do
        if v74 == true then
            v71 = v71 + 1;
        else
            v72 = v72 + 1;
        end;
    end;
    return v71, v72;
end;
local function v81(v76, v77)
    for v78, v79 in v76, nil, nil do
        if v79 == false then
            local v80 = v77[v78];
            if not (not (typeof(v80) == "table") or not v80.reason) then
                return v80.reason;
            end;
        end;
    end;
    return "networkFailure";
end;
v35.sendOutfitPurchaseAnalytics = function(v82, v83, v84)
    local l_analytics_0 = v82.props.analytics;
    local l_totalOutfitPrice_0 = v82.props.totalOutfitPrice;
    local v87 = 0;
    local v88 = 0;
    for _, v90 in v83, nil, nil do
        if v90 == true then
            v87 = v87 + 1;
        else
            v88 = v88 + 1;
        end;
    end;
    local l_v87_0 = v87;
    local l_v88_0 = v88;
    v87 = l_v87_0 + l_v88_0;
    v88 = l_v88_0 > 0;
    local v93 = nil;
    if v88 then
        v93 = v81(v83, v84);
    end;
    l_analytics_0.avatarShopBuyOutfit(v87, l_totalOutfitPrice_0, v88, v93);
end;
v35.showToasts = function(v94, v95, v96)
    local v97 = 0;
    local v98 = 0;
    for _, v100 in v95, nil, nil do
        if v100 == true then
            v97 = v97 + 1;
        else
            v98 = v98 + 1;
        end;
    end;
    local l_v97_0 = v97;
    local l_v98_0 = v98;
    if l_v97_0 > 0 then
        v94.props.setCurrentToastMessage(v94:getToast(l_v97_0, true, v96));
    end;
    if l_v98_0 > 0 then
        v94.props.setCurrentToastMessage(v94:getToast(l_v98_0, false, v96));
    end;
end;
v35.formatOwnedItemForWearAfterPurchase = function(_, v104, v105)
    local v106 = v105.itemType == v18.ItemType.Bundle;
    return {
        purchased = false, 
        owned = true, 
        assetIsWearable = not v106, 
        bundleId = not not v106 and v104 or nil, 
        tryOnBundleInfo = not not v106 and v105.bundleInfo or nil, 
        assetId = not v106 and v104 or nil, 
        assetType = not not v106 and v18.ItemType.Bundle or nil, 
        overrideOrder = v105.order, 
        itemSubType = v105.itemSubType
    };
end;
v35.handleWearAfterPurchase = function(v107, v108, v109)
    if v107.state.isWearAfterPurchaseChecked then
        local v110 = {};
        for v111, v112 in v107.props.ownedTryOnItems, nil, nil do
            table.insert(v110, v107:formatOwnedItemForWearAfterPurchase(v111, v112));
        end;
        for v113, v114 in v108, nil, nil do
            if v114 == true and v109[v113].purchased == true then
                table.insert(v110, v109[v113]);
            end;
        end;
        v107.props.wearAfterOutfitPurchase(v110, v107.props.navigation, v107.props.aeAnalytics);
        return ;
    else
        return ;
    end;
end;
v35.get2FVData = function(_, v116, v117)
    local v118 = false;
    local v119 = false;
    local v120 = nil;
    for v121, v122 in v116, nil, nil do
        if v122 ~= false then
            local v123 = v117[v121];
            v118 = not v123.purchased;
            v119 = not v123.is2SVEnabled;
            v120 = v123.challengeToken;
            if v118 then
                return v118, v119, v120;
            end;
        end;
    end;
    return v118, v119, v120;
end;
v35.handlePurchaseResolutionWith2Factor = function(v124, v125, v126)
    local l_analytics_1 = v124.props.analytics;
    local v128, v129, v130 = v124:get2FVData(v125, v126);
    if v128 then
        if not v129 then
            if not v130 then
                if v33 then
                    l_analytics_1.failedShowTwoStepAuthOnPurchase();
                end;
                local l_navigation_0 = v124.props.navigation;
                v13.closeOverlay(l_navigation_0);
                v13.closeFocusedScreen(l_navigation_0);
                return ;
            else
                if v33 then
                    l_analytics_1.shownTwoStepAuthOnPurchase();
                end;
                v124:renderTwoStepChallenge(v130);
                return ;
            end;
        else
            if v33 then
                l_analytics_1.shownEnableTwoStepAuthOnPurchase();
            end;
            v124.showTwoStepRequiredPrompt();
            return ;
        end;
    else
        local l_navigation_1 = v124.props.navigation;
        v13.closeOverlay(l_navigation_1);
        v13.closeFocusedScreen(l_navigation_1);
        return ;
    end;
end;
v35.init = function(v133)
    v133.isMounted = false;
    v133.state = {
        isWearAfterPurchaseChecked = true, 
        isPurchasing = false
    };
    v133.showTwoStepRequiredPrompt = function()
        v13.navigateToNextOverlay(v133.props.navigation, v15.TwoStepRequiredPrompt);
    end;
    v133.onCancel = function()
        if not v133.state.isPurchasing then
            v13.closeOverlay(v133.props.navigation);
            return ;
        else
            return ;
        end;
    end;
    v133.onConfirm = function(v134)
        if not v133.state.isPurchasing then
            local l_networking_0 = v133.props.networking;
            local l_analytics_2 = v133.props.analytics;
            local l_navigation_2 = v133.props.navigation;
            local v138 = {};
            local l_entryPoint_0 = v133.props.entryPoint;
            for v140, v141 in v133.props.itemsToPurchase, nil, nil do
                local l_itemType_0 = v141.itemType;
                local l_itemSubType_0 = v141.itemSubType;
                local l_expectedPrice_0 = v141.expectedPrice;
                local v145 = nil;
                local v146 = nil;
                if not v22 then
                    v145 = v133.props.DEPRECATED_itemDataTable[v140];
                else
                    v146 = v133.props.itemInfoTable[v140];
                end;
                local v147 = nil;
                local v148 = nil;
                local v149 = nil;
                local v150 = nil;
                local v151 = nil;
                local v152 = nil;
                local v153 = nil;
                if not v22 then
                    v147 = v145.product.id;
                    v148 = v145.expectedSellerId;
                    v149 = v145.resellerUserAssetIds;
                    v150 = v23.DEPRECATED_IsResellable(v145);
                    v151 = v145 and v145.collectibleItemId;
                    v152 = (v145 and v145.creator) and v145.creator.type;
                    v153 = if not v34() then nil else v23.DEPRECATED_isLimitedCollectible(v145);
                else
                    v147 = v146.productId;
                    v148 = v146.expectedSellerId;
                    v149 = v146.resellerUserAssetIds;
                    v150 = v146.isResellable;
                    v151 = v146 and v146.collectibleItemId;
                    v152 = (v146 and v146.creator) and v146.creator.type;
                    v153 = if not v34() then nil else v146 and v146.isLimitedCollectible;
                end;
                local v154 = v133.props.userAssets[v149 and v149[1]];
                local v155 = nil;
                if not (not v150 or not v154) then
                    v155 = v154.userAssetId;
                    v148 = v154.userId;
                end;
                local v156 = nil;
                if v151 then
                    local l_collectiblesItemInfo_0 = v133.props.collectiblesItemInfo;
                    local l_collectiblesResellersInstances_0 = v133.props.collectiblesResellersInstances;
                    local l_collectiblesResellableInstances_0 = v133.props.collectiblesResellableInstances;
                    local v160 = nil;
                    v160 = if not v34() then v23.findCheapestCollectiblePurchaseInfo(v151, l_collectiblesItemInfo_0, l_collectiblesResellersInstances_0, l_collectiblesResellableInstances_0) else v23.findCheapestCollectiblePurchaseInfoV2(v151, v153, l_collectiblesItemInfo_0, l_collectiblesResellersInstances_0, l_collectiblesResellableInstances_0);
                    if v160.price then
                        l_expectedPrice_0 = v160.price;
                    end;
                    if v160.collectibleInstanceId then
                        v156 = v160.collectibleInstanceId;
                        v148 = v160.expectedSellerId;
                    end;
                end;
                table.insert(v138, v133.props.purchaseProduct(l_networking_0, v147, l_expectedPrice_0 or 0, v148, v140, l_itemType_0, l_itemSubType_0, false, v155, l_analytics_2, l_navigation_2, false, true, l_entryPoint_0, v151, v156, v152));
            end;
            v133:setState({
                isPurchasing = true
            });
            v7.new(function(v161, _)
                local v163 = {};
                local v164 = {};
                for _, v166 in v138, nil, nil do
                    local v167, v168 = v166:await();
                    table.insert(v163, v167);
                    table.insert(v164, v168);
                end;
                v161(v163, v164);
            end):andThen(function(v169, v170)
                if not v133.isMounted then
                    v133:showToasts(v169, v134);
                    v133:handleWearAfterPurchase(v169, v170);
                    return ;
                else
                    v133:setState({
                        isPurchasing = false
                    });
                    v133:sendOutfitPurchaseAnalytics(v169, v170);
                    v133:showToasts(v169, v134);
                    v133:handleWearAfterPurchase(v169, v170);
                    if not v32 then
                        local l_navigation_3 = v133.props.navigation;
                        v13.closeOverlay(l_navigation_3);
                        v13.closeFocusedScreen(l_navigation_3);
                        return ;
                    else
                        v133:handlePurchaseResolutionWith2Factor(v169, v170);
                        return ;
                    end;
                end;
            end);
            return ;
        else
            return ;
        end;
    end;
    v133.toggleWearAfterPurchase = function()
        v133:setState({
            isWearAfterPurchaseChecked = not v133.state.isWearAfterPurchaseChecked
        });
    end;
end;
v35.renderTwoStepChallenge = function(v172, v173)
    local l_analytics_3 = v172.props.analytics;
    local l_networking_1 = v172.props.networking;
    local l_userId_0 = v172.props.userId;
    local l_navigation_4 = v172.props.navigation;
    local function v178()
        v13.closeOverlay(l_navigation_4);
    end;
    v172.props.renderPurchaseChallenge(v173, l_userId_0, l_analytics_3, l_networking_1, v178, v178, v172.props.onRenderTwoStepChallenge);
end;
v35.renderAlertLocalized = function(v179, v180)
    local l_totalOutfitPrice_1 = v179.props.totalOutfitPrice;
    local v182 = v5.fieldCount(v179.props.itemsToPurchase);
    local v183 = l_totalOutfitPrice_1 == 0;
    local v184 = nil;
    local v185 = nil;
    local v186 = nil;
    local l_localization_1 = v179.props.localization;
    local v188 = {
        numItems = v182
    };
    local v189 = l_localization_1:Format("Feature.Avatar.Label.GetOutfitMultiple", v188);
    local v190 = l_localization_1:Format("Feature.Avatar.Label.BuyOutfitMultiple", v188);
    local v191 = l_localization_1:Format("Feature.Avatar.Label.BuyOutfitLuobuMultiple", v188);
    if not v183 then
        v184 = v180.buyOutfit;
        if not v179.props.enablePurchasePromptIncludingWarning then
            if v182 > 1 then
                v185 = v190;
            elseif v182 == 1 then
                v185 = v180.buyOutfitSingle;
            end;
        elseif v182 > 1 then
            v185 = v191;
        elseif v182 == 1 then
            v185 = v180.buyOutfitLuobuSingle;
        end;
        v186 = v180.buyOutfit;
    else
        v184 = v180.getOutfit;
        if v182 > 1 then
            v185 = v189;
        elseif v182 == 1 then
            v185 = v180.getOutfitOne;
        end;
        v186 = v180.get;
    end;
    return v2.createElement(v28, {
        priceInRobux = l_totalOutfitPrice_1, 
        showWearAfterPurchase = true, 
        isWearAfterPurchaseChecked = v179.state.isWearAfterPurchaseChecked, 
        toggleWearAfterPurchase = v179.toggleWearAfterPurchase, 
        titleText = v184, 
        bodyText = v185, 
        confirmButtonText = v186, 
        onConfirm = function()
            return v179.onConfirm(v180);
        end, 
        onCancel = v179.onCancel, 
        isLoading = v179.state.isPurchasing, 
        defaultChildRef = v179.props.defaultChildRef
    });
end;
v35.render = function(v192)
    return l_withLocalization_0({
        getOutfit = "Feature.Avatar.Title.GetOutfit", 
        buyOutfit = "Feature.Avatar.Title.BuyOutfit", 
        get = "Feature.Catalog.Label.Get", 
        getOutfitOne = "Feature.Avatar.Label.GetOutfitOne", 
        buyOutfitSingle = "Feature.Avatar.Label.BuyOutfitSingle", 
        buyOutfitLuobuSingle = "Feature.Avatar.Label.BuyOutfitLuobuSingle"
    })(function(v193)
        return v192:renderAlertLocalized(v193);
    end);
end;
v35.didMount = function(v194)
    v194.isMounted = true;
end;
v35.willUnmount = function(v195)
    v195.isMounted = false;
end;
return (v12((v11((l_RoactServices_0.connect({
    networking = v9, 
    analytics = v17, 
    aeAnalytics = v19, 
    localization = v10
})((v3.connect(function(v196, v197)
    return {
        DEPRECATED_itemDataTable = if not v22 then v40(v196, v197.itemsToPurchase) else nil, 
        itemInfoTable = if not v22 then nil else v41(v196, v197.itemsToPurchase), 
        userAssets = v196.AvatarExperience.Catalog.UserAssets, 
        userId = not not v32 and v196.LocalUserId or nil, 
        collectiblesItemInfo = v196.AvatarExperience.Common.Collectibles.CollectiblesItemInfo, 
        collectiblesResellersInstances = v196.AvatarExperience.Common.Collectibles.CollectiblesResellersInstances, 
        collectiblesResellableInstances = v196.AvatarExperience.Common.Collectibles.CollectiblesResellableInstances
    };
end, function(v198)
    return {
        setCurrentToastMessage = function(v199)
            v198(v25(v199));
        end, 
        purchaseProduct = function(v200, v201, v202, v203, v204, v205, v206, v207, v208, v209, v210, v211, v212, v213, v214, v215, v216, v217)
            return v198(v16(v200, v201, v202, v203, v204, v205, v206, v207, v208, v209, v210, v211, v212, v213, v214, v215, v216, v217));
        end, 
        renderPurchaseChallenge = function(v218, v219, v220, v221, v222, v223, v224)
            return v198(v31(v218, v219, v220, v221, v222, v223, v224));
        end, 
        wearAfterOutfitPurchase = function(v225, v226, v227)
            return v198(v24(v225, v226, v227));
        end
    };
end)((l_RoactAppPolicy_0.connect(function(v228, _)
    return {
        enablePurchasePromptIncludingWarning = v228.getPurchasePromptIncludingWarning()
    };
end)(v35))))))))));
