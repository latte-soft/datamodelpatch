local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(l_CorePackages_0.Packages.React);
local v5 = require(l_CorePackages_0.Roact);
local v6 = require(l_CorePackages_0.RoactNavigation);
local v7 = require(l_CorePackages_0.RoactRodux);
local v8 = require(l_CorePackages_0.Packages.RoactGamepad);
local v9 = require(l_CorePackages_0.Cryo);
local v10 = require(l_CorePackages_0.Packages.t);
local v11 = require(l_CorePackages_0.UIBlox);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local l_withNavigation_0 = v6.withNavigation;
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v15 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local l_PeekViewState_0 = require(l_CorePackages_0.Workspace.Packages.PeekView).PeekViewState;
local l_wasLastInputGamepad_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).wasLastInputGamepad;
local v18 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v19 = require(l_Modules_0.AvatarExperience.Catalog.Components.ItemsList.AnimationTabs);
local v20 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v21 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local v22 = require(l_Modules_0.AvatarExperience.Common.WidgetConstants);
local v23 = require(l_Modules_0.AvatarExperience.Catalog.Http.WebApi);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local v25 = require(l_Modules_0.AvatarExperience.Common.Components.Impressions.ImpressionsUtil);
local v26 = require(l_Modules_0.AvatarExperience.Common.Components.Impressions.ImpressionsSchema);
local v27 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withAvatarRoute);
local v28 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local v29 = require(l_Modules_0.LuaApp.Enum.ToastType);
local v30 = require(l_Modules_0.AvatarExperience.Common.Enum.FullView);
local _ = require(l_Modules_0.AvatarExperience.Common.Models.CollectibleInfo);
local v32 = require(l_Modules_0.AvatarExperience.Common.Selectors.DEPRECATED_ItemData);
local v33 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectItemInfo);
local v34 = require(l_Modules_0.AvatarExperience.Catalog.Services.Analytics);
local v35 = require(l_Modules_0.AvatarExperience.Common.Services.Analytics);
local v36 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v38 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.SendDetailedCatalogAnalytics);
local v39 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.MaybePromptForR15Upgrade);
local v40 = require(l_Modules_0.AvatarExperience.Common.Models.ItemInfo);
local l_ItemTile_0 = v11.Tile.ItemTile;
local l_ItemTileEnums_0 = v11.Tile.ItemTileEnums;
local v43 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetTryOnManagerPeekViewState);
local v44 = require(l_Modules_0.AvatarExperience.Catalog.Components.ItemsList.ItemCardFooter);
local v45 = require(l_Modules_0.AvatarExperience.Common.Components.ItemTileDetailButton);
local v46 = require(l_Modules_0.AvatarExperience.Common.Thunks.NavigateWithLock);
local v47 = require(l_Modules_0.AvatarExperience.Common.Thunks.OpenItemDetails);
local v48 = require(l_Modules_0.AvatarExperience.Common.Thunks.ToggleTryOnThunk);
local v49 = require(l_Modules_0.AvatarExperience.Common.Actions.SetAnimationPreview);
local v50 = require(l_Modules_0.AvatarExperience.Common.Thunks.SetFullView);
local v51 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.Debug.logOnOverlayClosed);
local v52 = require(l_Modules_0.AvatarExperience.Common.Context.withWidgetInfo);
local l_getRbxthumbWithTypeSizeAndOptions_0 = require(l_CorePackages_0.Workspace.Packages.UserLib).Utils.getRbxthumbWithTypeSizeAndOptions;
local v54 = require(l_Modules_0.AvatarExperience.Common.Context.withAdaptiveScrolling);
local v55 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectIsFullViewTable);
local v56 = require(l_Modules_0.AvatarExperience.Flags.FFlagTempHackFixItemThumbnailsNotVisible);
local v57 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagCollectiblesCatalogFollowUpForSaleLocation);
local v58 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagDisableBundleItemCardIcon);
local v59 = require(l_Modules_0.AvatarExperience.Flags.GetAXInExperienceItemLinking);
local v60 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXFixItemTypeHandling);
local v61 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXLimitedBundlesHandleNewData);
local v62 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXAdaptiveScrollingItemResetFix);
local v63 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXItemCardRedesignIXPEnabled);
local v64 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXItemCardTallEnabled);
local v65 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXFixItemDetailsPeekViewDraggerConsole);
local v66 = l_GuiService_0:IsTenFootInterface();
local l_AssetTypeIdStrings_0 = v20.AssetTypeIdStrings;
local v68 = {
    toastMessage = "Feature.Avatar.Label.LayeredClothingR15Warning", 
    isLocalized = false, 
    toastType = v29.InformationMessage
};
local v69 = v5.PureComponent:extend("CatalogItemCard");
v69.validateProps = v10.strictInterface({
    analyticsContext = v10.string, 
    analyticsItemCountPerPage = v10.number, 
    index = v10.number, 
    itemType = v10.optional(v10.string), 
    itemId = v10.optional(v10.string), 
    adTrackingData = v10.optional(v10.string), 
    isSponsoredItem = v10.optional(v10.boolean), 
    itemDetailsPeekViewRefs = v10.table, 
    resultsListRef = v10.table, 
    impressionsTag = v10.optional(v10.string), 
    impressionsSchema = v10.optional(v10.string), 
    impressionsGroup = v10.optional(v10.string), 
    impressionsSearch = v10.optional(v10.string), 
    impressionsId = v10.optional(v10.string), 
    widgetAnalyticsInfo = v10.optional(v10.table), 
    hideItemName = if not v63() then nil else v10.optional(v10.boolean), 
    thumbailAspectRatio = if not v64() then nil else v10.optional(v10.number), 
    thumbnailScaleType = if not v64() then nil else v10.optional(v10.enum(Enum.ScaleType)), 
    thumbnailSize = if not v64() then nil else v10.optional(v10.string), 
    DEPRECATED_itemData = if not v60 then v10.optional(v10.table) else nil, 
    itemInfo = if not v60 then nil else v10.optional(v40.Validator), 
    collectibleItemInfo = if not v59() then nil else v10.optional(v10.table), 
    isSelected = v10.boolean, 
    tileRestrictionsMap = v10.optional(v10.table), 
    statusStyle = v10.optional(v10.userdata), 
    statusText = v10.optional(v10.string), 
    playerMembership = v10.optional(v10.enum(Enum.MembershipType)), 
    avatarType = v10.string, 
    fullView = v10.optional(v10.table), 
    tryOnItems = v10.optional(v10.table), 
    lastToggledItem = v10.table, 
    categoryInfo = v10.table, 
    widgetRequestId = v10.optional(v10.string), 
    sendDetailedCatalogAnalytics = v10.callback, 
    maybePromptForR15Upgrade = v10.callback, 
    r6IncompatibleToast = v10.callback, 
    navigateWithLock = v10.callback, 
    openItemDetails = v10.callback, 
    toggleTryOn = v10.callback, 
    setAnimationPreview = v10.callback, 
    setFullView = v10.callback, 
    setTryOnManagerPeekViewState = v10.callback, 
    catalogAnalytics = v10.table, 
    appAnalytics = v10.table, 
    avatarExperienceAnalytics = v10.table, 
    networking = v10.callback, 
    navigation = v10.table, 
    avatarRoute = v10.table, 
    focusController = v10.optional(v10.table), 
    widgetInfo = v10.optional(v10.table), 
    adaptiveScrolling = v10.optional(v10.table)
});
v69.defaultProps = {
    lastToggledItem = {}, 
    thumbnailSize = if not v64() then nil else v20.CatalogThumbnailTypeToSize.Asset._150x150
};
v69.init = function(v70)
    v70.textButtonRef = v5.createRef();
    v70.thumbnailRef = v5.createRef();
    v70.maybePromptForR15Upgrade = function()
        return v70.props.maybePromptForR15Upgrade(v70.props.navigation, v70.props.itemId, v70.props.itemType, function()
            local v71 = l_wasLastInputGamepad_0();
            v51("CatalogItemCard", v71);
            if v71 then
                v70.props.focusController.captureFocus();
            end;
            if v70.props.itemId then
                v70:openItemDetails();
            end;
        end);
    end;
    v70.sendWidgetAnalytics = function()
        v70.props.catalogAnalytics.widgetInteractionV2(v70.props.widgetAnalyticsInfo, v22.ActionType.ITEM_CLICK);
    end;
    v70.tryOnForOutfit = function()
        local l_itemId_0 = v70.props.itemId;
        local l_itemType_0 = v70.props.itemType;
        local l_DEPRECATED_itemData_0 = v70.props.DEPRECATED_itemData;
        if l_itemId_0 then
            if not v70.maybePromptForR15Upgrade() then
                local v75 = v70:getItemSubType();
                local l_isSelected_0 = v70.props.isSelected;
                v70.props.toggleTryOn(v70.props.networking, v70.props.catalogAnalytics, l_itemType_0, v75, l_itemId_0, true, v70.props.avatarRoute, v70.props.navigation, v70.props.widgetAnalyticsInfo);
                if v70.props.adaptiveScrolling then
                    v70.props.setTryOnManagerPeekViewState(l_PeekViewState_0.Closed);
                end;
                if not ((not v62() or not v70.props.adaptiveScrolling) or not l_isSelected_0) then
                    v70.props.adaptiveScrolling.setSelectedItemInstance();
                end;
                if not l_isSelected_0 then
                    local l_adaptiveScrolling_0 = v70.props.adaptiveScrolling;
                    if l_adaptiveScrolling_0 then
                        l_adaptiveScrolling_0.setSelectedItemInstance(if not v70.textButtonRef then nil else v70.textButtonRef:getValue());
                    end;
                    if not v70.props.isSelected then
                        if v70.props.fullView[v70.props.avatarRoute.opaque.name] == v30.UIFullView then
                            v70.props.setFullView(v70.props.avatarExperienceAnalytics, v70.props.avatarRoute.opaque.name, v30.None);
                        end;
                    else
                        return ;
                    end;
                end;
                if not v70.props.isSelected then
                    if not v60 then
                        local l_assetType_0 = l_DEPRECATED_itemData_0.assetType;
                        if (v70.props.avatarType == v20.AvatarType.R6 and l_assetType_0 ~= l_AssetTypeIdStrings_0.HairAccessory) and v20.LayeredAssetTypes[l_assetType_0] ~= nil then
                            v70.props.r6IncompatibleToast();
                        end;
                        if l_itemType_0 == v20.ItemType.Asset and v20.AssetTypeIdToCategory[v75] == v20.AssetCategories.Animation then
                            v70.props.setAnimationPreview(l_itemId_0, l_assetType_0);
                        end;
                    else
                        if (v70.props.avatarType == v20.AvatarType.R6 and v75 ~= l_AssetTypeIdStrings_0.HairAccessory) and v20.LayeredAssetTypes[v75] ~= nil then
                            v70.props.r6IncompatibleToast();
                        end;
                        if l_itemType_0 == v20.ItemType.Asset and v20.AssetTypeIdToCategory[v75] == v20.AssetCategories.Animation then
                            v70.props.setAnimationPreview(l_itemId_0, v75);
                        end;
                    end;
                    local l_catalogAnalytics_0 = v70.props.catalogAnalytics;
                    local l_analyticsContext_0 = v70.props.analyticsContext;
                    local l_analyticsItemCountPerPage_0 = v70.props.analyticsItemCountPerPage;
                    local l_index_0 = v70.props.index;
                    local l_networking_0 = v70.props.networking;
                    local l_adTrackingData_0 = v70.props.adTrackingData;
                    v70.props.sendDetailedCatalogAnalytics(l_analyticsContext_0, l_catalogAnalytics_0.clickCatalogItem, l_itemId_0, l_itemType_0, l_index_0, l_analyticsItemCountPerPage_0);
                    if v70.props.widgetAnalyticsInfo then
                        v70.sendWidgetAnalytics();
                    end;
                    if l_adTrackingData_0 then
                        v23.TrackSponsoredItemClick(l_networking_0, l_adTrackingData_0);
                    end;
                    if not (not v65() or not v66) then
                        v70:openItemDetails();
                    end;
                    return ;
                else
                    return ;
                end;
            else
                return ;
            end;
        else
            return ;
        end;
    end;
    v70.itemDetailsClosed = if not v65() then nil else function()
        if not (not v66 or not v70.props.isSelected) then
            v70.tryOnForOutfit();
        end;
    end;
    if v56 then
        v70.onWillFocus = function()
            v18.hackGetAbsoluteSzieOfDescendants(v70.thumbnailRef);
        end;
    end;
end;
v69.getItemSubType = function(v85)
    if not v60 then
        return v21.DEPRECATED_GetItemSubType(v85.props.itemType, v85.props.DEPRECATED_itemData);
    else
        local l_itemInfo_0 = v85.props.itemInfo;
        if not l_itemInfo_0 then
            return nil;
        else
            return l_itemInfo_0.itemSubType;
        end;
    end;
end;
v69.getPriceInRobux = function(v87)
    if not v60 then
        if not v87.props.DEPRECATED_itemData then
            return nil;
        else
            return v87.props.DEPRECATED_itemData.priceInRobux;
        end;
    elseif not v87.props.itemInfo then
        return nil;
    else
        return v87.props.itemInfo.priceInRobux;
    end;
end;
v69.openItemDetailsFullNoPeek = function(v88)
    v88.props.openItemDetails({
        itemId = v88.props.itemId, 
        itemType = v88.props.itemType, 
        itemSubType = v88:getItemSubType(), 
        priceInRobux = v88:getPriceInRobux(), 
        catalogAnalytics = v88.props.catalogAnalytics, 
        avatarRoute = v88.props.avatarRoute, 
        navigation = v88.props.navigation, 
        itemDetailsPeekViewRefs = v88.props.itemDetailsPeekViewRefs, 
        resultsListRef = v88.props.resultsListRef, 
        widgetInfo = v88.props.widgetAnalyticsInfo, 
        showFullWithNoPeekView = true, 
        onItemDetailsClosed = if not v65() then nil else v88.itemDetailsClosed
    });
end;
v69.openItemDetails = function(v89)
    v89.props.openItemDetails({
        itemId = v89.props.itemId, 
        itemType = v89.props.itemType, 
        itemSubType = v89:getItemSubType(), 
        priceInRobux = v89:getPriceInRobux(), 
        catalogAnalytics = v89.props.catalogAnalytics, 
        avatarRoute = v89.props.avatarRoute, 
        navigation = v89.props.navigation, 
        itemDetailsPeekViewRefs = v89.props.itemDetailsPeekViewRefs, 
        resultsListRef = v89.props.resultsListRef, 
        widgetInfo = v89.props.widgetAnalyticsInfo, 
        onItemDetailsClosed = if not v65() then nil else v89.itemDetailsClosed
    });
end;
v69._setImpressionAttributes = function(v90)
    local v91 = v90.thumbnailRef and v90.thumbnailRef:getValue();
    if not (not v91 or not v90.props.impressionsId) then
        v91:SetAttribute(v90.props.impressionsTag, v90.props.impressionsId);
        v25.writeItemAttributes(v26[v90.props.impressionsSchema], v91, v90.props);
    end;
end;
v69.didMount = function(v92)
    v92:_setImpressionAttributes();
end;
v69.didUpdate = function(v93)
    v93:_setImpressionAttributes();
end;
v69.getItemIconType = function(v94)
    local l_itemType_1 = v94.props.itemType;
    if not (l_itemType_1 == v20.ItemType.Bundle) then
        return l_itemType_1 == v20.ItemType.Bundle and l_ItemTileEnums_0.ItemIconType.Bundle or nil;
    else
        local v96 = nil;
        if not v60 then
            local l_DEPRECATED_itemData_1 = v94.props.DEPRECATED_itemData;
            v96 = l_DEPRECATED_itemData_1 and l_DEPRECATED_itemData_1.bundleType == v20.BundleTypeIdStrings.DynamicHead;
        else
            local l_itemInfo_1 = v94.props.itemInfo;
            v96 = l_itemInfo_1 and l_itemInfo_1.itemSubType == v20.BundleTypeIdStrings.DynamicHead;
        end;
        if not v96 then
            if v58() then
                return nil;
            else
                return l_ItemTileEnums_0.ItemIconType.Bundle;
            end;
        else
            return l_ItemTileEnums_0.ItemIconType.DynamicHead;
        end;
    end;
end;
v69.renderMoreButton = function(v99)
    return v5.createElement(v45, {
        activateButton = function()
            v99:openItemDetailsFullNoPeek();
        end
    });
end;
local function _(v100)
    return v100 and v100 ~= "0";
end;
local _ = function(v102, v103)
    if v103 ~= nil then
        for _, v105 in v20.CatalogThumbnailTypeToSize[v103], nil, nil do
            if v105 == v102 then
                return true;
            end;
        end;
    end;
    return false;
end;
v69.shouldShowAnimationTabs = function(v107)
    local l_isSelected_1 = v107.props.isSelected;
    local v109 = nil;
    if not v60 then
        local l_DEPRECATED_itemData_2 = v107.props.DEPRECATED_itemData;
        v109 = l_DEPRECATED_itemData_2 and l_DEPRECATED_itemData_2.bundleType == v20.BundleTypeIdStrings.Animations;
    else
        local l_itemInfo_2 = v107.props.itemInfo;
        if l_itemInfo_2 then
            v109 = l_itemInfo_2.itemSubType == v20.BundleTypeIdStrings.Animations;
        end;
    end;
    if l_isSelected_1 and v109 then
        if v107.props.lastToggledItem.itemId == v107.props.itemId then
            return true;
        elseif v107.props.categoryInfo.PageType == v20.PageType.Animation then
            return true;
        elseif v107.props.categoryInfo.PageType == v20.PageType.AllAnimation then
            return true;
        else
            return false;
        end;
    else
        return false;
    end;
end;
v69.render = function(v112)
    local l_isSelected_2 = v112.props.isSelected;
    local l_DEPRECATED_itemData_3 = v112.props.DEPRECATED_itemData;
    local l_itemInfo_3 = v112.props.itemInfo;
    local l_itemId_1 = v112.props.itemId;
    local l_itemType_2 = v112.props.itemType;
    local l_tileRestrictionsMap_0 = v112.props.tileRestrictionsMap;
    local l_statusStyle_0 = v112.props.statusStyle;
    local l_statusText_0 = v112.props.statusText;
    local v121 = v112.props.playerMembership == Enum.MembershipType.Premium;
    local v122 = v112:getItemIconType();
    local v123 = not not l_itemType_2 and v21.GetRbxThumbType(l_itemType_2) or nil;
    local v124 = nil;
    if v64() then
        local l_thumbnailSize_0 = v112.props.thumbnailSize;
        local v126;
        if v123 ~= nil then
            for _, v128 in v20.CatalogThumbnailTypeToSize[v123], nil, nil do
                if v128 == l_thumbnailSize_0 then
                    v126 = true;
                    goto label0 --[[  true, false  ]];
                end;
            end;
        end;
        v126 = false;
        ::label0::;
        v124 = if not v126 then v20.CatalogThumbnailTypeToSize.Asset._150x150 else v112.props.thumbnailSize;
    end;
    local v129 = nil;
    if l_itemId_1 and l_itemId_1 ~= "0" then
        v129 = if not v64() then l_getRbxthumbWithTypeSizeAndOptions_0(l_itemId_1, v123, 150) else ("rbxthumb://type=%*&id=%*&%*"):format(v123, l_itemId_1, v124);
    end;
    local v130 = nil;
    local v131 = nil;
    local v132 = nil;
    local v133 = false;
    local v134 = false;
    local _ = nil;
    local v136 = false;
    if not v60 then
        v130 = l_DEPRECATED_itemData_3 and l_DEPRECATED_itemData_3.name;
        v131 = not not l_DEPRECATED_itemData_3 and (l_DEPRECATED_itemData_3.lowestPrice or l_DEPRECATED_itemData_3.priceInRobux) or nil;
        v132 = l_DEPRECATED_itemData_3 ~= nil;
        if v21.DEPRECATED_HasPremiumBenefits(l_DEPRECATED_itemData_3) then
            v133 = true;
            if not v121 then
                v134 = v21.DEPRECATED_IsPremiumExclusive(l_DEPRECATED_itemData_3);
            else
                v131 = l_DEPRECATED_itemData_3.premiumPricing.premiumPriceInRobux;
            end;
        end;
        v136 = if not v61() then l_DEPRECATED_itemData_3 and l_DEPRECATED_itemData_3.collectibleItemId else v21.DEPRECATED_isLimitedCollectible(l_DEPRECATED_itemData_3);
    elseif l_itemInfo_3 then
        v130 = l_itemInfo_3.name;
        v131 = (l_itemInfo_3.lowestPrice or l_itemInfo_3.priceInRobux) or nil;
        v132 = true;
        if l_itemInfo_3.hasPremiumBenefits then
            v133 = true;
            if not v121 or not l_itemInfo_3.premiumPricing then
                v134 = l_itemInfo_3.isPremiumExclusive;
            else
                v131 = l_itemInfo_3.premiumPricing.premiumPriceInRobux;
            end;
        end;
        v136 = if not v61() then l_itemInfo_3.collectibleItemId else l_itemInfo_3.isLimitedCollectible;
    end;
    local v137 = true;
    if not (not v57() or not v136) then
        v137 = if v59() or v60 then v21.isCollectibleSellableInShop(v112.props.collectibleItemInfo) else v21.isCollectibleSellableInShop(l_DEPRECATED_itemData_3);
    end;
    local v138 = v112:shouldShowAnimationTabs();
    local v139 = {
        OpenDetails = v8.Input.onBegin(Enum.KeyCode.ButtonL3, function()
            v112:openItemDetailsFullNoPeek();
        end, {
            key = "Feature.Catalog.Action.OpenDetails"
        }) or nil, 
        Select = v8.Input.onBegin(Enum.KeyCode.ButtonA, function()
            v112.tryOnForOutfit();
        end, {
            key = "Feature.Avatar.Action.Select"
        }) or nil
    };
    local v140 = l_isSelected_2 and not v66;
    return l_withLocalization_0({
        statusText = l_statusText_0
    })(function(v141)
        return v5.createFragment({
            AnimationTabs = v138 and v5.createElement(v19, {
                DEPRECATED_itemData = if not v60 then l_DEPRECATED_itemData_3 else nil, 
                itemInfo = if not v60 then nil else l_itemInfo_3
            }), 
            Tile = v5.createElement(l_ItemTile_0, {
                itemIconType = v122, 
                isSelected = l_isSelected_2, 
                isPremium = v133, 
                name = v130, 
                useMaxTitleHeight = (not not v63() and v112.props.hideItemName) and true or nil, 
                titleTextLineCount = (not not v63() and v112.props.hideItemName) and 0 or nil, 
                addSubtitleSpace = (not v63() or not v112.props.hideItemName) and nil, 
                innerPadding = if not not v63() and v112.props.hideItemName then v20.ItemTileInnerPadding else nil, 
                restrictionTypes = l_tileRestrictionsMap_0, 
                statusStyle = l_statusStyle_0, 
                statusText = v141.statusText, 
                onActivated = v112.tryOnForOutfit, 
                thumbnail = v129, 
                aspectRatio = if not v64() then nil else v112.props.thumbailAspectRatio, 
                scaleType = if not v64() then nil else v112.props.thumbnailScaleType, 
                footer = not v134 and v5.createElement(v44, {
                    price = v131, 
                    isPriceLoaded = v132, 
                    isSellableInShop = v137
                }) or nil, 
                inputBindings = v139, 
                renderTileInset = if not v140 then nil else function()
                    return v112:renderMoreButton();
                end, 
                textButtonRef = v112.textButtonRef, 
                ref = v112.thumbnailRef, 
                [v4.Tag] = v112.props.impressionsTag
            }), 
            NavigationEvents = if not v56 then nil else v5.createElement(v6.NavigationEvents, {
                onWillFocus = v112.onWillFocus
            })
        });
    end);
end;
local function _(v142, v143)
    local l_TryOnItems_0 = v142.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems;
    local v145 = v142.AvatarExperience.AvatarScene.OutfitTryOn.LookId == nil;
    if not (v143.itemId and l_TryOnItems_0[v143.itemId] ~= nil) or not v145 then
        return false;
    else
        return true;
    end;
end;
v69 = v54((v52((l_RoactServices_0.connect({
    catalogAnalytics = v34, 
    appAnalytics = v36, 
    avatarExperienceAnalytics = v35, 
    networking = v15
})((v27((l_withNavigation_0(v7.connect(function(v147, v148)
    local l_LocalUserId_0 = v147.LocalUserId;
    local v150 = (not not v148.itemId and v147.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems[v148.itemId] ~= nil) and (v147.AvatarExperience.AvatarScene.OutfitTryOn.LookId == nil and true or false);
    local l_LastToggledItem_0 = v147.AvatarExperience.AvatarScene.OutfitTryOn.LastToggledItem;
    local v152 = nil;
    local v153 = nil;
    local v154 = nil;
    local v155 = nil;
    local v156 = nil;
    local v157 = nil;
    if not v60 then
        v156 = v32(v147.AvatarExperience.Common, v148.itemId, v148.itemType);
        if v156 then
            local v158, v159 = v21.DEPRECATED_GetStatus(v156);
            v152 = v158;
            v153 = v159;
            v154 = v156.tileRestrictionsMap;
            if not (not v59() or not v156.collectibleItemId) then
                v155 = v147.AvatarExperience.Common.Collectibles.CollectiblesItemInfo[v156.collectibleItemId];
            end;
        end;
    else
        v157 = v33(v147.AvatarExperience, v148.itemId, v148.itemType);
        if v157 then
            v152 = v157.statusStyle;
            v153 = v157.statusText;
            v154 = v157.tileRestrictionsMap;
            if v157.collectibleItemId then
                v155 = v147.AvatarExperience.Common.Collectibles.CollectiblesItemInfo[v157.collectibleItemId];
            end;
        end;
    end;
    return {
        DEPRECATED_itemData = v156, 
        itemInfo = v157, 
        collectibleItemInfo = v155, 
        isSelected = v150, 
        tileRestrictionsMap = v154, 
        statusStyle = v152, 
        statusText = v153, 
        playerMembership = not not v147.Users[l_LocalUserId_0] and v147.Users[l_LocalUserId_0].membership or Enum.MembershipType.None, 
        avatarType = v147.AvatarExperience.AvatarEditor.Character.AvatarType, 
        fullView = v55(v147), 
        tryOnItems = v147.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems, 
        lastToggledItem = l_LastToggledItem_0, 
        categoryInfo = v18.getCatalogCategoryInfoFromState(v147), 
        widgetRequestId = v147.AvatarExperience.Common.Widgets.WidgetInfo.RequestId
    };
end, function(v160)
    return {
        sendDetailedCatalogAnalytics = function(v161, v162, v163, v164, v165, v166)
            v160(v38(v161, v162, v163, v164, v165, v166, false));
        end, 
        maybePromptForR15Upgrade = function(v167, v168, v169, v170)
            return v160(v39(v167, v168, v169, v170, nil, true));
        end, 
        r6IncompatibleToast = function()
            return v160(v28(v68));
        end, 
        navigateWithLock = function(v171)
            v160(v46(v171));
        end, 
        openItemDetails = function(v172)
            v160(v47(v172));
        end, 
        toggleTryOn = function(v173, v174, v175, v176, v177, v178, v179, v180, v181)
            v160(v48(v173, v174, v175, v176, v177, v178, v179, v180, v181));
        end, 
        setAnimationPreview = function(v182, v183)
            return v160(v49(v182, v183));
        end, 
        setFullView = function(v184, v185, v186)
            v160(v50(v184, v185, v186));
        end, 
        setTryOnManagerPeekViewState = function(v187)
            v160(v43(v187));
        end
    };
end)(v69), nil)))))))));
return function(v188)
    return v8.withFocusController(function(v189)
        return v5.createElement(v69, v9.Dictionary.join(v188, {
            focusController = v189
        }));
    end);
end;
