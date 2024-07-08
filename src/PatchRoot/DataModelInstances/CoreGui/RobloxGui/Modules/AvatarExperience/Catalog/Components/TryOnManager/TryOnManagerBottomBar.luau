local l_CoreGui_0 = game:GetService("CoreGui");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_CorePackages_0 = game:GetService("CorePackages");
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.RoactRodux);
local v5 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_withNavigation_0 = require(l_CorePackages_0.RoactNavigation).withNavigation;
local v7 = require(l_CorePackages_0.UIBlox);
local v8 = require(l_CorePackages_0.Packages.t);
local v9 = require(l_CorePackages_0.Cryo);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local l_NumberLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).NumberLocalization;
local l_ExternalEventConnection_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).ExternalEventConnection;
local l_isGamepadInput_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).isGamepadInput;
local v14 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_withStyle_0 = v7.Core.Style.withStyle;
local l_Images_0 = v7.App.ImageSet.Images;
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v20 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local v21 = require(l_Modules_0.AvatarExperience.AvatarEditor.GetAvatarEditorCategories);
local v22 = require(l_Modules_0.AvatarExperience.Catalog.Services.Analytics);
local v23 = require(l_Modules_0.LuaApp.Services.RoactLocalization);
local v24 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v25 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local v26 = require(l_Modules_0.AvatarExperience.Common.Thunks.NavigateWithLock);
local v27 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v28 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local v29 = require(l_Modules_0.AvatarExperience.Catalog.Components.ActionBar.ActionBar);
local v30 = require(l_Modules_0.AvatarExperience.Catalog.Components.ActionBar.ActionButton);
local v31 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.Debug.logOnOverlayClosed);
local v32 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withAvatarRoute);
local v33 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.ReportLook);
local v34 = require(l_Modules_0.AvatarExperience.Common.ReducerUtils);
local v35 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local v36 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v37 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v38 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagEnableCounterLooksWidgetHome);
local v39 = require(l_Modules_0.AvatarExperience.Common.Models.ItemInfo);
local v40 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXFixItemTypeHandling);
local v41 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagHideShowMoreButtonOnTryOnManager);
local v42 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXLimitedBundlesHandleNewData);
local v43 = require(l_Modules_0.AvatarExperience.Flags.FFlagEnableLeaveCatalogToAvatarPromptOverride);
local v44 = game:DefineFastFlag("EnableCustomizeButtonForSelectedLookItems", false);
local l_GetFFlagHideDraggerPeekView_0 = v14.GetFFlagHideDraggerPeekView;
local v46 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXRefactorTryOnItems);
local l_ActionBarHeight_0 = v27.ActionBar.ActionBarHeight;
local v48 = not l_GetFFlagHideDraggerPeekView_0() and 20 or 0;
local v49 = l_Images_0["icons/common/robux"];
local v50 = l_Images_0["icons/actions/block"];
local v51 = l_Images_0["icons/menu/avatar_on"];
local v52 = l_Images_0["icons/actions/feedback"];
local v53 = v3.PureComponent:extend("TryOnManagerBottomBar");
v53.validateProps = v8.strictInterface({
    tryOnItems = v8.optional(v8.table), 
    lookId = v8.optional(v8.string), 
    lookType = if not v46() then nil else v8.optional(v8.string), 
    assetInfos = v8.optional(v8.table), 
    bundleInfos = v8.optional(v8.table), 
    playerMembership = v8.optional(v8.enum(Enum.MembershipType)), 
    userRobux = v8.optional(v8.number), 
    collectiblesItemInfo = v8.table, 
    collectiblesResellersInstances = v8.table, 
    resellableInstances = v8.table, 
    showMoreButton = if not v41() then nil else v8.optional(v8.boolean), 
    navigateWithLock = v8.callback, 
    reportLook = v8.callback, 
    catalogAnalytics = v8.table, 
    localization = v8.table, 
    networking = v8.callback, 
    navigation = v8.table, 
    avatarRoute = v8.table, 
    focusController = v8.optional(v8.table)
});
v53.DEPRECATED_getPriceForItem = function(v54, v55)
    assert(not v40, "flag should be off");
    local l_playerMembership_0 = v54.props.playerMembership;
    local l_collectiblesItemInfo_0 = v54.props.collectiblesItemInfo;
    local l_collectiblesResellersInstances_0 = v54.props.collectiblesResellersInstances;
    local l_resellableInstances_0 = v54.props.resellableInstances;
    local v60 = v55.lowestPrice or v55.priceInRobux;
    if v28.DEPRECATED_HasPremiumBenefits(v55) then
        if not (l_playerMembership_0 == Enum.MembershipType.Premium) then
            if v28.DEPRECATED_IsPremiumExclusive(v55) then
                v60 = nil;
            end;
        else
            v60 = v55.premiumPricing.premiumPriceInRobux;
        end;
    end;
    local v61 = if not v42() then nil else v28.DEPRECATED_isLimitedCollectible(v55);
    if v55.collectibleItemId then
        local v62 = nil;
        v62 = if not v42() then v28.findCheapestCollectiblePurchaseInfo(v55.collectibleItemId, l_collectiblesItemInfo_0, l_collectiblesResellersInstances_0, l_resellableInstances_0) else v28.findCheapestCollectiblePurchaseInfoV2(v55.collectibleItemId, v61 or false, l_collectiblesItemInfo_0, l_collectiblesResellersInstances_0, l_resellableInstances_0);
        if v62.price then
            v60 = v62.price;
        end;
    end;
    return v60;
end;
v53.getPriceForItem = function(v63, v64)
    assert(v40, "flag should be on");
    local l_playerMembership_1 = v63.props.playerMembership;
    local l_collectiblesItemInfo_1 = v63.props.collectiblesItemInfo;
    local l_collectiblesResellersInstances_1 = v63.props.collectiblesResellersInstances;
    local l_resellableInstances_1 = v63.props.resellableInstances;
    local v69 = v64.lowestPrice or v64.priceInRobux;
    if v64.hasPremiumBenefits then
        if not (l_playerMembership_1 == Enum.MembershipType.Premium) or not v64.premiumPricing then
            if v64.isPremiumExclusive then
                v69 = nil;
            end;
        else
            v69 = v64.premiumPricing.premiumPriceInRobux;
        end;
    end;
    if v64.collectibleItemId then
        local v70 = nil;
        v70 = if not v42() then v28.findCheapestCollectiblePurchaseInfo(v64.collectibleItemId, l_collectiblesItemInfo_1, l_collectiblesResellersInstances_1, l_resellableInstances_1) else v28.findCheapestCollectiblePurchaseInfoV2(v64.collectibleItemId, v64.isLimitedCollectible, l_collectiblesItemInfo_1, l_collectiblesResellersInstances_1, l_resellableInstances_1);
        if v70.price then
            v69 = v70.price;
        end;
    end;
    return v69;
end;
v53.getItemInfo = function(v71, v72, v73)
    local v74 = nil;
    local v75 = nil;
    if not v40 then
        if v73 == v36.ItemType.Asset then
            return v74, v71.props.assetInfos[v72];
        else
            v75 = v71.props.bundleInfos[v72];
        end;
    elseif v73 == v36.ItemType.Asset then
        if v71.props.assetInfos[v72] then
            return v39.fromAssetInfo(v71.props.assetInfos[v72]), v75;
        end;
    elseif v71.props.bundleInfos[v72] then
        return v39.fromBundleInfo(v71.props.bundleInfos[v72]), v75;
    end;
    return v74, v75;
end;
v53.getBottomBarInfo = function(v76, _)
    local v78 = 0;
    local v79 = 0;
    local v80 = {};
    local v81 = false;
    for v82, v83 in v76.props.tryOnItems, nil, nil do
        if v83.selectedInTryOnManager then
            v78 = v78 + 1;
            local v84 = nil;
            local v85 = nil;
            local v86, v87 = v76:getItemInfo(if not v46() then v82 else v83.itemId, v83.itemType);
            v84 = v86;
            v85 = v87;
            v86 = nil;
            if not v40 then
                if v85 and v85.receivedCatalogData then
                    if not v85.isOwned then
                        v86 = v76:DEPRECATED_getPriceForItem(v85);
                    else
                        continue;
                    end;
                else
                    v81 = true;
                    continue;
                end;
            elseif v84 and v84.receivedCatalogData then
                if not v84.isOwned then
                    v86 = v76:getPriceForItem(v84);
                else
                    continue;
                end;
            else
                v81 = true;
                continue;
            end;
            if v86 ~= nil then
                v79 = v79 + v86;
                v80[v82] = v9.Dictionary.join(v83, {
                    expectedPrice = v86
                });
            end;
        end;
    end;
    return v79, v78, v80, v81;
end;
v53.areAllTryOnsOwned = function(v88)
    for v89, v90 in v88.props.tryOnItems, nil, nil do
        local v91 = nil;
        local v92 = nil;
        local v93, v94 = v88:getItemInfo(if not v46() then v89 else v90.itemId, v90.itemType);
        v91 = v93;
        v92 = v94;
        if not v40 then
            if v92 and v92.receivedCatalogData then
                if not v92.isOwned then
                    return false;
                end;
            else
                return false;
            end;
        elseif v91 and v91.receivedCatalogData then
            if not v91.isOwned then
                return false;
            end;
        else
            return false;
        end;
    end;
    return true;
end;
v53.areAllSelectedTryOnsOwned = function(v95)
    local v96 = 0;
    for v97, v98 in v95.props.tryOnItems, nil, nil do
        if v98.selectedInTryOnManager then
            local v99 = nil;
            local v100 = nil;
            local v101, v102 = v95:getItemInfo(if not v46() then v97 else v98.itemId, v98.itemType);
            v99 = v101;
            v100 = v102;
            if not v40 then
                if v100 and v100.receivedCatalogData then
                    if not v100.isOwned then
                        return false;
                    end;
                else
                    return false;
                end;
            elseif v99 and v99.receivedCatalogData then
                if not v99.isOwned then
                    return false;
                end;
            else
                return false;
            end;
            v96 = v96 + 1;
        end;
    end;
    return v96 > 0;
end;
v53.getAvatarEditorCategoryIndexesByName = function(_, v104, v105)
    local v106 = v21();
    local v107 = nil;
    local v108 = nil;
    for v109, v110 in v106, nil, nil do
        if v110.Name == v104 then
            v107 = v109;
            if not v105 or not v110.Subcategories then
                break;
            else
                for v111, v112 in v110.Subcategories, nil, nil do
                    if v112.Name == v105 then
                        return v107, v111;
                    end;
                end;
                return v107, v108;
            end;
        end;
    end;
    return v107, v108;
end;
v53.init = function(v113)
    v113:setState({
        lastInputIsGamepad = l_isGamepadInput_0((l_UserInputService_0:GetLastInputType()))
    });
    v113.lastInputTypeChangedCallback = function(v114)
        local v115 = l_isGamepadInput_0(v114);
        if v115 ~= v113.state.lastInputIsGamepad then
            v113:setState({
                lastInputIsGamepad = v115
            });
        end;
    end;
    v113.onOverlayClosed = function(v116)
        return function()
            if v113.state.lastInputIsGamepad and v113.props.avatarRoute.current.name == v25.TryOnManager then
                v31("TryOnManager");
                v116.captureFocus();
            end;
        end;
    end;
    v113.onButtonPress = function()
        local l_navigation_0 = v113.props.navigation;
        local l_catalogAnalytics_0 = v113.props.catalogAnalytics;
        local v119, v120, v121 = v113:getBottomBarInfo();
        local v122 = nil;
        local v123 = nil;
        if v113.props.userRobux < v119 then
            v122 = v25.InsufficientRobuxPrompt;
            v123 = {
                onOverlayClosed = v113.onOverlayClosed(v113.props.focusController)
            };
            l_catalogAnalytics_0.avatarShopBuyOutfit(v120, v119, true, "insufficientRobux");
        elseif not (not v43 or not v9.isEmpty(v121)) and v113.props.lookId ~= nil then
            local v124, v125 = v113:getAvatarEditorCategoryIndexesByName(v20.CharacterKey);
            v122 = v25.LeaveCatalogToAvatarPrompt;
            v123 = {
                onOverlayClosed = v113.onOverlayClosed(v113.props.focusController), 
                categoryOverride = v124, 
                subcategoryOverride = v125
            };
        else
            local v126 = {};
            for v127, v128 in v113.props.tryOnItems, nil, nil do
                if v128.selectedInTryOnManager then
                    local v129 = nil;
                    local v130 = nil;
                    local v131, v132 = v113:getItemInfo(if not v46() then v127 else v128.itemId, v128.itemType);
                    v129 = v131;
                    v130 = v132;
                    if not v40 then
                        if not (not v130 or not v130.isOwned) then
                            if not v46() then
                                v126[v127] = v128;
                            else
                                v126[v34.generateTryOnItemIdKey(v128.itemId, v128.itemType, v113.props.lookType)] = v128;
                            end;
                        end;
                    elseif not (not v129 or not v129.isOwned) then
                        v126[v127] = v128;
                    end;
                end;
            end;
            if v113.props.lookId ~= nil then
                v122 = v25.PurchaseLookPrompt;
                v123 = {
                    itemsToPurchase = v121, 
                    lookId = v113.props.lookId, 
                    ownedTryOnItems = v126, 
                    priceInRobux = v119, 
                    showSaveAsCharacter = true, 
                    showWearAfterPurchase = true
                };
                if v38() then
                    if not v35.isWithinViewContext(v113.props.avatarRoute, v25.CatalogSearch) then
                        l_catalogAnalytics_0.sendAXCounter(v37.Counter.PopularLooksWidgetHomeBuyClicked);
                    else
                        l_catalogAnalytics_0.sendAXCounter(v37.Counter.PopularLooksWidgetSearchBuyClicked);
                    end;
                end;
            else
                v122 = v25.PurchaseOutfitPrompt;
                v123 = {
                    itemsToPurchase = v121, 
                    ownedTryOnItems = v126, 
                    totalOutfitPrice = v119, 
                    onOverlayClosed = v113.onOverlayClosed(v113.props.focusController)
                };
            end;
        end;
        v113.props.navigateWithLock(function()
            l_navigation_0.navigate(v122, v123);
        end);
    end;
    v113.contextMenuClosedCallback = function(v133)
        return function()
            v113:setState({
                isMoreButtonSelected = false
            });
            v113.onOverlayClosed(v133);
        end;
    end;
    v113.openLooksContextMenu = function(v134, v135)
        local l_navigation_1 = v113.props.navigation;
        v113.props.navigateWithLock(function()
            l_navigation_1.navigate(v25.ContextMenu, {
                centered = false, 
                contextButtons = {
                    {
                        icon = v52, 
                        text = v135.reportText, 
                        onActivated = function(v137)
                            v113.props.reportLook(v113.props.networking);
                            v35.closeOverlay(v137);
                        end
                    }
                }, 
                onOverlayClosed = v134
            });
        end);
    end;
end;
v53.renderWithProviders = function(v138, v139, v140)
    local l_Theme_0 = v139.Theme;
    local l_Font_0 = v139.Font;
    local v143, v144, v145, v146 = v138:getBottomBarInfo(v140);
    local l_v49_0 = v49;
    local v148 = false;
    local v149 = nil;
    if not v9.isEmpty(v145) then
        if v143 == 0 then
            l_v49_0 = nil;
            v149 = v140.freeText;
        else
            v149 = l_NumberLocalization_0.localize(string.format("%.0f", v143), v138.props.localization:GetLocale());
        end;
    else
        v149 = "";
        if not (v43 and v138.props.lookId ~= nil) or not (not v44 and v138:areAllTryOnsOwned()) and (not v44 or not v138:areAllSelectedTryOnsOwned()) then
            l_v49_0 = v50;
            v148 = true;
        else
            l_v49_0 = v51;
        end;
    end;
    local v150 = {
        buttonText = v149, 
        buttonIcon = l_v49_0, 
        buttonIsLoading = v146, 
        buttonIsDisabled = v148, 
        buttonIconPadding = 5, 
        buttonIconSize = 30, 
        buttonColor = v139.Theme.ContextualPrimaryDefault.Color, 
        buttonTextColor = v139.Theme.ContextualPrimaryContent.Color, 
        onActivated = not v148 and v138.onButtonPress or nil
    };
    local v151 = v138.props.localization:Format("Feature.Avatar.Label.TryOnManagerDescriptor", {
        numItems = v144
    });
    if v138.props.lookId ~= nil then
        return v3.createElement(v29, {
            bottomPadding = v48, 
            buttonProps = v150, 
            hideGradient = true, 
            isMoreButtonSelected = v138.state.isMoreButtonSelected, 
            leftPadding = v48, 
            onMoreButtonActivated = function()
                v138.openLooksContextMenu(v138.contextMenuClosedCallback(v138.props.focusController), v140);
                v138:setState({
                    isMoreButtonSelected = true
                });
            end, 
            rightPadding = v48, 
            showMoreButton = not v41() and true or (not (v138.props.showMoreButton ~= nil) or v138.props.showMoreButton), 
            topComponent = if not l_GetFFlagHideDraggerPeekView_0() then v3.createElement("TextLabel", {
                LayoutOrder = 1, 
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 0, 30), 
                Text = v151, 
                TextSize = l_Font_0.BaseSize * l_Font_0.Header2.RelativeSize, 
                Font = l_Font_0.Header2.Font, 
                TextColor3 = l_Theme_0.SecondaryContent.Color, 
                TextTransparency = l_Theme_0.SecondaryContent.Transparency, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Top
            }) else nil, 
            topComponentHeight = not l_GetFFlagHideDraggerPeekView_0() and 30 or 0, 
            ZIndex = 1
        });
    else
        return v3.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(1, 1), 
            Position = UDim2.fromOffset(0, -10)
        }, {
            UIListLayout = v3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Top, 
                Padding = UDim.new(0, 12)
            }), 
            TryOnDescriptor = v3.createElement("TextLabel", {
                LayoutOrder = 1, 
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 0, 20), 
                Text = v151, 
                TextSize = l_Font_0.BaseSize * l_Font_0.Header2.RelativeSize, 
                Font = l_Font_0.Header2.Font, 
                TextColor3 = l_Theme_0.SecondaryContent.Color, 
                TextTransparency = l_Theme_0.SecondaryContent.Transparency, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Top
            }), 
            ActionButton = v3.createElement(v30, {
                LayoutOrder = 2, 
                Size = UDim2.new(1, 0, 0, l_ActionBarHeight_0), 
                Font = l_Font_0, 
                buttonProps = v150
            }), 
            LastInputTypeChangedConnection = v3.createElement(l_ExternalEventConnection_0, {
                event = l_UserInputService_0.LastInputTypeChanged, 
                callback = v138.lastInputTypeChangedCallback
            })
        });
    end;
end;
v53.render = function(v152)
    return l_withStyle_0(function(v153)
        return l_withLocalization_0({
            freeText = "Feature.Catalog.LabelFree", 
            reportText = "Feature.Catalog.Action.Report"
        })(function(v154)
            return v152:renderWithProviders(v153, v154);
        end);
    end);
end;
v53 = v32((l_withNavigation_0(v4.connect(function(v155, _)
    local l_LocalUserId_0 = v155.LocalUserId;
    local v162 = if not v46() then nil else function()
        local v158 = nil;
        local l_Looks_0 = v155.AvatarExperience.AvatarScene.Looks;
        local l_LookId_0 = v155.AvatarExperience.AvatarScene.OutfitTryOn.LookId;
        if l_LookId_0 ~= nil and l_Looks_0 ~= nil then
            local v161 = l_Looks_0[l_LookId_0];
            if v161 then
                v158 = v161.lookType;
            end;
        end;
        return v158;
    end;
    return {
        tryOnItems = v155.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems, 
        lookId = v155.AvatarExperience.AvatarScene.OutfitTryOn.LookId, 
        lookType = if not not v46() and v162 then v162() else nil, 
        assetInfos = v155.AvatarExperience.Common.AssetInfos, 
        bundleInfos = v155.AvatarExperience.Common.BundleInfos, 
        playerMembership = not not v155.Users[l_LocalUserId_0] and v155.Users[l_LocalUserId_0].membership or Enum.MembershipType.None, 
        userRobux = v155.UserRobux[l_LocalUserId_0], 
        collectiblesItemInfo = v155.AvatarExperience.Common.Collectibles.CollectiblesItemInfo, 
        collectiblesResellersInstances = v155.AvatarExperience.Common.Collectibles.CollectiblesResellersInstances, 
        resellableInstances = v155.AvatarExperience.Common.Collectibles.CollectiblesResellableInstances
    };
end, function(v163)
    return {
        navigateWithLock = function(v164)
            v163(v26(v164));
        end, 
        reportLook = function(v165)
            v163(v33(v165));
        end
    };
end)((l_RoactServices_0.connect({
    catalogAnalytics = v22, 
    localization = v23, 
    networking = v24
})(v53))), nil)));
return function(v166)
    return v5.withFocusController(function(v167)
        return v3.createElement(v53, v9.Dictionary.join(v166, {
            focusController = v167
        }));
    end);
end;
