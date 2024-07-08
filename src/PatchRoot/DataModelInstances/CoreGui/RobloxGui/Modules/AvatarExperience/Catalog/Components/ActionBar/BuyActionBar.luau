local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
local v3 = require(l_CorePackages_0.Promise);
local v4 = require(l_CorePackages_0.Roact);
local v5 = require(l_CorePackages_0.UIBlox);
local l_withNavigation_0 = require(l_CorePackages_0.RoactNavigation).withNavigation;
local v7 = require(l_CorePackages_0.RoactRodux);
local v8 = require(l_CorePackages_0.Packages.RoactGamepad);
local v9 = require(l_CorePackages_0.Packages.t);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v11 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v12 = require(l_Modules_0.LuaApp.Services.RoactLocalization);
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local v14 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectItemInfo);
local v15 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local v16 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withAvatarRoute);
local v17 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v20 = require(l_Modules_0.LuaApp.Thunks.ApiFetchEconomyCurrency);
local v21 = require(l_Modules_0.LuaApp.Enum.RetrievalStatus);
local l_withStyle_0 = v5.Style.withStyle;
local l_NumberLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).NumberLocalization;
local v24 = require(l_Modules_0.LuaApp.Constants);
local v25 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.RecommendedItemsGrid);
local v26 = require(l_Modules_0.AvatarExperience.Common.Validators.DEPRECATED_ItemDataValidator);
local l_PeekViewState_0 = require(l_CorePackages_0.Workspace.Packages.PeekView).PeekViewState;
local v28 = require(l_Modules_0.AvatarExperience.Common.Components.withLastInputGroup);
local v29 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v30 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v31 = require(l_Modules_0.AvatarExperience.Catalog.Components.ActionBar.ActionBar);
local v32 = require(l_Modules_0.AvatarExperience.Catalog.Components.ActionBar.PremiumBar);
local v33 = require(l_Modules_0.AvatarExperience.Common.Selectors.DEPRECATED_ItemData);
local v34 = require(l_Modules_0.AvatarExperience.Common.Models.ItemInfo);
local v35 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local v36 = require(l_Modules_0.AvatarExperience.Catalog.Services.Analytics);
local v37 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.OpenPremiumUpsellPrompt);
local v38 = require(l_Modules_0.AvatarExperience.Common.Selectors.SelectItemPromptType);
local v39 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.Debug.logOnOverlayClosed);
local v40 = require(l_Modules_0.AvatarExperience.Common.Thunks.NavigateWithLock);
local v41 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local v42 = require(l_Modules_0.AvatarExperience.Common.Thunks.OpenItemPrompt);
local v43 = require(l_Modules_0.LuaApp.Enum.ToastType);
local v44 = require(l_Modules_0.AvatarExperience.Flags.FFlagAEShowPremiumPolicy);
local v45 = require(l_Modules_0.AvatarExperience.Flags.GetAXInExperienceItemLinking);
local v46 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXFixItemTypeHandling);
local v47 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXFixResellButtonStyling);
local v48 = game:DefineFastFlag("ExperienceItemsResalePurchase", false);
local v49 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXLimitedBundlesHandleNewData);
local l_Images_0 = v5.App.ImageSet.Images;
local v51 = l_Images_0["icons/menu/avatar_on"];
local v52 = l_Images_0["icons/common/robux"];
local v53 = l_Images_0["icons/actions/block"];
local v54 = l_GuiService_0:IsTenFootInterface();
local v55 = v4.PureComponent:extend("BuyActionBar");
v55.validateProps = v9.strictInterface({
    showMoreButton = v9.optional(v9.boolean), 
    itemId = v9.optional(v9.string), 
    itemType = v9.string, 
    headerPadding = v9.number, 
    leftPadding = v9.number, 
    topPadding = v9.optional(v9.number), 
    bottomPadding = v9.number, 
    rightPadding = v9.number, 
    ZIndex = v9.number, 
    onBottomComponentResized = v9.optional(v9.callback), 
    hideGradient = v9.optional(v9.boolean), 
    disableIAPEntryPoint = v9.optional(v9.boolean), 
    analytics = v9.table, 
    networking = v9.callback, 
    localization = v9.table, 
    navigation = v9.table, 
    avatarRoute = v9.table, 
    fetchingState = v9.string, 
    DEPRECATED_itemData = if not v46 then v9.optional(v26) else nil, 
    itemInfo = if not v46 then nil else v9.optional(v34.Validator), 
    userAsset = v9.optional(v9.table), 
    productId = v9.optional(v9.string), 
    userRobux = v9.optional(v9.number), 
    localUserId = v9.optional(v9.string), 
    playerMembership = v9.optional(v9.enum(Enum.MembershipType)), 
    lastInputGroup = v9.optional(v9.string), 
    promptType = v9.optional(v9.string), 
    collectibleItemInfo = v9.optional(v9.table), 
    collectiblesItemInfo = v9.optional(v9.table), 
    collectiblesResellersInstances = v9.optional(v9.table), 
    resellableInstances = v9.optional(v9.table), 
    isLimitedCollectible = if not v49() then nil else v9.optional(v9.boolean), 
    openPremiumUpsell = v9.callback, 
    setCurrentToastMessage = v9.callback, 
    requestRobuxInfo = v9.callback, 
    openItemPrompt = v9.callback, 
    navigateWithLock = v9.callback, 
    showPremiumContent = v9.boolean
});
v55.defaultProps = {
    bottomPadding = 0, 
    showMoreButton = true
};
v55.init = function(v56)
    v56:setState({
        isMoreButtonActivated = false
    });
    v56.openPremiumUpsell = function()
        local l_networking_0 = v56.props.networking;
        local l_analytics_0 = v56.props.analytics;
        local v59 = nil;
        if not v46 then
            v59 = v56.props.DEPRECATED_itemData.id;
        elseif v56.props.itemInfo then
            v59 = v56.props.itemInfo.itemId;
        end;
        v56.props.openPremiumUpsell(l_networking_0, l_analytics_0, v59, v56.props.itemType == v29.ItemType.Bundle, v56.props.navigation);
    end;
    v56.openCatalogContextMenu = function(v60)
        local l_itemId_0 = v56.props.itemId;
        local l_itemType_0 = v56.props.itemType;
        local l_navigation_0 = v56.props.navigation;
        local v64 = l_navigation_0.getParam("fromProfile") or l_navigation_0.state.routeName == v15.TryOnItem;
        v56.props.navigateWithLock(function()
            v56.props.navigation.navigate(v15.CatalogContextMenu, {
                itemId = l_itemId_0, 
                itemType = l_itemType_0, 
                onOverlayClosed = v60, 
                centered = v64
            });
        end);
    end;
    v56.closeCatalogContextMenu = function()
        v17.closeAllDialogs(v56.props.navigation);
    end;
    v56.makeOverlayClosedCallback = function(v65)
        return function()
            v56:setState({
                isMoreButtonSelected = false
            });
            local v66 = v56.props.lastInputGroup == v24.InputType.Gamepad;
            v39("BuyActionBar", v66);
            if v66 then
                v65.captureFocus();
            end;
        end;
    end;
end;
v55.didMount = function(v67)
    local l_userRobux_0 = v67.props.userRobux;
    local l_localUserId_0 = v67.props.localUserId;
    local l_networking_1 = v67.props.networking;
    if l_userRobux_0 == nil then
        v67:setState({
            loadingRobux = true
        });
        v67.promise = v67.props.requestRobuxInfo(l_networking_1, l_localUserId_0):finally(function(v71)
            if v71 ~= v3.Status.Cancelled then
                v67:setState({
                    loadingRobux = false
                });
            end;
            v67.promise = nil;
        end);
    end;
end;
v55.willUnmount = function(v72)
    if v72.promise then
        v72.promise:cancel();
        v72.promise = nil;
    end;
end;
v55.getRecommendedItemButtonCount = function(v73)
    if not v73.props.recommendedItemSummaries then
        return 0;
    else
        return #v73.props.recommendedItemSummaries;
    end;
end;
v55.getGridWidth = function(v74)
    local v75 = v74:getRecommendedItemTileSize();
    local v76 = v74:getRecommendedItemButtonCount();
    return v75 * v76 + v30.ActionBar.SimilarItemsGridHorizontalPadding * (v76 + 1);
end;
v55.getScrollingListChildren = function(v77)
    local l_itemId_1 = v77.props.itemId;
    local l_itemType_1 = v77.props.itemType;
    local v80 = nil;
    if not v46 then
        v80 = v35.DEPRECATED_GetItemSubType(l_itemType_1, v77.props.DEPRECATED_itemData);
    else
        local l_itemInfo_0 = v77.props.itemInfo;
        if l_itemInfo_0 then
            v80 = l_itemInfo_0.itemSubType;
        end;
    end;
    local v82 = if not v77:getIsTryOnPage() then v77.props.itemDetailsViewState else v77.props.itemDetailsTryOnViewState;
    local _ = nil;
    return {
        UIPadding = v4.createElement("UIPadding", {
            PaddingTop = UDim.new(0, v30.ActionBar.SimilarItemsGridVerticalPadding), 
            PaddingBottom = UDim.new(0, v30.ActionBar.SimilarItemsGridVerticalPadding), 
            PaddingLeft = UDim.new(0, v30.ActionBar.SimilarItemsGridHorizontalPadding), 
            PaddingRight = UDim.new(0, v30.ActionBar.SimilarItemsGridHorizontalPadding)
        }), 
        RecommendedItemsGrid = not not l_itemId_1 and v4.createElement(v25, {
            itemId = l_itemId_1, 
            itemType = l_itemType_1, 
            itemSubType = v80, 
            getItemMetrics = v77.getRecommendedItemsGridItemMetrics, 
            onActivatedMountAsFullView = v82 == l_PeekViewState_0.Full or v82 == l_PeekViewState_0.Extended
        }) or nil
    };
end;
local _ = function(v84)
    if v45() then
        local v85 = if not v84.collectibleItemInfo then nil else v84.collectibleItemInfo.experiences;
        local _ = nil;
        if not v46 then
            if not v84.DEPRECATED_itemData then
                return v85, false;
            else
                return v85, v84.DEPRECATED_itemData.collectibleItemId ~= nil;
            end;
        elseif not v84.itemInfo then
            return v85, false;
        else
            return v85, v84.itemInfo.collectibleItemId ~= nil;
        end;
    else
        return nil, false;
    end;
end;
local function _(v88, v89)
    if v48 then
        local l_v89_0 = v89;
        if l_v89_0 then
            l_v89_0 = false;
            if v89.unitsAvailableForConsumption == 0 then
                l_v89_0 = v89.hasResellers;
            end;
        end;
        return v88 and not l_v89_0;
    else
        return v88;
    end;
end;
v55.render = function(v92)
    return l_withLocalization_0({
        freeText = "Feature.Catalog.LabelFree", 
        getPremium = "Feature.PremiumUpsell.Title.GetPremium", 
        soldOut = "Feature.Catalog.Label.SoldOut", 
        fromResale = "Feature.Catalog.Label.PriceFromResale", 
        inMultipleExperiences = "Feature.Catalog.Label.InMultipleExperiences", 
        inSingleExperience = "Feature.Catalog.Label.InSingleExperience"
    })(function(v93)
        return l_withStyle_0(function(v94)
            local l_ZIndex_0 = v92.props.ZIndex;
            local l_headerPadding_0 = v92.props.headerPadding;
            local l_leftPadding_0 = v92.props.leftPadding;
            local l_rightPadding_0 = v92.props.rightPadding;
            local l_topPadding_0 = v92.props.topPadding;
            local l_bottomPadding_0 = v92.props.bottomPadding;
            local l_showMoreButton_0 = v92.props.showMoreButton;
            local v102 = nil;
            local v103 = nil;
            if not v46 then
                v102 = v92.props.DEPRECATED_itemData;
            else
                v103 = v92.props.itemInfo;
            end;
            local l_localization_0 = v92.props.localization;
            local l_promptType_0 = v92.props.promptType;
            local l_collectiblesItemInfo_0 = v92.props.collectiblesItemInfo;
            local l_collectiblesResellersInstances_0 = v92.props.collectiblesResellersInstances;
            local l_resellableInstances_0 = v92.props.resellableInstances;
            local v109 = nil;
            local v110 = nil;
            local v111 = nil;
            local v112 = nil;
            local v113 = nil;
            local v114 = nil;
            local v115 = nil;
            local v116 = nil;
            v110 = v92.props.playerMembership == Enum.MembershipType.Premium;
            if not v46 then
                v109 = v102 and v102.priceInRobux;
                v111 = v35.DEPRECATED_HasPremiumBenefits(v102);
                v112 = v35.DEPRECATED_IsPremiumExclusive(v102);
                v113 = v35.DEPRECATED_IsResellable(v102);
                if not v113 then
                    if not (not v111 or not v110) then
                        v109 = v102 and v102.premiumPricing.premiumPriceInRobux;
                    end;
                else
                    v109 = v102 and (v102.lowestPrice or v102.priceInRobux);
                end;
                v114 = if not v102 then nil else v102.collectibleItemId;
            elseif v103 then
                v114 = v103.collectibleItemId;
                v109 = v103.priceInRobux;
                v111 = v103.hasPremiumBenefits;
                v112 = v103.isPremiumExclusive;
                v113 = v103.isResellable;
                if not v113 then
                    if not ((not v111 or not v110) or not v103.premiumPricing) then
                        v109 = v103.premiumPricing.premiumPriceInRobux;
                    end;
                else
                    v109 = v103.lowestPrice or v103.priceInRobux;
                end;
                if v103.premiumPricing then
                    v115 = v103.premiumPricing.premiumDiscountPercentage;
                    v116 = v103.premiumPricing.premiumPriceInRobux;
                end;
            end;
            local l_v111_0 = v111;
            if v44 then
                l_v111_0 = l_v111_0 and v92.props.showPremiumContent;
            end;
            local v118 = v109 and l_NumberLocalization_0.localize(v109 and string.format("%.0f", v109), l_localization_0:GetLocale());
            local v119 = true;
            local v120 = v112 and not v110;
            local l_v52_0 = v52;
            local l_Color_0 = v94.Theme.ContextualPrimaryDefault.Color;
            local l_Color_1 = v94.Theme.ContextualPrimaryContent.Color;
            local l_props_0 = v92.props;
            local v125, v126;
            if v45() then
                local v127 = if not l_props_0.collectibleItemInfo then nil else l_props_0.collectibleItemInfo.experiences;
                local v128 = nil;
                v128 = if not v46 then if l_props_0.DEPRECATED_itemData then l_props_0.DEPRECATED_itemData.collectibleItemId ~= nil else false else if l_props_0.itemInfo then l_props_0.itemInfo.collectibleItemId ~= nil else false;
                v125 = v127;
                v126 = v128;
            else
                v125 = nil;
                v126 = false;
            end;
            local l_collectibleItemInfo_0 = v92.props.collectibleItemInfo;
            if v48 then
                local l_l_collectibleItemInfo_0_0 = l_collectibleItemInfo_0;
                if l_l_collectibleItemInfo_0_0 then
                    l_l_collectibleItemInfo_0_0 = false;
                    if l_collectibleItemInfo_0.unitsAvailableForConsumption == 0 then
                        l_l_collectibleItemInfo_0_0 = l_collectibleItemInfo_0.hasResellers;
                    end;
                end;
                l_props_0 = v125 and not l_l_collectibleItemInfo_0_0;
            else
                l_props_0 = v125;
            end;
            if v49() then
                if not v46 then
                    if not v102 then
                        v126 = false;
                    else
                        l_collectibleItemInfo_0 = false;
                        if v102.collectibleItemId ~= nil then
                            l_collectibleItemInfo_0 = v102.collectibleItemId ~= "";
                        end;
                        v126 = l_collectibleItemInfo_0;
                    end;
                elseif not v103 then
                    v126 = false;
                else
                    l_collectibleItemInfo_0 = false;
                    if v103.collectibleItemId ~= nil then
                        l_collectibleItemInfo_0 = v103.collectibleItemId ~= "";
                    end;
                    v126 = l_collectibleItemInfo_0;
                end;
            end;
            if not v126 or v92.props.collectibleItemInfo then
                if not l_props_0 then
                    l_collectibleItemInfo_0 = nil;
                    l_collectibleItemInfo_0 = if not v49() then if v114 then v35.findCheapestCollectiblePurchaseInfo(v114, l_collectiblesItemInfo_0, l_collectiblesResellersInstances_0, l_resellableInstances_0) else {} else v35.findCheapestCollectiblePurchaseInfoV2(v114, v92.props.isLimitedCollectible, l_collectiblesItemInfo_0, l_collectiblesResellersInstances_0, l_resellableInstances_0);
                    if l_collectibleItemInfo_0.price then
                        v109 = l_collectibleItemInfo_0.price;
                        v118 = l_NumberLocalization_0.localize(v109, l_localization_0:GetLocale());
                        v113 = l_collectibleItemInfo_0.collectibleInstanceId ~= nil;
                    end;
                else
                    assert(v125, "");
                    l_collectibleItemInfo_0 = #v125;
                    v118 = if l_collectibleItemInfo_0 == 1 then v93.inSingleExperience else v93.inMultipleExperiences:gsub("{NUM_EXPERIENCES}", l_collectibleItemInfo_0);
                    if v47() then
                        v119 = false;
                        l_Color_0 = v94.Theme.SystemPrimaryDefault.Color;
                        l_Color_1 = v94.Theme.SystemPrimaryContent.Color;
                    end;
                end;
            else
                v118 = "";
                if v49() then
                    v119 = false;
                end;
            end;
            if not (not v54 or not l_v111_0) then
                l_v111_0 = false;
            end;
            l_collectibleItemInfo_0 = false;
            if l_promptType_0 == v29.ItemPromptType.SoldOut then
                v109 = nil;
                v118 = v93.soldOut;
                v113 = nil;
                l_collectibleItemInfo_0 = true;
                v119 = false;
            elseif l_promptType_0 == v29.ItemPromptType.Disabled then
                l_collectibleItemInfo_0 = true;
                v118 = "";
                l_v52_0 = v53;
            elseif l_promptType_0 == v29.ItemPromptType.OpenGoToAvatarEditorPrompt then
                v118 = "";
                l_v52_0 = v51;
            elseif l_promptType_0 == v29.ItemPromptType.OpenPremiumUpsellPrompt then
                v118 = v93.getPremium;
                v119 = false;
                l_Color_0 = v94.Theme.SystemPrimaryDefault.Color;
                l_Color_1 = v94.Theme.SystemPrimaryContent.Color;
            elseif not l_props_0 then
                if v109 == 0 then
                    v119 = false;
                    v118 = v93.freeText;
                elseif v113 then
                    if not v49() then
                        v118 = string.gsub(v93.fromResale, "{itemPrice}", v118);
                    elseif not (v126 and (not v126 or not v92.props.collectibleItemInfo)) then
                        v118 = string.gsub(v93.fromResale, "{itemPrice}", v118);
                    end;
                end;
            end;
            local l_fetchingState_0 = v92.props.fetchingState;
            local v132 = true;
            if l_fetchingState_0 ~= v21.Fetching then
                v132 = true;
                if l_fetchingState_0 ~= v21.NotStarted then
                    v132 = v92.state.loadingRobux;
                end;
            end;
            return v8.withFocusController(function(v133)
                local v134 = {
                    toastMessage = v92.props.localization:Format("IAPExperience.RobuxUpsell.Text.PurchaseNotAvailableOnHeadSet"), 
                    isLocalized = true, 
                    toastType = v43.InformationMessage
                };
                local l_disableIAPEntryPoint_0 = v92.props.disableIAPEntryPoint;
                local v136 = {
                    buttonText = v118, 
                    buttonIcon = not not v119 and l_v52_0 or nil, 
                    buttonIconPadding = not v119 and 0 or 5, 
                    buttonIconSize = not v119 and 0 or 30, 
                    buttonIsDisabled = l_collectibleItemInfo_0, 
                    buttonIsLoading = v132, 
                    buttonColor = l_Color_0, 
                    buttonTextColor = l_Color_1, 
                    onActivated = function()
                        if not l_props_0 then
                            v92.props.openItemPrompt(v92.props.networking, v92.props.analytics, v92.makeOverlayClosedCallback(v133), v92.props.navigation, v92.props.avatarRoute, v92.props.itemId, v92.props.itemType, l_disableIAPEntryPoint_0, v134);
                            return ;
                        else
                            v92.props.navigation.navigate(v15.ItemExperiencesMenu, {
                                collectibleData = v92.props.collectibleItemInfo
                            });
                            return ;
                        end;
                    end
                };
                local v137 = nil;
                local v138 = 0;
                if l_v111_0 then
                    v137 = v4.createElement(v32, {
                        headerPadding = l_headerPadding_0, 
                        isPlayerPremium = v110, 
                        isPremiumExclusive = v112, 
                        discountPercent = if not v46 then v102.premiumPricing.premiumDiscountPercentage else v115, 
                        premiumPrice = if not v46 then v102.premiumPricing.premiumPriceInRobux else v116, 
                        onPremiumActivated = not (v110 or v120) and v92.openPremiumUpsell or nil
                    });
                    v138 = v32:getPremiumBarHeight(v112, v110);
                end;
                return v4.createElement(v31, {
                    ZIndex = l_ZIndex_0, 
                    leftPadding = l_leftPadding_0, 
                    rightPadding = l_rightPadding_0, 
                    topPadding = l_topPadding_0, 
                    bottomPadding = l_bottomPadding_0, 
                    showMoreButton = l_showMoreButton_0, 
                    buttonProps = v136, 
                    topComponent = v137, 
                    topComponentHeight = v138, 
                    onMoreButtonActivated = function()
                        v92.openCatalogContextMenu(v92.makeOverlayClosedCallback(v133));
                        v92:setState({
                            isMoreButtonSelected = true
                        });
                    end, 
                    isMoreButtonSelected = v92.state.isMoreButtonSelected, 
                    hideGradient = v92.props.hideGradient
                });
            end);
        end);
    end);
end;
return l_RoactServices_0.connect({
    analytics = v36, 
    networking = v11, 
    localization = v12
})((l_RoactAppPolicy_0.connect(function(v139, _)
    return {
        showPremiumContent = v139.getShowCatalogPremiumContent(), 
        disableIAPEntryPoint = v139.getDisableIAPEntryPoint()
    };
end)((v16((l_withNavigation_0((v28((v7.connect(function(v141, v142)
    local l_LocalUserId_0 = v141.LocalUserId;
    local v144 = v38(v141, v142.itemId, v142.itemType);
    local v145 = nil;
    local v146 = nil;
    local v147 = nil;
    local v148 = nil;
    local v149 = nil;
    if not v46 then
        v145 = v33(v141.AvatarExperience.Common, v142.itemId, v142.itemType);
        v147 = (v145 and v145.product) and v145.product.id;
        v148 = if not not v145 and v145.collectibleItemId then v141.AvatarExperience.Common.Collectibles.CollectiblesItemInfo[v145.collectibleItemId] else nil;
        v149 = if not v49() then nil else v35.DEPRECATED_isLimitedCollectible(v145);
    else
        v146 = v14(v141.AvatarExperience, v142.itemId, v142.itemType);
        v147 = v146 and v146.productId;
        v148 = if not not v146 and v146.collectibleItemId then v141.AvatarExperience.Common.Collectibles.CollectiblesItemInfo[v146.collectibleItemId] else nil;
        v149 = if not v49() then nil else v146 and v146.isLimitedCollectible;
    end;
    return {
        fetchingState = l_PerformFetch_0.GetStatus(v141, v35.GetItemDetailsKey(v142.itemId, v142.itemType)), 
        DEPRECATED_itemData = if not v46 then v145 else nil, 
        itemInfo = if not v46 then nil else v146, 
        productId = v147, 
        userRobux = v141.UserRobux[l_LocalUserId_0], 
        localUserId = l_LocalUserId_0, 
        playerMembership = not not v141.Users[l_LocalUserId_0] and v141.Users[l_LocalUserId_0].membership or Enum.MembershipType.None, 
        promptType = v144, 
        collectibleItemInfo = v148, 
        collectiblesItemInfo = v141.AvatarExperience.Common.Collectibles.CollectiblesItemInfo, 
        collectiblesResellersInstances = v141.AvatarExperience.Common.Collectibles.CollectiblesResellersInstances, 
        resellableInstances = v141.AvatarExperience.Common.Collectibles.CollectiblesResellableInstances, 
        isLimitedCollectible = if not v49() then nil else v149
    };
end, function(v150)
    return {
        openPremiumUpsell = function(v151, v152, v153, v154, v155)
            v150(v37(v151, v152, nil, v155, {
                assetId = v153, 
                isBundle = v154
            }));
        end, 
        setCurrentToastMessage = function(v156)
            v150(v41(v156));
        end, 
        requestRobuxInfo = function(v157, v158)
            return v150(v20(v157, v158, false));
        end, 
        openItemPrompt = function(v159, v160, v161, v162, v163, v164, v165, v166, v167)
            return v150(v42(v159, v160, v161, v162, v163, v164, v165, v166, v167));
        end, 
        navigateWithLock = function(v168)
            v150(v40(v168));
        end
    };
end)(v55)))))))))));
