local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.RoactRodux);
local l_Focusable_0 = require(l_CorePackages_0.Packages.RoactGamepad).Focusable;
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v8 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local l_UrlBuilder_0 = require(l_CorePackages_0.Packages.UrlBuilder).UrlBuilder;
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local v11 = require(l_Modules_0.LuaApp.AppPage);
local v12 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local v13 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withMappedNavigationParams);
local v14 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local v15 = require(l_Modules_0.AvatarExperience.Catalog.Services.Analytics);
local v16 = require(l_Modules_0.AvatarExperience.Common.Validators.DEPRECATED_ItemDataValidator);
local l_AssetTypeIdStringToName_0 = require(l_Modules_0.AvatarExperience.Common.Constants).AssetTypeIdStringToName;
local v18 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v19 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v20 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v21 = require(l_Modules_0.LuaApp.Constants);
local v22 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local v23 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.GetAssetFavorite);
local v24 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.SetAssetFavorite);
local v25 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.GetBundleFavorite);
local v26 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.SetBundleFavorite);
local v27 = require(l_Modules_0.AvatarExperience.Common.Selectors.DEPRECATED_ItemData);
local v28 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectItemInfo);
local v29 = require(l_Modules_0.AvatarExperience.Common.Models.ItemInfo);
local v30 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXFixItemTypeHandling);
local v31 = require(l_Modules_0.AvatarExperience.Common.Components.withOverlayFocusHandling);
local v32 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withAvatarRoute);
local v33 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarRoute);
local v34 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v36 = require(l_Modules_0.LuaApp.Enum.RetrievalStatus);
local v37 = require(l_Modules_0.LuaApp.Http.Url);
local v38 = require(l_CorePackages_0.UIBlox);
local v39 = require(l_CorePackages_0.Packages.t);
local l_ContextualMenu_0 = v38.App.Menu.ContextualMenu;
local l_MenuDirection_0 = v38.App.Menu.MenuDirection;
local l_Images_0 = v38.App.ImageSet.Images;
local v43 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagRestrictLimited2ToSoothsayers);
local l_GetFFlagLuafiedReportEntryPoints_0 = v34.GetFFlagLuafiedReportEntryPoints;
local l_GetFFlagEnableAbuseReport10ft_0 = v34.GetFFlagEnableAbuseReport10ft;
local v46 = l_GuiService_0:IsTenFootInterface();
local v47 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectIsPortrait);
local v48 = l_Images_0["icons/actions/favoriteOff"];
local v49 = l_Images_0["icons/actions/favoriteOn"];
local v50 = l_Images_0["icons/menu/customize"];
local v51 = l_Images_0["icons/menu/shop"];
local v52 = l_Images_0["icons/actions/share"];
local v53 = l_Images_0["icons/actions/feedback"];
local v54 = v3.PureComponent:extend("CatalogContextFrame");
v54.validateProps = v39.strictInterface({
    itemId = v39.string, 
    itemType = v39.string, 
    onOverlayClosed = v39.optional(v39.callback), 
    centered = v39.optional(v39.boolean), 
    defaultChildRef = v39.optional(v39.table), 
    focusController = v39.optional(v39.table), 
    navigation = v39.table, 
    avatarRoute = v33.Interface, 
    analytics = v39.any, 
    shouldShowShareButton = v39.boolean, 
    shouldShareToProvider = v39.boolean, 
    reportingDisabled = v39.boolean, 
    webViewSupport = v39.boolean, 
    useLuafiedReportFlow = if l_GetFFlagLuafiedReportEntryPoints_0() or l_GetFFlagEnableAbuseReport10ft_0() then v39.boolean else nil, 
    favoritesFetchingState = v39.any, 
    localUserId = v39.string, 
    isFavorited = v39.optional(v39.boolean), 
    DEPRECATED_itemData = if not v30 then v39.optional(v16) else nil, 
    itemInfo = if not v30 then nil else v39.optional(v29.Validator), 
    screenSize = v39.Vector2, 
    userHasMembership = v39.boolean, 
    boundInputs = v39.table, 
    isCollectiblesEnabled = if not v43() then nil else v39.optional(v39.boolean), 
    collectiblesResaleRestriction = v39.number, 
    navigateDown = v39.callback, 
    getAssetFavorite = v39.callback, 
    getBundleFavorite = v39.callback, 
    setAssetFavorite = v39.callback, 
    setBundleFavorite = v39.callback, 
    isPortrait = v39.optional(v39.boolean)
});
local function _(v55, v56)
    local v57 = nil;
    local l_itemId_0 = v56.itemId;
    local l_itemType_0 = v56.itemType;
    if l_itemType_0 == v18.ItemType.Asset then
        return v55.AvatarExperience.Catalog.AssetFavorites[l_itemId_0];
    else
        if l_itemType_0 == v18.ItemType.Bundle then
            v57 = v55.AvatarExperience.Catalog.BundleFavorites[l_itemId_0];
        end;
        return v57;
    end;
end;
local function _(v61, v62)
    local v63 = nil;
    local l_itemId_1 = v62.itemId;
    local l_itemType_1 = v62.itemType;
    if l_itemType_1 == v18.ItemType.Asset then
        v63 = v20.SetFavoriteAssetKey;
    elseif l_itemType_1 == v18.ItemType.Bundle then
        v63 = v20.SetFavoriteBundleKey;
    end;
    return l_PerformFetch_0.GetStatus(v61, v63 .. tostring(l_itemId_1));
end;
v54.init = function(v67)
    local v68, v69 = v3.createBinding(UDim2.fromScale(1, 1));
    v67.contextMenuSize = v68;
    v67.updateContextMenuSize = v69;
    v67.goToAvatarPage = function()
        v67.props.analytics.clickCustomizeItemButton(v67.props.itemId, v67.props.itemType);
        v14.navigateFromOverlay(v67.props.navigation, v12.AvatarEditor);
    end;
    v67.openSellPage = function()
        local l_itemId_2 = v67.props.itemId;
        local l_itemType_2 = v67.props.itemType;
        local l_userHasMembership_0 = v67.props.userHasMembership;
        local l_navigation_0 = v67.props.navigation;
        if not l_userHasMembership_0 then
            v14.navigateToNextOverlay(l_navigation_0, v12.PremiumSellOnlyPrompt);
            return ;
        elseif not (not v43() and true or v67.props.isCollectiblesEnabled) then
            v14.navigateFromOverlay(v67.props.navigation, v12.SellItemPage, {
                itemId = l_itemId_2, 
                itemType = l_itemType_2
            });
            return ;
        else
            local v74 = nil;
            if not v30 then
                v74 = v67.props.DEPRECATED_itemData.collectibleItemId;
            elseif v67.props.itemInfo then
                v74 = v67.props.itemInfo.collectibleItemId;
            end;
            v14.navigateFromOverlay(v67.props.navigation, v12.ItemOwnershipPage, {
                itemId = l_itemId_2, 
                collectibleItemId = v74, 
                itemType = l_itemType_2
            });
            return ;
        end;
    end;
    v67.favoriteItem = function()
        local l_isFavorited_0 = v67.props.isFavorited;
        local v76 = true;
        if l_isFavorited_0 ~= nil then
            v76 = v67.props.favoritesFetchingState == v36.Fetching;
        end;
        if not v76 then
            local l_itemId_3 = v67.props.itemId;
            local l_itemType_3 = v67.props.itemType;
            local l_analytics_0 = v67.props.analytics;
            if l_itemType_3 == v18.ItemType.Asset then
                v67.props.setAssetFavorite(l_itemId_3, not l_isFavorited_0);
            elseif l_itemType_3 == v18.ItemType.Bundle then
                v67.props.setBundleFavorite(l_itemId_3, not l_isFavorited_0);
            end;
            l_analytics_0.clickFavoriteItemButton(l_itemId_3, l_itemType_3, not l_isFavorited_0);
            return ;
        else
            return ;
        end;
    end;
    v67.shareItem = function()
        local v80 = l_UrlBuilder_0.catalog.info.appsflyer({
            assetId = v67.props.itemId, 
            assetType = v67.props.itemType
        });
        v67.props.analytics.clickShareItemButton(v67.props.itemId, v67.props.itemType);
        v67.closePrompt();
        v67.props.navigateDown({
            name = v11.ShareSheet, 
            extraProps = {
                url = v80, 
                context = "CatalogMoreMenu"
            }
        });
    end;
    v67.reportItem = function(v81)
        local l_navigation_1 = v67.props.navigation;
        local l_itemId_4 = v67.props.itemId;
        local l_DEPRECATED_itemData_0 = v67.props.DEPRECATED_itemData;
        local l_itemInfo_0 = v67.props.itemInfo;
        local l_localUserId_0 = v67.props.localUserId;
        local v87 = v37.BASE_URL .. "/abusereport/asset?id=" .. l_itemId_4;
        local v88 = nil;
        local v89 = nil;
        local v90 = nil;
        local v91 = nil;
        local v92 = nil;
        if not v30 then
            if l_DEPRECATED_itemData_0 then
                if l_DEPRECATED_itemData_0.creator then
                    v88 = l_DEPRECATED_itemData_0.creator.id;
                    v89 = l_DEPRECATED_itemData_0.creator.name;
                end;
                v90 = l_DEPRECATED_itemData_0.name;
                v91 = l_DEPRECATED_itemData_0.description;
                v92 = l_DEPRECATED_itemData_0.assetType;
            end;
        elseif l_itemInfo_0 then
            if l_itemInfo_0.creator then
                v88 = l_itemInfo_0.creator.id;
                v89 = l_itemInfo_0.creator.name;
            end;
            v90 = l_itemInfo_0.name;
            v91 = l_itemInfo_0.description;
            v92 = l_itemInfo_0.itemSubType;
        end;
        if not v67.props.useLuafiedReportFlow then
            if not v46 then
                v67.closePrompt();
                v67.props.navigateDown({
                    name = v11.GenericWebPage, 
                    detail = v87, 
                    extraProps = {
                        title = v81
                    }
                });
                return ;
            else
                v14.navigateToNextOverlay(l_navigation_1, v12.CatalogReport, {
                    userId = l_localUserId_0, 
                    itemId = l_itemId_4, 
                    itemCreatorId = v88, 
                    itemName = v90, 
                    itemDescription = v91
                });
                return ;
            end;
        elseif not l_GetFFlagEnableAbuseReport10ft_0() or not v46 then
            v14.navigateToNextOverlay(l_navigation_1, v12.ReportDialog, {
                userId = l_localUserId_0, 
                itemId = l_itemId_4, 
                itemCreatorId = v88, 
                itemCreatorName = v89, 
                itemName = v90, 
                itemDescription = v91, 
                assetTypeName = l_AssetTypeIdStringToName_0[v92]
            });
            return ;
        else
            v67.props.navigateDown({
                name = v11.ReportScreen, 
                reportData = {
                    assetId = l_itemId_4, 
                    platform = v20.ReportScreen.Platforms.Console, 
                    context = v20.ReportScreen.Contexts.Item, 
                    reportAbuseVector = l_AssetTypeIdStringToName_0[v92]
                }
            });
            return ;
        end;
    end;
    v67.closePrompt = function()
        v14.closeOverlay(v67.props.navigation);
    end;
    v67.containerSizeChanged = function(v93)
        if v93.AbsoluteSize.X > 640 then
            v67.updateContextMenuSize((UDim2.new(0, 300, 1, 0)));
            return ;
        else
            v67.updateContextMenuSize(UDim2.fromScale(1, 1));
            return ;
        end;
    end;
end;
v54.didMount = function(v94)
    if v94.props.isFavorited == nil then
        local l_itemId_5 = v94.props.itemId;
        local l_itemType_4 = v94.props.itemType;
        if l_itemType_4 == v18.ItemType.Asset then
            v94.props.getAssetFavorite(l_itemId_5);
            return ;
        elseif l_itemType_4 == v18.ItemType.Bundle then
            v94.props.getBundleFavorite(l_itemId_5);
        end;
    end;
end;
v54.renderLocalized = function(v97, v98)
    local l_centered_0 = v97.props.centered;
    local l_itemType_5 = v97.props.itemType;
    local l_DEPRECATED_itemData_1 = v97.props.DEPRECATED_itemData;
    local l_itemInfo_1 = v97.props.itemInfo;
    local l_isFavorited_1 = v97.props.isFavorited;
    local l_closePrompt_0 = v97.closePrompt;
    local l_screenSize_0 = v97.props.screenSize;
    local l_name_0 = v97.props.avatarRoute.opaque.name;
    local l_userHasMembership_1 = v97.props.userHasMembership;
    local l_reportingDisabled_0 = v97.props.reportingDisabled;
    local l_collectiblesResaleRestriction_0 = v97.props.collectiblesResaleRestriction;
    local v110 = not not l_isFavorited_1 and v49 or v48;
    local v111 = nil;
    if not v30 then
        v111 = l_DEPRECATED_itemData_1.creator and l_DEPRECATED_itemData_1.creator.id;
    elseif not (not l_itemInfo_1 or not l_itemInfo_1.creator) then
        v111 = l_itemInfo_1.creator.id;
    end;
    local v112 = false;
    if v111 ~= "1" then
        v112 = not l_reportingDisabled_0;
    end;
    local v113 = nil;
    if not v30 then
        v113 = v22.DEPRECATED_IsResellable(l_DEPRECATED_itemData_1);
    elseif l_itemInfo_1 then
        v113 = l_itemInfo_1.isResellable;
    end;
    local v114 = not not l_isFavorited_1 and v98.unfavoriteLabel or v98.favoriteLabel;
    local l_reportLabel_0 = v98.reportLabel;
    local v116 = {};
    local v117 = nil;
    if not v30 then
        v117 = l_DEPRECATED_itemData_1.isOwned;
    elseif l_itemInfo_1 then
        v117 = l_itemInfo_1.isOwned;
    end;
    if v117 and l_name_0 ~= v12.AvatarEditor then
        table.insert(v116, {
            icon = v50, 
            text = v98.customizeLabel, 
            onActivated = v97.goToAvatarPage
        });
    end;
    table.insert(v116, {
        icon = v110, 
        text = v114, 
        onActivated = v97.favoriteItem
    });
    local v118 = (not v46 or l_userHasMembership_1) and l_collectiblesResaleRestriction_0 ~= v20.ResaleRestriction.Disabled;
    if not ((not v117 or not v113) or not v118) then
        table.insert(v116, {
            icon = v51, 
            text = v98.sellLabel, 
            onActivated = v97.openSellPage
        });
    end;
    if not (not ((v97.props.shouldShowShareButton and not v46) and v97.props.webViewSupport) or v97.props.shouldShareToProvider) then
        table.insert(v116, {
            icon = v52, 
            text = v98.shareLabel, 
            onActivated = v97.shareItem
        });
    end;
    if (v112 and l_itemType_5 == v18.ItemType.Asset) and (v97.props.useLuafiedReportFlow or v97.props.webViewSupport) then
        table.insert(v116, {
            icon = v53, 
            text = l_reportLabel_0, 
            onActivated = function()
                v97.reportItem(l_reportLabel_0);
            end
        });
    end;
    local l_isPortrait_0 = v97.props.isPortrait;
    local v120 = if not l_isPortrait_0 then v18.LandscapeNavWidth else 0;
    local v121 = -76;
    if v19.getNumElementsWithKeyField(v97.props.boundInputs) > 0 then
        v121 = -76 - v21.GAMEPAD_BOTTOM_BAR_SIZE;
    end;
    local v122 = if not l_isPortrait_0 then v18.LandscapeSceneWidth else 1;
    local v123 = nil;
    local v124 = nil;
    if not l_centered_0 or l_isPortrait_0 then
        v123 = UDim2.fromScale(v120, 0);
        v124 = UDim2.fromScale(v122, 1);
    else
        local v125 = math.min(l_screenSize_0.X, 640);
        v123 = UDim2.fromOffset((l_screenSize_0.X - v125) / 2, 0);
        v124 = UDim2.new(0, v125, 1, 0);
    end;
    return v3.createElement(l_Focusable_0.Frame, {
        BackgroundTransparency = 1, 
        Position = v123, 
        Size = v124, 
        [v3.Ref] = v97.props.defaultChildRef, 
        [v3.Change.AbsoluteSize] = v97.containerSizeChanged
    }, {
        SizeFrame = v3.createElement("Frame", {
            BackgroundTransparency = 1, 
            Position = UDim2.fromScale(0.5, 0), 
            AnchorPoint = Vector2.new(0.5, 0), 
            Size = v97.contextMenuSize
        }, {
            ContextMenu = v3.createElement(l_ContextualMenu_0, {
                buttonProps = v116, 
                open = true, 
                menuDirection = l_MenuDirection_0.Up, 
                openPositionY = UDim.new(1, v121), 
                closeBackgroundVisible = true, 
                screenSize = l_screenSize_0, 
                onDismiss = l_closePrompt_0
            })
        })
    });
end;
v54.render = function(v126)
    if not v30 then
        if not v126.props.DEPRECATED_itemData then
            return ;
        end;
    elseif not v126.props.itemInfo then
        return ;
    end;
    return l_withLocalization_0({
        customizeLabel = "Feature.Catalog.Action.Customize", 
        favoriteLabel = "Feature.Catalog.Action.Favorite", 
        unfavoriteLabel = "Feature.Catalog.Action.RemoveFavorite", 
        sellLabel = "Feature.Catalog.Action.Sell", 
        shareLabel = "Feature.SocialShare.Action.Share", 
        reportLabel = "Feature.Catalog.Action.Report"
    })(function(v127)
        return v126:renderLocalized(v127);
    end);
end;
return (v13((v32((v31((l_RoactAppPolicy_0.connect(function(v128, _)
    return {
        shouldShowShareButton = v128.shouldShowCatalogShareButton(), 
        shouldShareToProvider = v128.shouldShareToAccountProvider(), 
        reportingDisabled = v128.getCatalogReportingDisabled(), 
        webViewSupport = v128.getWebViewSupport(), 
        useLuafiedReportFlow = if l_GetFFlagLuafiedReportEntryPoints_0() or l_GetFFlagEnableAbuseReport10ft_0() then v128.getUseLuafiedReportFlow() else nil
    };
end)((l_RoactServices_0.connect({
    analytics = v15
})((v4.connect(function(v130, v131)
    local l_itemId_6 = v131.itemId;
    local l_itemType_6 = v131.itemType;
    local v134 = nil;
    local v135 = nil;
    if not v30 then
        v134 = v27(v130.AvatarExperience.Common, l_itemId_6, l_itemType_6);
    else
        v135 = v28(v130.AvatarExperience, l_itemId_6, l_itemType_6);
    end;
    local v136 = v130.Users[v130.LocalUserId];
    local v137 = v136 and v136.membership;
    local v138 = nil;
    v138 = if not v30 then if v134 then v134.collectibleItemId else nil else if v135 then v135.collectibleItemId else nil;
    local v139 = if not v138 then nil else v130.AvatarExperience.Common.Collectibles.CollectiblesItemInfo[v138];
    local v140 = if not v139 then v20.ResaleRestriction.None else v139.resaleRestriction;
    local v141 = {};
    local v142 = nil;
    local l_itemId_7 = v131.itemId;
    local l_itemType_7 = v131.itemType;
    if l_itemType_7 == v18.ItemType.Asset then
        v142 = v20.SetFavoriteAssetKey;
    elseif l_itemType_7 == v18.ItemType.Bundle then
        v142 = v20.SetFavoriteBundleKey;
    end;
    v141.favoritesFetchingState = l_PerformFetch_0.GetStatus(v130, v142 .. tostring(l_itemId_7));
    v141.localUserId = v130.LocalUserId;
    v142 = nil;
    l_itemId_7 = v131.itemId;
    l_itemType_7 = v131.itemType;
    if l_itemType_7 == v18.ItemType.Asset then
        v142 = v130.AvatarExperience.Catalog.AssetFavorites[l_itemId_7];
    elseif l_itemType_7 == v18.ItemType.Bundle then
        v142 = v130.AvatarExperience.Catalog.BundleFavorites[l_itemId_7];
    end;
    v141.isFavorited = v142;
    v141.DEPRECATED_itemData = v134;
    v141.itemInfo = v135;
    v141.screenSize = v130.ScreenSize;
    v141.userHasMembership = v137 ~= Enum.MembershipType.None;
    v141.boundInputs = v130.GamepadBottomBar.boundInputs;
    v141.isCollectiblesEnabled = if not v43() then nil else v130.AvatarExperience.Catalog.Metadata.isCollectiblesEnabled;
    v141.isPortrait = v47(v130);
    v141.collectiblesResaleRestriction = v140;
    return v141;
end, function(v145)
    return {
        navigateDown = function(v146)
            v145(v8(v146));
        end, 
        getBundleFavorite = function(v147)
            v145(v25(v147));
        end, 
        getAssetFavorite = function(v148)
            v145(v23(v148));
        end, 
        setAssetFavorite = function(v149, v150)
            v145(v24(v149, v150));
        end, 
        setBundleFavorite = function(v151, v152)
            v145(v26(v151, v152));
        end
    };
end)(v54))))))))))));
