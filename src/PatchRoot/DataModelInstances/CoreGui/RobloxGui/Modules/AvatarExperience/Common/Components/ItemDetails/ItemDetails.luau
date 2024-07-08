local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(l_CorePackages_0.Roact);
local v5 = require(l_CorePackages_0.Packages.RoactGamepad);
local v6 = require(l_CorePackages_0.Packages.React);
local l_Focusable_0 = v5.Focusable;
local v8 = require(l_CorePackages_0.RoactRodux);
local v9 = require(l_CorePackages_0.UIBlox);
local v10 = require(l_CorePackages_0.Cryo);
local l_ImageSetLabel_0 = v9.Core.ImageSet.ImageSetLabel;
local l_GetWrappedTextWithIcon_0 = v9.Core.Text.GetWrappedTextWithIcon;
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local l_getSafeAreaSize_0 = require(l_CorePackages_0.Workspace.Packages.InputUi).getSafeAreaSize;
local v16 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local l_memoize_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).memoize;
local v18 = require(l_CorePackages_0.Packages.t);
local v19 = require(l_Modules_0.LuaApp.Constants);
local v20 = require(l_Modules_0.LuaApp.Enum.ToastType);
local l_PeekViewState_0 = require(l_CorePackages_0.Workspace.Packages.PeekView).PeekViewState;
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local l_withStyle_0 = v9.Style.withStyle;
local l_ShimmerPanel_0 = v9.App.Loading.ShimmerPanel;
local l_Images_0 = v9.App.ImageSet.Images;
local l_IconSize_0 = v9.App.Constant.IconSize;
local v27 = l_Images_0["icons/status/premium_small"];
local v28 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
local l_withSelectionCursorProvider_0 = v9.App.SelectionImage.withSelectionCursorProvider;
local l_IsVRAppBuild_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).IsVRAppBuild;
local l_Common_0 = l_Modules_0.AvatarExperience.Common;
local v33 = require(l_Common_0.Thunks.CloseFocusedScreen);
local _ = require(l_Common_0.AvatarExperienceState);
local v35 = require(l_Common_0.Components.RoactNavigation.Debug.NavigationEventsLogger);
local v36 = require(l_Common_0.Constants);
local v37 = require(l_Common_0.Utils);
local v38 = require(l_Common_0.Components.BoundInputsUpdater);
local v39 = require(l_Common_0.Components.ItemDetails.ItemDetailsContainer);
local v40 = require(l_Common_0.Components.ItemDetails.PeekViewTopBar);
local v41 = require(l_Common_0.Components.ItemDetails.VRItemDetailsTopBar);
local v42 = require(l_Common_0.Components.GamepadFocusHandlerForPage);
local v43 = require(l_Common_0.Components.RoactNavigation.NavigationUtils);
local v44 = require(l_Common_0.Components.RoactNavigation.AvatarScreen);
local v45 = require(l_Common_0.Components.RoactNavigation.withMappedNavigationParams);
local v46 = require(l_Common_0.Components.RoactNavigation.AvatarRoute);
local v47 = require(l_Common_0.Validators.DEPRECATED_ItemDataValidator);
local v48 = require(l_Common_0.Selectors.selectIsPortrait);
local v49 = require(l_Common_0.Thunks.CloseAllPeekViews);
local v50 = require(l_Common_0.Thunks.CloseAllItemDetails);
local v51 = require(l_Common_0.Selectors.DEPRECATED_ItemData);
local v52 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectItemInfo);
local v53 = require(l_Modules_0.AvatarExperience.Common.Models.ItemInfo);
local v54 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXFixItemTypeHandling);
local v55 = require(l_Common_0.Actions.SetItemDetailsExpanded);
local v56 = require(l_Common_0.Actions.SetItemDetailsPeekViewState);
local v57 = require(l_Common_0.Components.ItemDetails.ItemDetailsPeekView);
local v58 = require(l_Common_0.Components.ItemDetails.ItemDetailsModal);
local v59 = require(l_Common_0.Components.ItemDetails.ItemDetailsFull);
local v60 = require(l_Common_0.Components.withLastInputGroup);
local v61 = require(l_Common_0.Debug.LogTree).logger("ax.itemdetails");
local v62 = require(l_Common_0.Thunks.OpenItemPrompt);
local v63 = require(l_Common_0.Hooks.useAvatarExperienceFocusNavigationBindings);
local v64 = require(l_Common_0.Hooks.useOverlayClosedCallback);
local l_Catalog_0 = l_Modules_0.AvatarExperience.Catalog;
local v66 = require(l_Catalog_0.Services.Analytics);
local v67 = require(l_Catalog_0.Components.ActionBar.BuyActionBar);
local v68 = require(l_Catalog_0.CatalogUtils);
local v69 = require(l_Catalog_0.CatalogConstants);
local v70 = require(l_Catalog_0.Thunks.RedeemQRCodeItem);
local v71 = require(l_Catalog_0.Actions.SetItemTryOnPeekViewState);
local v72 = require(l_Catalog_0.Components.ActionBar.PremiumBar);
local v73 = require(l_Catalog_0.Components.OnFocusExposureLogger);
local l_Flags_0 = l_Modules_0.AvatarExperience.Flags;
local v75 = require(l_Flags_0.AvatarMarketplaceBackendIXPTests);
local v76 = require(l_Flags_0.FFlagAEShowPremiumPolicy);
local v77 = require(l_Flags_0.FFlagQRCodeItemRedemptionEnabled);
local v78 = require(l_Flags_0.FFlagEnableAttributionItemRow);
local v79 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXItemDetailsContainer);
local v80 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXGateUGC4ACollectibleAssetsBundles);
local v81 = {
    toastMessage = "Feature.Avatar.Message.InvalidItem", 
    isLocalized = false, 
    toastType = v20.InformationMessage
};
local v82 = l_GuiService_0:IsTenFootInterface();
local v83 = v4.PureComponent:extend("ItemDetails");
v83.validateProps = v18.strictInterface({
    itemId = v18.string, 
    itemType = v18.string, 
    itemSubType = v18.optional(v18.string), 
    isFirstItemDetails = v18.optional(v18.boolean), 
    fromProfile = v18.optional(v18.boolean), 
    mountAsFullView = v18.optional(v18.boolean), 
    assetType = v18.optional(v18.string), 
    mountAnimation = v18.optional(v18.boolean), 
    itemDetailsPeekViewRefs = v18.optional(v18.table), 
    resultsListRef = v18.optional(v18.table), 
    detail = v18.optional(v18.string), 
    prevNavPage = v18.optional(v18.string), 
    prevNavHistory = v18.optional(v18.table), 
    showFullWithNoPeekView = v18.optional(v18.boolean), 
    widgetInfo = v18.optional(v18.table), 
    onItemDetailsClosed = v18.optional(v18.callback), 
    navigation = v18.table, 
    avatarRoute = v46.Interface, 
    isSceneFullView = v18.boolean, 
    DEPRECATED_itemData = v18.optional(v47), 
    itemInfo = v18.optional(v53.Validator), 
    peekViewShowing = v18.boolean, 
    topBarHeight = v18.number, 
    itemDetailsExpanded = v18.boolean, 
    playerMembership = v18.optional(v18.enum(Enum.MembershipType)), 
    lastInputGroup = v18.string, 
    itemDetailsTryOnViewState = v18.any, 
    itemDetailsViewState = v18.any, 
    screenSize = v18.Vector2, 
    globalGuiInset = v18.table, 
    wideMode = v18.boolean, 
    hideUnsupportedItemDetails = if not v80() then nil else v18.optional(v18.boolean), 
    closeAllPeekViews = v18.callback, 
    closeFiltersAndItemDetails = v18.callback, 
    closeFocusedScreen = v18.callback, 
    setItemDetailsExpanded = v18.callback, 
    setCurrentToastMessage = v18.callback, 
    openItemPrompt = v18.callback, 
    redeemQRCodeItemPrompt = v18.callback, 
    setItemDetailsPeekViewState = v18.callback, 
    setItemTryOnPeekViewState = v18.callback, 
    isPortrait = v18.optional(v18.boolean), 
    networking = v18.callback, 
    analytics = v18.table, 
    peekViewFullViewEnabled = v18.boolean, 
    showPremiumContent = v18.boolean, 
    overlayClosedCallback = v18.callback, 
    focusController = v18.table
});
v83.init = function(v84)
    v84.contentFrameRef = v4.createRef();
    v84.actionBarContainerRef = v4.createRef();
    v84.actionBarHeaderRef = v4.createRef();
    v84.backButtonRef = v4.createRef();
    v84.closeBriefView = function()
        v84.props.analytics.closeItemDetailPage(v84.props.itemId, v84.props.itemType);
        v84.props.closeFiltersAndItemDetails(v84.props.navigation);
    end;
    v84.onItemInvalid = function()
        if v84.isMounted then
            v84.closeBriefView();
            v84.props.setCurrentToastMessage(v81);
        end;
    end;
    v84.renderContentCallback = function()
        return v84:renderContent();
    end;
    v84.renderUnsupportedItemMessageCallback = if not v80() then nil else l_memoize_0(function(v85)
        return function()
            return v84:renderUnsupportedItemMessage(v85);
        end;
    end);
    v84.getRenderTopBarCallback = l_memoize_0(function(v86)
        return function()
            return v84:renderTopBar(v86);
        end;
    end);
    v84.getRenderActionBarCallback = l_memoize_0(function(v87, v88, v89)
        return function()
            return v84:renderActionBar(v87, v88, v89);
        end;
    end);
    v84.setPeekViewState = function(v90)
        if not v84:getIsTryOnPage() then
            v84.props.setItemDetailsPeekViewState(v90);
            return ;
        else
            v84.props.setItemTryOnPeekViewState(v90);
            return ;
        end;
    end;
end;
v83.getBriefViewHeight = function(v91)
    local v92 = nil;
    local v93 = nil;
    if not v54 then
        v92 = v91.props.DEPRECATED_itemData;
    else
        v93 = v91.props.itemInfo;
    end;
    local v94 = v91.props.playerMembership == Enum.MembershipType.Premium;
    local v95 = nil;
    local v96 = nil;
    if not v54 then
        v95 = v68.DEPRECATED_IsPremiumExclusive(v92);
        v96 = v68.DEPRECATED_HasPremiumBenefits(v92);
    elseif v93 then
        v95 = v93.isPremiumExclusive;
        v96 = v93.hasPremiumBenefits;
    end;
    if v76 then
        v96 = v96 and v91.props.showPremiumContent;
    end;
    local v97 = 0;
    if not (not (v91.props.lastInputGroup == v19.InputType.Gamepad) or not v82) then
        v97 = v19.GAMEPAD_BOTTOM_BAR_SIZE;
    end;
    local v98 = (v69.ActionBar.ActionBarHeight + v69.ActionBar.ActionBarGradientHeight) + v97;
    if v82 then
        v96 = false;
    end;
    if v96 then
        v98 = v98 + v72:getPremiumBarHeight(v95, v94);
    end;
    return v98 + 20;
end;
v83.renderTopBar = function(v99, v100)
    local l_Theme_0 = v100.Theme;
    local l_fromProfile_0 = v99.props.fromProfile;
    local l_topBarHeight_0 = v99.props.topBarHeight;
    local v104 = nil;
    if not v54 then
        if v99.props.DEPRECATED_itemData then
            v104 = v99.props.DEPRECATED_itemData.name;
        end;
    elseif v99.props.itemInfo then
        v104 = v99.props.itemInfo.name;
    end;
    return v4.createElement("Frame", {
        BackgroundTransparency = not l_fromProfile_0 and 1 or 0, 
        BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
        BorderSizePixel = 0, 
        Position = UDim2.fromScale(0, 0), 
        Size = UDim2.new(1, 0, 0, l_topBarHeight_0), 
        ZIndex = 2, 
        Visible = v99.topBarNavVisible
    }, {
        TopBar = if not l_IsVRAppBuild_0() then v4.createElement(v40, {
            [v4.Ref] = v99.backButtonRef, 
            NextSelectionDown = v99.contentFrameRef, 
            DEPRECATED_itemId = if not v54 then v99.props.itemId else nil, 
            DEPRECATED_itemType = if not v54 then v99.props.itemType else nil, 
            DEPRECATED_itemData = if not v54 then v99.props.DEPRECATED_itemData else nil, 
            itemInfo = if not v54 then nil else v99.props.itemInfo
        }) else v4.createElement(v41, {
            topBarHeight = l_topBarHeight_0, 
            title = v104, 
            closeFocusedScreen = v99.props.closeFocusedScreen, 
            navigation = v99.props.navigation
        })
    });
end;
v83.renderActionBar = function(v105, _, v107, v108)
    local l_itemId_0 = v105.props.itemId;
    local l_itemType_0 = v105.props.itemType;
    local v111 = nil;
    local v112 = nil;
    if not v54 then
        v112 = v105.props.DEPRECATED_itemData;
    else
        v111 = v105.props.itemInfo;
    end;
    local l_Theme_1 = v107.Theme;
    local l_Font_0 = v107.Font;
    local v115 = l_Font_0.BaseSize * l_Font_0.Header1.RelativeSize;
    local v116 = nil;
    if not v54 then
        v116 = v68.DEPRECATED_HasPremiumBenefits(v112);
    elseif v111 then
        v116 = v111.hasPremiumBenefits;
    end;
    if v76 then
        v116 = v116 and v105.props.showPremiumContent;
    end;
    local v117 = nil;
    if not v54 then
        v117 = v112 and v112.name;
    elseif v111 then
        v117 = v111.name;
    end;
    local l_Font_1 = l_Font_0.Header1.Font;
    local l_Small_0 = l_IconSize_0.Small;
    if v116 then
        v117 = l_GetWrappedTextWithIcon_0(v117, v115, l_Font_1, l_Small_0, v69.PremiumIconPadding);
    end;
    return v4.createElement(l_Focusable_0.Frame, {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 0, v108), 
        Position = UDim2.fromScale(0, 1), 
        AnchorPoint = Vector2.new(0, 1), 
        ZIndex = 3, 
        [v4.Ref] = v105.actionBarContainerRef, 
        NextSelectionUp = v105.contentFrameRef, 
        inputBindings = {
            MoveToItemDetailsContainer = v5.Input.onBegin(Enum.KeyCode.ButtonL2, function()
                v105:getFocusController().moveFocusUp();
            end)
        }
    }, {
        BuyActionBar = v4.createElement(v67, {
            itemId = l_itemId_0, 
            itemType = l_itemType_0, 
            headerPadding = 24, 
            leftPadding = 20, 
            bottomPadding = 20, 
            rightPadding = 20, 
            ZIndex = 1
        }), 
        ActionBarHeader = v4.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, -48, 0, v115), 
            Position = UDim2.new(0, 24, 0, 5), 
            ZIndex = 2, 
            [v4.Ref] = v105.actionBarHeaderRef
        }, {
            PremiumIcon = not not v116 and v4.createElement(l_ImageSetLabel_0, {
                Position = UDim2.new(0, 0, 0, 4), 
                Size = UDim2.new(0, l_IconSize_0.Small, 0, l_IconSize_0.Small), 
                ScaleType = Enum.ScaleType.Fit, 
                Image = v27, 
                ImageColor3 = l_Theme_1.IconEmphasis.Color, 
                ImageTransparency = l_Theme_1.IconEmphasis.Transparency, 
                BackgroundTransparency = 1
            }) or nil, 
            NameLabel = not not v117 and v4.createElement("TextLabel", {
                Position = UDim2.fromOffset(0, 0), 
                BackgroundTransparency = 1, 
                Font = l_Font_1, 
                Size = UDim2.new(1, 0, 0, v115), 
                Text = v117, 
                TextSize = v115, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextColor3 = l_Theme_1.TextEmphasis.Color, 
                TextTruncate = Enum.TextTruncate.AtEnd
            }) or v4.createElement(l_ShimmerPanel_0, {
                Size = UDim2.new(1, 0, 0, v115)
            })
        })
    });
end;
v83.renderContent = function(v120)
    local l_itemId_1 = v120.props.itemId;
    local l_itemType_1 = v120.props.itemType;
    local v123 = nil;
    if not v79() then
        v123 = v120.props.itemSubType;
    end;
    local l_itemDetailsPeekViewRefs_0 = v120.props.itemDetailsPeekViewRefs;
    local l_resultsListRef_0 = v120.props.resultsListRef;
    local l_peekViewFullViewEnabled_0 = v120.props.peekViewFullViewEnabled;
    local l_assetType_0 = v120.props.assetType;
    if l_itemId_1 then
        return v4.createElement(l_Focusable_0[v39], {
            actionBarHeaderRef = v120.actionBarHeaderRef, 
            clipDetails = not l_peekViewFullViewEnabled_0, 
            itemId = l_itemId_1, 
            itemType = l_itemType_1, 
            DEPRECATED_itemSubType = if not v79() then v123 else nil, 
            assetType = l_assetType_0, 
            onItemInvalid = v120.onItemInvalid, 
            showFullWithNoPeekView = v120.props.showFullWithNoPeekView, 
            bottomDockedContainerHeight = v120:getBriefViewHeight(), 
            resultsListRef = l_resultsListRef_0, 
            itemDetailsPeekViewRefs = l_itemDetailsPeekViewRefs_0, 
            peekViewFocusController = v120:getFocusController(), 
            NextSelectionDown = v120.actionBarContainerRef, 
            NextSelectionUp = v120.backButtonRef, 
            ref = if not v120.props.showFullWithNoPeekView then nil else v120.contentFrameRef
        });
    else
        return nil;
    end;
end;
if v80() then
    v83.renderUnsupportedItemMessage = function(_, v129)
        local l_Theme_2 = v129.Theme;
        local l_Font_2 = v129.Font;
        local l_Header1_0 = l_Font_2.Header1;
        local v133 = l_Header1_0.RelativeSize * l_Font_2.BaseSize;
        return l_withLocalization_0({
            UpdateRequiredMessage = "Feature.Avatar.Message.UpdateRequired"
        })(function(v134)
            return v4.createElement("Frame", {
                AnchorPoint = Vector2.new(0, 0), 
                BackgroundColor3 = l_Theme_2.BackgroundDefault.Color, 
                BackgroundTransparency = l_Theme_2.BackgroundDefault.Transparency, 
                BorderSizePixel = 0, 
                Position = UDim2.new(0, 0, 0, 0), 
                Size = UDim2.fromScale(1, 1)
            }, {
                UnsupportedItemDetailsMessage = v4.createElement("TextLabel", {
                    BackgroundTransparency = 1, 
                    Font = l_Header1_0.Font, 
                    Position = UDim2.fromScale(0, 0), 
                    Size = UDim2.fromScale(1, 1), 
                    Text = v134.UpdateRequiredMessage, 
                    TextColor3 = l_Theme_2.TextDefault.Color, 
                    TextSize = v133, 
                    TextTransparency = l_Theme_2.TextDefault.Transparency, 
                    TextWrapped = true, 
                    TextXAlignment = Enum.TextXAlignment.Center, 
                    TextYAlignment = Enum.TextYAlignment.Center
                })
            });
        end);
    end;
end;
v83.getIsTryOnPage = function(v135)
    return v135.props.navigation.state.routeName == v44.TryOnItem;
end;
v83.getItemDetailsComponent = function(v136, v137)
    if not l_IsVRAppBuild_0() then
        if not v137 then
            if not v136.props.showFullWithNoPeekView then
                return v57;
            else
                return v59;
            end;
        else
            return v58;
        end;
    else
        return v59;
    end;
end;
v83.render = function(v138)
    return l_withSelectionCursorProvider_0(function(v139)
        return l_withStyle_0(function(v140)
            return v138:renderWithProviders(v139, v140);
        end);
    end);
end;
v83.renderWithProviders = function(v141, v142, v143)
    local l_isSceneFullView_0 = v141.props.isSceneFullView;
    local l_itemId_2 = v141.props.itemId;
    local l_itemType_2 = v141.props.itemType;
    local l_key_0 = v141.props.navigation.state.key;
    local l_itemDetailsPeekViewRefs_1 = v141.props.itemDetailsPeekViewRefs;
    local l_resultsListRef_1 = v141.props.resultsListRef;
    local v150 = v141:getIsTryOnPage();
    local l_wideMode_0 = v141.props.wideMode;
    local v152 = if not v150 then v141.props.itemDetailsViewState else v141.props.itemDetailsTryOnViewState;
    if l_itemId_2 then
        local l_fromProfile_1 = v141.props.fromProfile;
        local v154 = (l_wideMode_0 and l_fromProfile_1) and not v150;
        local l_isPortrait_0 = v141.props.isPortrait;
        local v156 = true;
        local v157 = UDim2.fromScale(0, 0);
        local v158 = UDim2.fromScale(1, 1);
        if not l_isPortrait_0 then
            if not l_fromProfile_1 and not v150 then
                v157 = UDim2.fromScale(v36.LandscapeNavWidth, 0);
                v158 = UDim2.fromScale(v36.LandscapeSceneWidth, 1);
            else
                local l_Offset_0 = l_getSafeAreaSize_0(v141.props.screenSize, v141.props.globalGuiInset).X.Offset;
                local v160 = math.min(l_Offset_0, 640);
                if v150 and v160 < l_Offset_0 then
                    v156 = false;
                end;
                v157 = UDim2.fromOffset((l_Offset_0 - v160) / 2, 0);
                v158 = UDim2.new(0, v160, 1, 0);
            end;
        end;
        local v161 = v141:getBriefViewHeight();
        local l_mountAsFullView_0 = v141.props.mountAsFullView;
        if l_mountAsFullView_0 then
            l_mountAsFullView_0 = true;
            if v152 ~= l_PeekViewState_0.Full then
                l_mountAsFullView_0 = v152 == l_PeekViewState_0.Extended;
            end;
        end;
        return v4.createElement(l_Focusable_0.Frame, {
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Size = UDim2.new(1, 0, 1, 0), 
            Visible = not l_isSceneFullView_0, 
            [v4.Ref] = not not l_itemDetailsPeekViewRefs_1 and l_itemDetailsPeekViewRefs_1[l_key_0] or nil, 
            restorePreviousChildFocus = true, 
            focusController = v141:getFocusController(), 
            defaultChild = not not l_mountAsFullView_0 and v141.contentFrameRef or v141.actionBarContainerRef, 
            inputBindings = {
                NavigateBack = v5.Input.onBegin(Enum.KeyCode.ButtonB, function()
                    v43.closeFocusedScreen(v141.props.navigation);
                end), 
                OpenItemPrompt = v5.Input.onBegin(Enum.KeyCode.ButtonX, function()
                    v141.props.openItemPrompt(v141.props.networking, v141.props.analytics, v141.props.overlayClosedCallback, v141.props.navigation, v141.props.avatarRoute);
                end, {
                    key = "Feature.Catalog.Action.Buy"
                }), 
                OpenClosePeekView = if v154 or v141.props.showFullWithNoPeekView then nil else v5.Input.onBegin(Enum.KeyCode.ButtonY, function()
                    if not v141.props.itemDetailsExpanded then
                        v141.setPeekViewState(l_PeekViewState_0.Full);
                        return ;
                    else
                        v141.setPeekViewState(l_PeekViewState_0.Brief);
                        v141:getFocusController().moveFocusTo(v141.actionBarContainerRef);
                        return ;
                    end;
                end, {
                    key = not v141.props.itemDetailsExpanded and "Feature.Catalog.Action.OpenDetails" or "Feature.Catalog.Action.CloseDetails"
                }), 
                OpenCatalogContextMenu = if v141.props.showFullWithNoPeekView then nil else v5.Input.onBegin(Enum.KeyCode.ButtonL3, function()
                    v141.props.navigation.navigate(v44.CatalogContextMenu, {
                        itemId = l_itemId_2, 
                        itemType = l_itemType_2, 
                        onOverlayClosed = v141.props.overlayClosedCallback, 
                        centered = l_fromProfile_1 or v150
                    });
                end, {
                    key = "Feature.Catalog.Action.ItemOptions"
                })
            }, 
            NextSelectionLeft = l_resultsListRef_1
        }, {
            GamepadFocusHandlerForPage = v4.createElement(v42, {
                focusController = v141:getFocusController()
            }), 
            ItemDetailsExposure = v4.createElement(v73, {
                ixpTest = v75.ItemDetailsPage
            }), 
            NavigationEventsLogger = v4.createElement(v35, {
                pageName = "ItemDetails:" .. l_key_0
            }), 
            BoundInputsUpdater = v4.createElement(v38), 
            ItemDetailsContent = v4.createElement(v141:getItemDetailsComponent(v154), {
                renderBottomBar = if not not v80() and v141.props.hideUnsupportedItemDetails then nil else v141.getRenderActionBarCallback(v142, v143, v161), 
                renderContent = if not not v80() and v141.props.hideUnsupportedItemDetails then v141.renderUnsupportedItemMessageCallback(v143) else v141.renderContentCallback, 
                renderTopBar = v141.getRenderTopBarCallback(v143), 
                isTryOnPage = v150, 
                peekViewState = v152, 
                setPeekViewState = v141.setPeekViewState, 
                focusController = v141:getFocusController(), 
                actionBarContainerRef = v141.actionBarContainerRef, 
                contentFrameRef = v141.contentFrameRef, 
                closeBriefView = v141.closeBriefView, 
                viewPosition = v157, 
                viewSize = v158, 
                briefViewHeight = v161, 
                showDropShadow = v156, 
                analytics = v141.props.analytics, 
                avatarRoute = v141.props.avatarRoute, 
                closeAllPeekViews = v141.props.closeAllPeekViews, 
                closeFocusedScreen = v141.props.closeFocusedScreen, 
                fromProfile = v141.props.fromProfile, 
                itemDetailsExpanded = v141.props.itemDetailsExpanded, 
                itemId = v141.props.itemId, 
                itemType = v141.props.itemType, 
                lastInputGroup = v141.props.lastInputGroup, 
                mountAnimation = v141.props.mountAnimation, 
                mountAsFullView = v141.props.mountAsFullView, 
                navigation = v141.props.navigation, 
                peekViewFullViewEnabled = v141.props.peekViewFullViewEnabled, 
                peekViewShowing = v141.props.peekViewShowing, 
                setItemDetailsExpanded = v141.props.setItemDetailsExpanded, 
                topBarHeight = v141.props.topBarHeight
            })
        });
    else
        return ;
    end;
end;
v83.getFocusController = function(v163)
    return v163.props.focusController;
end;
v83.didUpdate = function(v164, v165, _)
    local l_key_1 = v164.props.avatarRoute.current.key;
    local l_key_2 = v165.avatarRoute.current.key;
    local l_key_3 = v164.props.navigation.state.key;
    if v164.props.lastInputGroup == v19.InputType.Gamepad then
        if not ((not (v78 and l_key_1 == l_key_3) or v164.props.avatarRoute.isOverlayVisible) or not v165.avatarRoute.isOverlayVisible) then
            v164:getFocusController().captureFocus();
        end;
        if l_key_1 == l_key_3 and l_key_2 ~= l_key_3 then
            v61:debug("gamepad captureFocus: ItemDetails, current pageKey changed: {}", l_key_3);
            v164:getFocusController().captureFocus();
        end;
    end;
end;
v83.didMount = function(v170)
    local v171 = v43.isFirstItemDetailsPage(v170.props.navigation);
    if not (not (v170.props.lastInputGroup == v19.InputType.Gamepad) or v171) then
        v61:debug("gamepad captureFocus: ItemDetails, didMount");
        v170:getFocusController().captureFocus();
    end;
    if not (not v170.props.redeemQRCodeItem or not v77) then
        v170.props.redeemQRCodeItemPrompt(v170.props.networking, v170.props.analytics, v170.props.itemId, v170.props.itemType);
    end;
    if v170.props.showFullWithNoPeekView then
        v170.setPeekViewState(l_PeekViewState_0.Full);
    end;
    v170.isMounted = true;
end;
v83.willUnmount = function(v172)
    v172.isMounted = false;
    local v173 = not (v172.props.avatarRoute.current.name == v44.ItemDetails and v172.props.navigation.state.routeName == v44.ItemDetails);
    if not (not v43.isFirstItemDetailsPage(v172.props.navigation) or not v173) then
        v172.props.setItemDetailsPeekViewState(l_PeekViewState_0.Closed);
        if v172.props.onItemDetailsClosed ~= nil then
            v172.props.onItemDetailsClosed();
        end;
    end;
end;
v83 = l_RoactAppPolicy_0.connect(function(v174, _)
    return {
        peekViewFullViewEnabled = v174.getItemDetailsFullView(), 
        showPremiumContent = v174.getShowCatalogPremiumContent()
    };
end)((v45((v8.connect(function(v176, v177)
    local l_itemId_3 = v177.itemId;
    local l_itemType_3 = v177.itemType;
    local v180 = nil;
    local v181 = nil;
    if not v54 then
        v180 = v51(v176.AvatarExperience.Common, l_itemId_3, l_itemType_3);
    else
        v181 = v52(v176.AvatarExperience, l_itemId_3, l_itemType_3);
    end;
    local v182 = nil;
    if v80() then
        v182 = if not v54 then (v68.DEPRECATED_isUnlimitedCollectibleAsset(l_itemType_3, v180) or v68.DEPRECATED_isLimitedBundle(l_itemType_3, v180)) or v68.DEPRECATED_isUnlimitedCollectibleBundle(l_itemType_3, v180) else (v68.isUnlimitedCollectibleAsset(v181) or v68.isLimitedBundle(v181)) or v68.isUnlimitedCollectibleBundle(v181);
    end;
    local l_key_4 = v177.navigation.state.key;
    local l_avatarRoute_0 = v177.avatarRoute;
    return {
        isSceneFullView = v37.getIsSceneFullViewFromState(v176, l_avatarRoute_0), 
        DEPRECATED_itemData = v180, 
        itemInfo = v181, 
        wideMode = v176.FormFactor == l_FormFactor_0.WIDE, 
        peekViewShowing = l_avatarRoute_0.current.key == l_key_4, 
        topBarHeight = v37.getTopBarHeightAvatarScene(v176), 
        itemDetailsExpanded = v176.AvatarExperience.Common.ItemDetailsExpanded, 
        playerMembership = not not v176.Users[v176.LocalUserId] and v176.Users[v176.LocalUserId].membership or Enum.MembershipType.None, 
        itemDetailsTryOnViewState = v176.AvatarExperience.Common.ItemDetailsPeekView.tryOnViewState, 
        itemDetailsViewState = v176.AvatarExperience.Common.ItemDetailsPeekView.viewState, 
        screenSize = v176.ScreenSize, 
        globalGuiInset = v176.GlobalGuiInset, 
        isPortrait = v48(v176), 
        hideUnsupportedItemDetails = if not v80() then nil else v182
    };
end, function(v185)
    return {
        closeAllPeekViews = function(v186)
            v185(v49(v186));
        end, 
        closeFiltersAndItemDetails = function(v187)
            v185(v50(v187));
        end, 
        closeFocusedScreen = function(v188)
            v185(v33(v188));
        end, 
        setItemDetailsExpanded = function(v189)
            v185(v55(v189));
        end, 
        setCurrentToastMessage = function(v190)
            v185(v28(v190));
        end, 
        openItemPrompt = function(v191, v192, v193, v194, v195)
            v185(v62(v191, v192, v193, v194, v195));
        end, 
        redeemQRCodeItemPrompt = function(v196, v197, v198, v199)
            v185(v70(v196, v197, v198, v199));
        end, 
        setItemDetailsPeekViewState = function(v200)
            v185(v56(v200));
        end, 
        setItemTryOnPeekViewState = function(v201)
            v185(v71(v201));
        end
    };
end)((l_RoactServices_0.connect({
    networking = v16, 
    analytics = v66
})((v60(v83)))))))));
return function(v202)
    local l_current_0 = v6.useRef(v5.createFocusController()).current;
    if v202.focusController then
        l_current_0 = v202.focusController;
    end;
    local v204 = v64(l_current_0);
    return v4.createElement("Frame", {
        [v4.Ref] = v63({
            overlayClosedCallback = v204
        }), 
        BackgroundTransparency = 1, 
        Size = UDim2.fromScale(1, 1)
    }, {
        ItemDetails = v6.createElement(v83, (v10.Dictionary.join(v202, {
            focusController = l_current_0, 
            overlayClosedCallback = v204
        })))
    });
end;
