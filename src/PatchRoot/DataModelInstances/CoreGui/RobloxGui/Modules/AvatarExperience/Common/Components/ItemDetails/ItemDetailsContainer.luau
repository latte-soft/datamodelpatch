local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_TextService_0 = game:GetService("TextService");
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.Cryo);
local v5 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local v6 = require(l_CorePackages_0.RoactRodux);
local v7 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_Focusable_0 = v7.Focusable;
local v9 = require(l_CorePackages_0.AvatarExperienceDeps);
local v10 = require(l_CorePackages_0.Packages.t);
local v11 = require(l_CorePackages_0.RoactNavigation);
local l_RoactFitComponents_0 = v9.RoactFitComponents;
local l_FitFrameVertical_0 = l_RoactFitComponents_0.FitFrameVertical;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v15 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v16 = require(l_Modules_0.LuaApp.Enum.RetrievalStatus);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local v19 = require(l_Modules_0.AvatarExperience.Catalog.Services.Analytics);
local v20 = require(l_CorePackages_0.UIBlox);
local l_withStyle_0 = v20.Style.withStyle;
local l_LoadableImage_0 = v20.App.Loading.LoadableImage;
local l_ShimmerPanel_0 = v20.App.Loading.ShimmerPanel;
local l_Images_0 = v20.App.ImageSet.Images;
local l_IconSize_0 = v20.App.Constant.IconSize;
local l_ImageSetLabel_0 = v20.Core.ImageSet.ImageSetLabel;
local l_GetCanExpand_0 = v20.Core.Text.ExpandableText.GetCanExpand;
local l_GetWrappedTextWithIcon_0 = v20.Core.Text.GetWrappedTextWithIcon;
local l_LoadingStateContainer_0 = v20.App.Container.LoadingStateContainer;
local l_RetrievalStatus_0 = v20.App.Loading.Enum.RetrievalStatus;
local l_EmptyState_0 = v20.App.Indicator.EmptyState;
local l_Button_0 = v20.App.Button.Button;
local l_ButtonType_0 = v20.App.Button.Enum.ButtonType;
local l_LinkButton_0 = v20.App.Button.LinkButton;
local l_MenuDirection_0 = v20.App.Menu.MenuDirection;
local l_StyledTextLabel_0 = v20.App.Text.StyledTextLabel;
local l_FitTextLabel_0 = l_RoactFitComponents_0.FitTextLabel;
local l_getSafeAreaSize_0 = require(l_CorePackages_0.Workspace.Packages.InputUi).getSafeAreaSize;
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local v40 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AppRouterWrapper.NavigateDownToAvatarScreen);
local v41 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local v42 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local v43 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v44 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v45 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.ItemDescription);
local v46 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.ItemStatistics);
local v47 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.ItemOwnershipButton);
local v48 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.ItemInfo.ItemInfoList);
local v49 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.RecommendedItemsGrid);
local v50 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.BundleItemsGrid);
local l_PeekViewState_0 = require(l_CorePackages_0.Workspace.Packages.PeekView).PeekViewState;
local v52 = require(l_Modules_0.AvatarExperience.Common.Thunks.ToggleTryOnThunk);
local v53 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.AssetOrBundleDetailsInnards);
local v54 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.FetchAssetOrBundleInfo);
local v55 = require(l_Modules_0.AvatarExperience.Common.Selectors.DEPRECATED_ItemData);
local v56 = require(l_Modules_0.AvatarExperience.Common.Validators.DEPRECATED_ItemDataValidator);
local v57 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectItemInfo);
local v58 = require(l_Modules_0.AvatarExperience.Common.Models.ItemInfo);
local v59 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXFixItemTypeHandling);
local v60 = require(l_Modules_0.AvatarExperience.Flags.FFlagAEShowPremiumPolicy);
local v61 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagRestrictLimited2ToSoothsayers);
local l_IsVRAppBuild_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).IsVRAppBuild;
local v63 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagL2ControllerSupport);
local l_getRbxthumbWithTypeSizeAndOptions_0 = require(l_CorePackages_0.Workspace.Packages.UserLib).Utils.getRbxthumbWithTypeSizeAndOptions;
local v65 = require(l_Modules_0.AvatarExperience.Flags.FFlagEnableAttributionItemRow);
local v66 = require(l_Modules_0.AvatarExperience.Flags.GetAXInExperienceItemLinking);
local v67 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXItemDetailsContainer);
local v68 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXFixItemDetailsExperienceLinkText);
local v69 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXLimitedBundlesHandleNewData);
local v70 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXExperienceItemDeepLinkCrashFix);
local v71 = l_Images_0["icons/status/premium_small"];
local v72 = v3.PureComponent:extend("ItemDetailsContainer");
v72.validateProps = v10.strictInterface({
    actionBarHeaderRef = v10.table, 
    clipDetails = v10.optional(v10.boolean), 
    listPadding = v10.optional(v10.numberPositive), 
    itemId = v10.string, 
    itemType = v10.string, 
    onItemInvalid = v10.optional(v10.callback), 
    showFullWithNoPeekView = v10.optional(v10.boolean), 
    bottomDockedContainerHeight = v10.optional(v10.number), 
    resultsListRef = v10.optional(v10.table), 
    itemDetailsPeekViewRefs = v10.optional(v10.table), 
    peekViewFocusController = v10.table, 
    NextSelectionDown = v10.optional(v10.table), 
    NextSelectionUp = v10.optional(v10.table), 
    NextSelectionLeft = v10.optional(v10.table), 
    NextSelectionRight = v10.optional(v10.table), 
    forwardRef = v10.optional(v10.table), 
    DEPRECATED_itemSubType = if not v67() then v10.optional(v10.string) else nil, 
    DEPRECATED_assetType = if not v67() then v10.optional(v10.string) else nil, 
    globalGuiInset = v10.strictInterface({
        left = v10.integer, 
        top = v10.integer, 
        right = v10.integer, 
        bottom = v10.integer
    }), 
    screenSize = v10.Vector2, 
    fetchingState = v10.string, 
    itemInfo = if not v59 then nil else v10.optional(v58.Validator), 
    DEPRECATED_itemData = if not v59 then v10.optional(v56) else nil, 
    DEPRECATED_peekViewState = if not v67() then v10.optional(v10.valueOf(l_PeekViewState_0)) else nil, 
    DEPRECATED_experiences = if not v67() then if v66() then v10.optional(v10.table) else nil else nil, 
    DEPRECATED_collectibleData = if not v67() then if v66() then v10.optional(v10.table) else nil else nil, 
    DEPRECATED_isCollectiblesEnabled = if not v61() then nil else v10.optional(v10.boolean), 
    isLimitedCollectible = if not v69() then nil else v10.optional(v10.boolean), 
    fetchAssetOrBundleInfo = v10.callback, 
    navigateDownToAvatarScreen = v10.callback, 
    toggleTryOn = v10.optional(v10.callback), 
    navigation = v10.table, 
    networking = v10.callback, 
    appAnalytics = v10.table, 
    catalogAnalytics = v10.table, 
    showPremiumContent = v10.optional(v10.boolean)
});
v72.defaultProps = {
    clipDetails = false, 
    listPadding = 24
};
v72.init = function(v73)
    if not v67() then
        v73.expandableTextRef = v3.createRef();
        v73.ownershipButtonRef = if not v63() then nil else v3.createRef();
        v73.resellerRef = v3.createRef();
        v73.attributionRef = if not v65 then nil else v3.createRef();
        v73.recommendedItemsGridRef = v3.createRef();
    end;
    v73.state = {
        width = 0
    };
    v73.fetchAssetOrBundleInfo = function()
        return v73.props.fetchAssetOrBundleInfo(v73.props.networking, v73.props.appAnalytics, tostring(v73.props.itemId), v73.props.itemType);
    end;
    if not v67() then
        local v74, v75 = v3.createBinding(false);
        v73.itemHeaderVisibleBinding = v74;
        v73.updateItemHeaderVisibleBinding = v75;
        v73.onTryOnActivated = function()
            local v76 = {
                itemId = v73.props.itemId, 
                itemType = v73.props.itemType, 
                mountAsFullView = false, 
                mountAnimation = false, 
                itemDetailsPeekViewRefs = v73.props.itemDetailsPeekViewRefs, 
                resultsListRef = v73.props.resultsListRef
            };
            local v77 = v76.itemType .. v76.itemId;
            v73.props.toggleTryOn(v73.props.networking, v73.props.catalogAnalytics, v73.props.itemType, v73.props.DEPRECATED_itemSubType, v73.props.itemId, true, nil, nil);
            v73.props.navigateDownToAvatarScreen(v41.TryOnItem, v77, v76);
            v73.props.catalogAnalytics.profileTryOnAvatarItem(v43.AnalyticsContext.ProfileItemDetails, v73.props.itemId, v73.props.itemType, v73.props.DEPRECATED_itemSubType);
        end;
        v73.onItemOwnershipButtonActivated = function()
            local v78 = nil;
            if not v59 then
                v78 = v73.props.DEPRECATED_itemData.collectibleItemId;
            elseif v73.props.itemInfo then
                v78 = v73.props.itemInfo.collectibleItemId;
            end;
            v73.props.navigation.navigate(v41.ItemOwnershipPage, {
                itemId = v73.props.itemId, 
                collectibleItemId = v78, 
                itemType = v73.props.itemType
            });
        end;
        v73.onItemHeaderMoved = function(v79)
            if v73.props.actionBarHeaderRef then
                local l_current_0 = v73.props.actionBarHeaderRef.current;
                if l_current_0 then
                    local v81 = v79.AbsolutePosition.Y < l_current_0.AbsolutePosition.Y;
                    l_current_0.Visible = not v81;
                    v73.updateItemHeaderVisibleBinding(v81);
                    return ;
                else
                    return ;
                end;
            else
                return ;
            end;
        end;
    end;
    v73.hasCalledOnItemInvalid = false;
end;
v72.DEPRECATED_canItemDescriptionExpand = function(v82, v83)
    local l_DEPRECATED_itemData_0 = v82.props.DEPRECATED_itemData;
    local l_itemInfo_0 = v82.props.itemInfo;
    local v86 = nil;
    if not v59 then
        if l_DEPRECATED_itemData_0 and l_DEPRECATED_itemData_0.description then
            v86 = l_DEPRECATED_itemData_0.description;
        else
            return false;
        end;
    elseif l_itemInfo_0 and l_itemInfo_0.description then
        v86 = l_itemInfo_0.description;
    else
        return false;
    end;
    return l_GetCanExpand_0(v83, v82.state.width - 48, v86, 3);
end;
v72.didMount = function(v87)
    v87.fetchAssetOrBundleInfo();
end;
v72.didUpdate = function(v88, _)
    local l_DEPRECATED_itemData_1 = v88.props.DEPRECATED_itemData;
    local l_itemInfo_1 = v88.props.itemInfo;
    local l_fetchingState_0 = v88.props.fetchingState;
    local l_onItemInvalid_0 = v88.props.onItemInvalid;
    local v94 = nil;
    if not v59 then
        local v95 = false;
        if l_fetchingState_0 == v16.Done then
            v95 = l_DEPRECATED_itemData_1 == nil;
        end;
        v94 = v95;
    else
        local v96 = false;
        if l_fetchingState_0 == v16.Done then
            v96 = l_itemInfo_1 == nil;
        end;
        v94 = v96;
    end;
    local v97 = not v88.hasCalledOnItemInvalid;
    if not ((not (l_onItemInvalid_0 ~= nil) or not v97) or not v94) then
        l_onItemInvalid_0();
        v88.hasCalledOnItemInvalid = true;
    end;
end;
v72.DEPRECATED_shouldShowRecommendedItems = function(v98, v99)
    if not v99 then
        if not v98.props.DEPRECATED_assetType or v42.doesAssetTypeHaveCatalogPage(v98.props.DEPRECATED_assetType) then
            if not v59 then
                local l_DEPRECATED_itemData_2 = v98.props.DEPRECATED_itemData;
                if not (not l_DEPRECATED_itemData_2 or not l_DEPRECATED_itemData_2.receivedRecommendedData) and (not (l_DEPRECATED_itemData_2.recommendedItemSummaries ~= nil) or #l_DEPRECATED_itemData_2.recommendedItemSummaries == 0) then
                    return false;
                end;
            else
                local l_itemInfo_2 = v98.props.itemInfo;
                if not (not l_itemInfo_2 or not l_itemInfo_2.receivedRecommendedData) and (not (l_itemInfo_2.recommendedItemSummaries ~= nil) or #l_itemInfo_2.recommendedItemSummaries == 0) then
                    return false;
                end;
            end;
            return true;
        else
            return false;
        end;
    else
        return false;
    end;
end;
v72.DEPRECATED_renderDetailsWithProviders = function(v102, v103)
    local v104 = tostring(v102.props.itemId);
    local l_itemType_0 = v102.props.itemType;
    local l_listPadding_0 = v102.props.listPadding;
    local l_DEPRECATED_itemSubType_0 = v102.props.DEPRECATED_itemSubType;
    local l_DEPRECATED_itemData_3 = v102.props.DEPRECATED_itemData;
    local l_itemInfo_3 = v102.props.itemInfo;
    local v110 = nil;
    if not v59 then
        v110 = if not l_DEPRECATED_itemData_3 then nil else l_DEPRECATED_itemData_3.collectibleItemId;
    elseif l_itemInfo_3 then
        v110 = l_itemInfo_3.collectibleItemId;
    end;
    local l_DEPRECATED_peekViewState_0 = v102.props.DEPRECATED_peekViewState;
    local l_width_0 = v102.state.width;
    local v113 = l_getRbxthumbWithTypeSizeAndOptions_0(v104, v42.GetRbxThumbType(l_itemType_0), 420);
    local v114 = nil;
    if not v59 then
        v114 = v42.DEPRECATED_IsResellable(l_DEPRECATED_itemData_3);
    elseif l_itemInfo_3 then
        v114 = l_itemInfo_3.isResellable;
    end;
    local v115 = nil;
    local v116 = nil;
    if not v59 then
        if v65 then
            v115 = v42.DEPRECATED_HasAttribution(l_DEPRECATED_itemData_3);
        end;
        v116 = v42.DEPRECATED_HasPremiumBenefits(l_DEPRECATED_itemData_3);
    elseif l_itemInfo_3 then
        if v65 then
            v115 = l_itemInfo_3.hasAttribution;
        end;
        v116 = l_itemInfo_3.hasPremiumBenefits;
    end;
    if v60 then
        v116 = if not v116 then nil else v102.props.showPremiumContent;
    end;
    local v117 = nil;
    v117 = if not v59 then (l_DEPRECATED_itemData_3 and l_DEPRECATED_itemData_3.isOwned) and v114 else (l_itemInfo_3 and l_itemInfo_3.isOwned) and v114;
    if v61() then
        v117 = v117 and v102.props.DEPRECATED_isCollectiblesEnabled;
    end;
    local v118 = (v102.state.width * 9) / 16;
    local v119 = v102.props.showFullWithNoPeekView and v102.props.bottomDockedContainerHeight > 0;
    return l_withStyle_0(function(v120)
        local l_Theme_0 = v120.Theme;
        local l_Font_0 = v120.Font;
        local v123 = l_Font_0.BaseSize * l_Font_0.Header1.RelativeSize;
        local v124 = nil;
        if not v59 then
            v124 = if not l_DEPRECATED_itemData_3 then nil else l_DEPRECATED_itemData_3.name;
        elseif l_itemInfo_3 then
            v124 = l_itemInfo_3.name;
        end;
        local l_Font_1 = l_Font_0.Header1.Font;
        local l_Small_0 = l_IconSize_0.Small;
        if v116 then
            v124 = l_GetWrappedTextWithIcon_0(v124, v123, l_Font_1, l_Small_0, v43.PremiumIconPadding);
        end;
        local v127 = true;
        if l_DEPRECATED_peekViewState_0 ~= l_PeekViewState_0.Full then
            v127 = l_DEPRECATED_peekViewState_0 == l_PeekViewState_0.Extended;
        end;
        local v128 = v102:DEPRECATED_canItemDescriptionExpand(l_Font_0);
        local v129 = if not v128 then if v63() and v117 then v102.ownershipButtonRef else if v114 then v102.resellerRef else if v65 and v115 then v102.attributionRef else v102.recommendedItemsGridRef else v102.expandableTextRef;
        local v130 = nil;
        local v131 = nil;
        if not v59 then
            if l_DEPRECATED_itemData_3 then
                v130 = l_DEPRECATED_itemData_3.description;
                v131 = l_DEPRECATED_itemData_3.favoriteCount;
            end;
        elseif l_itemInfo_3 then
            v130 = l_itemInfo_3.description;
            v131 = l_itemInfo_3.favoriteCount;
        end;
        local v132 = if not v130 then nil else v129;
        local v133 = v102.props.navigation.getParam("fromProfile");
        local v134 = v102.props.navigation.state.routeName == v41.TryOnItem;
        local v135 = v102:DEPRECATED_shouldShowRecommendedItems(v134);
        local l_tryOn_0 = v103.tryOn;
        local v137 = 16 + l_TextService_0:GetTextSize(l_tryOn_0, l_Font_0.BaseSize * l_Font_0.Header2.RelativeSize, l_Font_0.Header2.Font, Vector2.new(10000, 10000)).X;
        local v138 = nil;
        if v68() then
            v138 = v102.props.DEPRECATED_collectibleData and v102.props.DEPRECATED_collectibleData.unitsAvailableForConsumption == 0;
        end;
        local v139 = nil;
        if v102.props.DEPRECATED_experiences then
            v139 = v3.createElement(l_LinkButton_0, {
                text = if (not not v102.props.DEPRECATED_experiences and #v102.props.DEPRECATED_experiences == 1) and (not v70() and true or v102.props.DEPRECATED_experiences[1].name) then v103.inSpecificExperience:gsub("{EXPERIENCE_NAME}", v102.props.DEPRECATED_experiences[1].name) else v103.inMultipleExperiences:gsub("{NUM_EXPERIENCES}", #v102.props.DEPRECATED_experiences), 
                onActivated = function()
                    v102.props.navigation.navigate(v41.ItemExperiencesMenu, {
                        collectibleData = v102.props.DEPRECATED_collectibleData, 
                        openPositionY = UDim.new(0, 100), 
                        menuDirection = l_MenuDirection_0.Down
                    });
                end, 
                minPaddingX = if not v68() then nil else 0, 
                layoutOrder = if not v68() then nil else 1
            });
            if not v70() then
                v3.createElement(l_LinkButton_0, {
                    text = if not not v102.props.DEPRECATED_experiences and #v102.props.DEPRECATED_experiences == 1 then v103.inSpecificExperience:gsub("{EXPERIENCE_NAME}", v102.props.DEPRECATED_experiences[1].name) else v103.inMultipleExperiences:gsub("{NUM_EXPERIENCES}", #v102.props.DEPRECATED_experiences), 
                    onActivated = function()
                        v102.props.navigation.navigate(v41.ItemExperiencesMenu, {
                            collectibleData = v102.props.DEPRECATED_collectibleData, 
                            openPositionY = UDim.new(0, 100), 
                            menuDirection = l_MenuDirection_0.Down
                        });
                    end
                });
            end;
        end;
        return v3.createElement(l_Focusable_0[l_FitFrameVertical_0], {
            width = UDim.new(1, 0), 
            contentPadding = UDim.new(0, l_listPadding_0), 
            margin = l_RoactFitComponents_0.Rect.square(24), 
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
            BackgroundTransparency = l_Theme_0.BackgroundDefault.Transparency, 
            BorderSizePixel = 0, 
            Position = UDim2.new(0, 0, 0, 0), 
            defaultChild = v132, 
            restorePreviousChildFocus = true, 
            inputBindings = {
                MoveToTop = v7.Input.onBegin(Enum.KeyCode.ButtonL2, function()
                    v102.props.peekViewFocusController.moveFocusTo(v132);
                end), 
                MoveToRecItemsGrid = v7.Input.onBegin(Enum.KeyCode.ButtonR2, function()
                    v102.props.peekViewFocusController.moveFocusTo(v102.recommendedItemsGridRef);
                end)
            }
        }, {
            ItemThumbnail = v3.createElement(l_FitFrameVertical_0, {
                width = UDim.new(1, 0), 
                contentPadding = UDim.new(0, 12), 
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                BackgroundTransparency = 1, 
                LayoutOrder = 1
            }, {
                NameLabel = v3.createElement(l_FitFrameVertical_0, {
                    width = UDim.new(1, 0), 
                    LayoutOrder = 0, 
                    BackgroundTransparency = 1, 
                    [v3.Change.AbsolutePosition] = v102.onItemHeaderMoved
                }, {
                    TextLabel = if not l_IsVRAppBuild_0() then if v124 then v3.createElement(l_FitTextLabel_0, {
                        width = UDim.new(1, 0), 
                        Visible = v102.itemHeaderVisibleBinding, 
                        BackgroundTransparency = 1, 
                        Font = l_Font_1, 
                        Text = v124, 
                        TextSize = v123, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextColor3 = l_Theme_0.TextEmphasis.Color, 
                        TextWrapped = true
                    }, {
                        PremiumIcon = if not v116 then nil else v3.createElement(l_ImageSetLabel_0, {
                            Position = UDim2.new(0, 0, 0, 5), 
                            Size = UDim2.new(0, l_Small_0, 0, l_Small_0), 
                            ScaleType = Enum.ScaleType.Fit, 
                            Image = v71, 
                            ImageColor3 = l_Theme_0.IconEmphasis.Color, 
                            ImageTransparency = l_Theme_0.IconEmphasis.Transparency, 
                            BackgroundTransparency = 1
                        })
                    }) else v3.createElement(l_ShimmerPanel_0, {
                        Size = UDim2.new(1, 0, 0, v123)
                    }) else nil, 
                    RefUpdater = v3.createElement("Frame", {
                        Size = UDim2.new(0, 0, 0, 0), 
                        BackgroundTransparency = 1, 
                        [v3.Ref] = function(v140)
                            if not (not v140 or not v140.Parent) then
                                v102.onItemHeaderMoved(v140.Parent);
                            end;
                        end
                    }), 
                    ExperienceLink = if v68() then nil else v139
                }), 
                ExperienceLinkDetails = if not not v68() and v102.props.DEPRECATED_experiences then v3.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, l_Font_0.BaseSize * l_Font_0.Body.RelativeSize), 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 0
                }, {
                    UIListLayout = v3.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Horizontal, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        Padding = UDim.new(0, 4)
                    }), 
                    ExperienceLink = v139, 
                    DashDivider = if not v138 then nil else v3.createElement(l_StyledTextLabel_0, {
                        automaticSize = Enum.AutomaticSize.XY, 
                        text = "-", 
                        fontStyle = l_Font_0.Body, 
                        colorStyle = l_Theme_0.TextDefault, 
                        layoutOrder = 2
                    }), 
                    SoldOutText = if not v138 then nil else v3.createElement(l_StyledTextLabel_0, {
                        automaticSize = Enum.AutomaticSize.XY, 
                        text = v103.soldOut, 
                        fontStyle = l_Font_0.Body, 
                        colorStyle = l_Theme_0.TextDefault, 
                        layoutOrder = 3
                    })
                }) else nil, 
                ItemImageFrame = v3.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 0, v118), 
                    LayoutOrder = 1, 
                    ZIndex = 0
                }, {
                    ItemBackground = v3.createElement("Frame", {
                        AnchorPoint = Vector2.new(0.5, 0), 
                        Position = UDim2.fromScale(0.5, 0), 
                        Size = UDim2.new(1, 48, 1, 0), 
                        ZIndex = 0, 
                        BackgroundColor3 = l_Theme_0.BackgroundMuted.Color, 
                        BackgroundTransparency = l_Theme_0.BackgroundMuted.Transparency, 
                        BorderSizePixel = 0
                    }, {
                        UIGradient = v3.createElement("UIGradient", {
                            Rotation = -90, 
                            Transparency = NumberSequence.new({
                                NumberSequenceKeypoint.new(0, 1), 
                                NumberSequenceKeypoint.new(0.4, 0), 
                                NumberSequenceKeypoint.new(1, 1)
                            })
                        })
                    }), 
                    Image = v3.createElement(l_LoadableImage_0, {
                        BackgroundTransparency = 1, 
                        Image = v113, 
                        AnchorPoint = Vector2.new(0.5, 0), 
                        Position = UDim2.fromScale(0.5, 0), 
                        Size = UDim2.fromOffset(v118, v118), 
                        useShimmerAnimationWhileLoading = true
                    }), 
                    TryOnButtonFrame = if not v133 then nil else v3.createElement("Frame", {
                        ZIndex = 2, 
                        Size = UDim2.fromScale(1, 1), 
                        BorderSizePixel = 0, 
                        BackgroundTransparency = 1
                    }, {
                        TryOnButton = v3.createElement(l_Button_0, {
                            buttonType = l_ButtonType_0.Secondary, 
                            position = UDim2.new(1, -v137 - 8, 1, -44), 
                            size = UDim2.fromOffset(v137, 36), 
                            text = l_tryOn_0, 
                            onActivated = v102.onTryOnActivated
                        })
                    })
                })
            }), 
            IncludedItems = if not v134 and l_itemType_0 == v44.ItemType.Bundle then v3.createElement(v50, {
                itemId = v104, 
                itemType = l_itemType_0, 
                LayoutOrder = 2
            }) else nil, 
            ItemDescription = v3.createElement(v45, {
                compactNumberOfLines = 3, 
                descriptionText = v130, 
                LayoutOrder = 3, 
                [v3.Ref] = v102.expandableTextRef, 
                NextSelectionUp = if not v63() then nil else v102.props.NextSelectionUp, 
                NextSelectionDown = if not v63() then if v127 then if v114 then v102.resellerRef else if v65 and v115 then v102.attributionRef else v102.recommendedItemsGridRef else nil else if v127 and v117 then v102.ownershipButtonRef else if v127 and v114 then v102.resellerRef else if (v65 and v127) and v115 then v102.attributionRef else if v127 then v102.recommendedItemsGridRef else v102.props.NextSelectionDown
            }), 
            ItemStatistics = not v134 and v3.createElement(v46, {
                favoritesCount = v131, 
                LayoutOrder = 4, 
                listPadding = 10, 
                width = l_width_0 - 48
            }), 
            ItemOwnershipButton = if not v117 then nil else v3.createElement(v47, {
                size = UDim2.new(1, 0, 0, 0), 
                automaticSize = Enum.AutomaticSize.Y, 
                layoutOrder = 5, 
                itemId = v104, 
                isLimitedCollectible = if not v69() then nil else v102.props.isLimitedCollectible, 
                collectibleItemId = v110, 
                onActivated = v102.onItemOwnershipButtonActivated, 
                ref = if not v63() then nil else v102.ownershipButtonRef, 
                NextSelectionUp = if not v63() then nil else if v127 and v128 then v102.expandableTextRef else v102.props.NextSelectionUp, 
                NextSelectionDown = if not v63() then nil else if v127 and v114 then v102.resellerRef else if (v65 and v127) and v115 then v102.attributionRef else if v127 then v102.recommendedItemsGridRef else v102.props.NextSelectionDown
            }), 
            ItemInfoList = not v134 and v3.createElement(v48, {
                itemId = v104, 
                itemType = l_itemType_0, 
                LayoutOrder = 6, 
                ref = if not v65 then v102.resellerRef else nil, 
                resellerRef = if not v65 then nil else v102.resellerRef, 
                attributionRef = if not v65 then nil else v102.attributionRef, 
                NextSelectionUp = if not v63() then (v127 and v128) and v102.expandableTextRef or nil else if v127 and v117 then v102.ownershipButtonRef else if v127 and v128 then v102.expandableTextRef else v102.props.NextSelectionUp, 
                NextSelectionDown = if not v63() then v127 and v102.recommendedItemsGridRef or nil else if v127 then v102.recommendedItemsGridRef else v102.props.NextSelectionDown
            }), 
            RecommendedLabel = v135 and v3.createElement(l_FitTextLabel_0, {
                width = l_FitTextLabel_0.Width.FitToText, 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Font = l_Font_0.Header1.Font, 
                LayoutOrder = 8, 
                Position = UDim2.new(0, 0, 0, 0), 
                Text = v103.recommendedLabel, 
                TextSize = v123, 
                TextColor3 = l_Theme_0.TextEmphasis.Color
            }), 
            RecommendedItemsGrid = v135 and v3.createElement(v49, {
                itemId = v104, 
                itemSubType = l_DEPRECATED_itemSubType_0, 
                itemType = l_itemType_0, 
                LayoutOrder = 9, 
                [v3.Ref] = v102.recommendedItemsGridRef, 
                NextSelectionUp = if (not not v65 and v127) and v115 then v102.attributionRef else if v63() then if v127 and v114 then v102.resellerRef else if v127 and v117 then v102.ownershipButtonRef else if v127 and v128 then v102.expandableTextRef else v102.props.NextSelectionUp else (v114 and v102.resellerRef or v128 and v102.expandableTextRef) or nil, 
                NextSelectionDown = v102.props.NextSelectionDown, 
                itemDetailsPeekViewRefs = v102.props.itemDetailsPeekViewRefs, 
                resultsListRef = v102.props.resultsListRef
            }), 
            BottomContainerPlaceHolder = v119 and v3.createElement("Frame", {
                LayoutOrder = 10, 
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 0, v102.props.bottomDockedContainerHeight), 
                Active = false
            })
        });
    end);
end;
v72.renderDetails = function(v141)
    if not v67() then
        return l_withLocalization_0({
            recommendedLabel = "Feature.Catalog.Label.Recommendations", 
            resellLabel = "Feature.Catalog.Heading.Sellers", 
            tryOn = "Feature.Avatar.Action.TryOn", 
            inMultipleExperiences = "Feature.Catalog.Label.InMultipleExperiences", 
            inSpecificExperience = "Feature.Catalog.Label.InSpecificExperience", 
            soldOut = "Feature.Catalog.Label.SoldOut"
        })(function(v142)
            return v141:DEPRECATED_renderDetailsWithProviders(v142);
        end);
    else
        return v3.createElement(v53, {
            itemId = v141.props.itemId, 
            itemType = v141.props.itemType, 
            width = v141.state.width, 
            actionBarHeaderRef = v141.props.actionBarHeaderRef, 
            listPadding = v141.props.listPadding, 
            showFullWithNoPeekView = v141.props.showFullWithNoPeekView, 
            bottomDockedContainerHeight = v141.props.bottomDockedContainerHeight, 
            resultsListRef = v141.props.resultsListRef, 
            itemDetailsPeekViewRefs = v141.props.itemDetailsPeekViewRefs, 
            peekViewFocusController = v141.props.peekViewFocusController, 
            NextSelectionDown = v141.props.NextSelectionDown, 
            NextSelectionUp = v141.props.NextSelectionUp, 
            collectibleData = v141.props.DEPRECATED_collectibleData
        });
    end;
end;
v72.renderOnFailed = function(v143)
    local l_fetchAssetOrBundleInfo_0 = v143.fetchAssetOrBundleInfo;
    local v145 = l_getSafeAreaSize_0(v143.props.screenSize, v143.props.globalGuiInset);
    return v3.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, v145.Y.Scale, v145.Y.Offset - (v43.ActionBar.ActionBarHeight + v43.ActionBar.ActionBarGradientHeight))
    }, {
        EmptyStatePage = l_withLocalization_0({
            emptyText = "Feature.EmptyStatePage.Message.NoInternet"
        })(function(v146)
            return v3.createElement(l_EmptyState_0, {
                onActivated = l_fetchAssetOrBundleInfo_0, 
                text = v146.emptyText
            });
        end)
    });
end;
v72.render = function(v147)
    local l_clipDetails_0 = v147.props.clipDetails;
    local l_fetchingState_1 = v147.props.fetchingState;
    return l_withStyle_0(function(v150)
        local l_Theme_1 = v150.Theme;
        return v3.createElement(if not l_clipDetails_0 then l_FitFrameVertical_0 else "Frame", {
            width = if l_clipDetails_0 then nil else UDim.new(1, 0), 
            ClipsDescendants = l_clipDetails_0, 
            Size = if not l_clipDetails_0 then nil else UDim2.new(1, 0, 0, 0), 
            BackgroundColor3 = l_Theme_1.BackgroundDefault.Color, 
            BackgroundTransparency = l_Theme_1.BackgroundDefault.Transparency, 
            BorderSizePixel = 0, 
            Position = UDim2.new(0, 0, 0, 0), 
            [v3.Ref] = v147.props.forwardRef, 
            [v3.Change.AbsoluteSize] = function(v152)
                if v147.state.width ~= v152.AbsoluteSize.X then
                    v147:setState({
                        width = v152.AbsoluteSize.X
                    });
                end;
            end
        }, {
            LoadingState = v3.createElement(l_LoadingStateContainer_0, {
                dataStatus = l_RetrievalStatus_0.fromRawValue(l_fetchingState_1), 
                renderOnLoading = function()
                    return v147:renderDetails();
                end, 
                renderOnLoaded = function()
                    return v147:renderDetails();
                end, 
                renderOnFailed = function()
                    return v147:renderOnFailed();
                end
            })
        });
    end);
end;
v72 = v6.connect(function(v153, v154)
    local v155 = l_PerformFetch_0.GetStatus(v153, v42.GetItemDetailsKey(v154.itemId, v154.itemType));
    local v156 = nil;
    local v157 = nil;
    if v155 ~= v16.NotStarted then
        if not v59 then
            v156 = v55(v153.AvatarExperience.Common, v154.itemId, v154.itemType);
        else
            v157 = v57(v153.AvatarExperience, v154.itemId, v154.itemType);
        end;
    end;
    local v158 = nil;
    local v159 = nil;
    local v160 = nil;
    local v161 = nil;
    if not v67() then
        if v66() then
            local v162 = nil;
            if not v59 then
                v162 = if not v156 then nil else v156.collectibleItemId;
                v158 = if not v69() then if v162 then v153.AvatarExperience.Common.Collectibles.CollectiblesItemInfo[v156.collectibleItemId] else nil else if v162 and v156 then v153.AvatarExperience.Common.Collectibles.CollectiblesItemInfo[v156.collectibleItemId] else nil;
            elseif v157 then
                v162 = v157.collectibleItemId;
                if v162 then
                    v158 = v153.AvatarExperience.Common.Collectibles.CollectiblesItemInfo[v162];
                end;
            end;
        end;
        if not v59 then
            v159 = v42.DEPRECATED_GetItemSubType(v154.itemType, v156);
        elseif v157 then
            v159 = v157.itemSubType;
        end;
        if v66() and v158 ~= nil then
            v160 = v158.experiences;
        end;
        if v61() then
            v161 = v153.AvatarExperience.Catalog.Metadata.isCollectiblesEnabled;
        end;
    end;
    local v163 = nil;
    if v69() then
        v163 = if not v59 then v42.DEPRECATED_isLimitedCollectible(v156) else v157 and v157.isLimitedCollectible;
    end;
    return {
        globalGuiInset = v153.GlobalGuiInset, 
        screenSize = v153.ScreenSize, 
        fetchingState = v155, 
        itemInfo = if not v59 then nil else v157, 
        DEPRECATED_itemData = if not v59 then v156 else nil, 
        DEPRECATED_itemSubType = v159, 
        DEPRECATED_peekViewState = if not v67() then v153.AvatarExperience.Common.ItemDetailsPeekView.viewState else nil, 
        DEPRECATED_experiences = v160, 
        DEPRECATED_collectibleData = v158, 
        DEPRECATED_isCollectiblesEnabled = v161, 
        isLimitedCollectible = if not v69() then nil else v163
    };
end, function(v164, _)
    return {
        fetchAssetOrBundleInfo = function(v166, v167, v168, v169)
            return v164(v54(v166, v167, v168, v169));
        end, 
        navigateDownToAvatarScreen = function(v170, v171, v172)
            return v164(v40(v170, v171, v172));
        end, 
        toggleTryOn = function(v173, v174, v175, v176, v177, v178, v179, v180)
            v164(v52(v173, v174, v175, v176, v177, v178, v179, v180));
        end
    };
end)(v72);
if v60 then
    v72 = l_RoactAppPolicy_0.connect(function(v181, _)
        return {
            showPremiumContent = v181.getShowCatalogPremiumContent()
        };
    end)(v72);
end;
v72 = l_RoactServices_0.connect({
    appAnalytics = v5, 
    catalogAnalytics = v19, 
    networking = v15
})((v11.withNavigation(v72)));
return v3.forwardRef(function(v183, v184)
    return v3.createElement(v72, v4.Dictionary.join(v183, {
        forwardRef = v184
    }));
end);
