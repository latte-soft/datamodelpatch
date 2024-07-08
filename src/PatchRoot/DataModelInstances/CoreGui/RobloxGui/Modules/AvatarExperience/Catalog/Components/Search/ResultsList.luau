local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.RoactRodux);
local v5 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_Focusable_0 = v5.Focusable;
local v7 = require(l_CorePackages_0.UIBlox);
local v8 = require(l_CorePackages_0.Promise);
local l_Signal_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Signal;
local v10 = require(l_CorePackages_0.Packages.t);
local v11 = require(l_CorePackages_0.AvatarExperienceDeps);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v13 = require(l_CorePackages_0.Cryo);
local v14 = require(l_Modules_0.AvatarExperience.Common.Context.withAdaptiveScrolling);
local v15 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_RoactFitComponents_0 = v11.RoactFitComponents;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local l_EmptyState_0 = v7.App.Indicator.EmptyState;
local l_FitTextLabel_0 = l_RoactFitComponents_0.FitTextLabel;
local v21 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local v22 = require(l_Modules_0.LuaApp.Enum.RetrievalStatus);
local v23 = require(l_Modules_0.LuaApp.Experiment.RoactAppExperiment);
local v24 = require(l_Modules_0.LuaApp.Experiment.AppUserLayers);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local l_withStyle_0 = v7.Style.withStyle;
local l_ImageSetButton_0 = v7.Core.ImageSet.ImageSetButton;
local l_Images_0 = v7.App.ImageSet.Images;
local v29 = require(l_Modules_0.AvatarExperience.Common.Util.IXPUtils);
local l_withNavigation_0 = require(l_CorePackages_0.RoactNavigation).withNavigation;
local v31 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withAvatarRoute);
local v32 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarRoute);
local v33 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v34 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v35 = require(l_Modules_0.LuaApp.Constants);
local v36 = require(l_Modules_0.AvatarExperience.Common.Services.Analytics);
local v37 = require(l_Modules_0.AvatarExperience.Catalog.Services.Analytics);
local v38 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v39 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.ApiFetchCatalogSearch);
local v40 = require(l_Modules_0.LuaApp.Thunks.FetchDataWithErrorToasts);
local v41 = require(l_Modules_0.AvatarExperience.Catalog.Components.CatalogTopicBar);
local v42 = require(l_Modules_0.AvatarExperience.Catalog.Components.NavBar.CatalogNavigation);
local v43 = require(l_Modules_0.LuaApp.Components.SignalConnection);
local v44 = require(l_Modules_0.AvatarExperience.Common.Context.withNamedRefs);
local v45 = require(l_Modules_0.AvatarExperience.Common.Components.WidgetList);
local v46 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectIsFullView);
local v47 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local v48 = require(l_Modules_0.AvatarExperience.Flags.FStringAXImpressionsEventName);
local v49 = require(l_Modules_0.AvatarExperience.Flags.TopicsIXPTest);
local v50 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXWidgetListPerfRefactorEnabled);
local v51 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXWidgetListPerfRefactorEnabledIXP);
local v52 = require(l_Modules_0.AvatarExperience.Catalog.Components.Filters.FilterButtonLayout);
local v53 = require(l_Modules_0.AvatarExperience.Flags.GetAXWidgetSeeAllButton);
local v54 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetResultsListFocusedWidget);
local v55 = require(l_Modules_0.AvatarExperience.Catalog.Actions.ClearResultsListFocusedWidget);
local v56 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXItemCardRedesignIXPEnabled);
local v57 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXItemCardTallEnabled);
local v58 = game:DefineFastFlag("AXSeeAllCloseButtonPadding", false);
local v59 = require(l_Modules_0.AvatarExperience.Flags.FFlagEnableWidgetSeeAllButtonUseBackButton);
local v60 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXFixNoItemsFoundPadding);
local v61 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXSearchResultsCategories);
local v62 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXFixNoItemsFoundWidgetsResults);
local l_GetFFlagHideDraggerPeekView_0 = v15.GetFFlagHideDraggerPeekView;
local v64 = require(l_Modules_0.AvatarExperience.Common.Components.Impressions.ImpressionsReporter);
local v65 = not v58 and 15 or 16;
local v66 = l_Images_0["icons/navigation/close"];
local v67 = if not v59() then nil else l_Images_0["icons/navigation/pushBack"];
local v68 = v3.PureComponent:extend("ResultsList");
v68.defaultProps = {
    navBarSizeY = 0, 
    widgetListPerfRefactorEnabled = if not v51() then nil else false
};
v68.validateProps = v10.strictInterface({
    analyticsContext = v10.string, 
    layoutOrder = v10.optional(v10.number), 
    fromSearch = v10.boolean, 
    itemsHeader = v10.optional(v10.table), 
    frameRef = v10.optional(v10.table), 
    scrollingFrameRef = v10.optional(v10.table), 
    onRetry = v10.callback, 
    searchUuid = v10.string, 
    navBarSizeY = v10.optional(v10.number), 
    navBarRef = v10.optional(v10.table), 
    backToTopSignal = v10.optional(v10.table), 
    multiTryOnBottomBarRef = v10.optional(v10.table), 
    categoryInfo = if not v61() then nil else v10.optional(v10.table), 
    onCategoryOrSubcategoryChange = if not v61() then nil else v10.optional(v10.callback), 
    NextSelectionUp = v10.optional(v10.table), 
    NextSelectionRight = v10.optional(v10.table), 
    searchParameters = v10.optional(v10.table), 
    searchInCatalog = v10.optional(v10.table), 
    dataStatus = v10.string, 
    currentPage = v10.optional(v10.table), 
    tryOnItems = v10.optional(v10.table), 
    fullView = v10.optional(v10.userdata), 
    focusedWidget = v10.optional(v10.table), 
    hideTopBar = v10.optional(v10.boolean), 
    widgetRequestId = v10.optional(v10.string), 
    selectedCategoryIndex = if v56() or v57() then v10.optional(v10.number) else nil, 
    widgetDataStatus = if not v62() then nil else v10.optional(v10.string), 
    hasWidgets = if not v62() then nil else v10.boolean, 
    dispatchLoadMore = v10.callback, 
    dispatchSetResultsListFocusedWidget = v10.callback, 
    dispatchClearResultsListFocusedWidget = v10.callback, 
    catalogAnalytics = v10.table, 
    axAnalytics = v10.table, 
    avatarRoute = v32.Interface, 
    namedRefs = v10.table, 
    navigation = v10.table, 
    showTopicsInCategories = v10.optional(v10.boolean), 
    showTopicsInSearch = v10.optional(v10.boolean), 
    adaptiveScrolling = v10.optional(v10.any), 
    widgetListPerfRefactorEnabled = if not v51() then nil else v10.boolean, 
    enableSearchResultsCategories = if not v61() then nil else v10.optional(v10.boolean)
});
v68.init = function(v69)
    v69.state = {
        restorePreviousChildFocus = true, 
        numItemsPerRow = 0, 
        navBarSizeY = 0
    };
    v69.lastYPosition = 0;
    v69.scrollingFrameRef = v69.props.scrollingFrameRef or v3.createRef();
    v69.navBarRef = v3.createRef();
    v69.topPanelRef = v3.createRef();
    v69.gridRef = v3.createRef();
    v69.pillBarRef = v3.createRef();
    v69.emptyStateRef = v3.createRef();
    v69.widgetFlatListRef = if not not v61() and v69.props.enableSearchResultsCategories then v3.createRef() else nil;
    v69.itemDetailsPeekViewRefs = v5.createRefCache();
    v69.onNumItemsPerRowChanged = function(v70)
        v69:setState({
            numItemsPerRow = v70
        });
    end;
    v69.onNavBarSizeChanged = function(v71)
        if v71.Y ~= v69.state.navBarSizeY then
            v69:setState({
                navBarSizeY = v71.Y
            });
        end;
    end;
    v69.requestImpressionsSignal = l_Signal_0.new();
    v69.scrollBackToYPosSignal = if v50() or v69.props.widgetListPerfRefactorEnabled then nil else l_Signal_0.new();
    v69.recordCurrentScrollingFrameYPositionSignal = if v50() or v69.props.widgetListPerfRefactorEnabled then nil else l_Signal_0.new();
    v69.onItemsListScroll = function(v72)
        v69.requestImpressionsSignal:fire();
        local v73 = v69.props.adaptiveScrolling or {};
        if v73.onCanvasYChanged then
            v73.onCanvasYChanged(v72);
        end;
    end;
    v69.loadMore = function()
        if v69.props.dataStatus == v22.Fetching then
            v69.retryLoadMore = true;
            return v8.resolve("Currently fetching");
        else
            local l_catalogAnalytics_0 = v69.props.catalogAnalytics;
            local l_searchUuid_0 = v69.props.searchUuid;
            local l_searchInCatalog_0 = v69.props.searchInCatalog;
            local l_searchParameters_0 = v69.props.searchParameters;
            return v69.props.dispatchLoadMore(l_catalogAnalytics_0, l_searchInCatalog_0.keyword, l_searchUuid_0, not not l_searchParameters_0 and l_searchParameters_0.categoryInfo or nil);
        end;
    end;
    v69.onFocusGained = function()
        v69:setState({
            restorePreviousChildFocus = true
        });
    end;
    v69.scrollBackToTop = function()
        local l_current_0 = v69.props.scrollingFrameRef.current;
        if l_current_0 then
            l_current_0:ScrollToTop();
        end;
    end;
    v69.setFocusedWidget = (v50() or v69.props.widgetListPerfRefactorEnabled) and function(v79)
        v69.props.dispatchSetResultsListFocusedWidget(v69.props.searchUuid, v79.id, if not not v79 and v79.template then v79.template.title else nil or "", if not not v79 and v79.template then v79.template.description else nil or "");
    end or nil;
    v69.clearFocusedWidget = (v50() or v69.props.widgetListPerfRefactorEnabled) and function()
        v69.props.dispatchClearResultsListFocusedWidget(v69.props.searchUuid);
    end or nil;
end;
v68.getNextSelectionRight = function(v80, v81, v82)
    local l_NextSelectionRight_0 = v80.props.NextSelectionRight;
    if not (v81 == v21.ItemDetails) or not v82 then
        if v81 == v21.TryOnManager then
            return v80.props.namedRefs[v21.TryOnManager];
        else
            if not (not (not (not v80.props.tryOnItems or v13.isEmpty(v80.props.tryOnItems)) and v81 ~= v21.SortAndFilters) or not v80.props.multiTryOnBottomBarRef) and v80.props.multiTryOnBottomBarRef:getValue() ~= nil then
                l_NextSelectionRight_0 = v80.props.multiTryOnBottomBarRef;
            end;
            return l_NextSelectionRight_0;
        end;
    else
        return v80.itemDetailsPeekViewRefs[v82];
    end;
end;
v68.getSearchKeyword = function(v84)
    local l_navigation_0 = v84.props.navigation;
    if l_navigation_0.state.routeName == v21.CatalogSearch then
        return (l_navigation_0.getParam("searchParams") or {}).searchKeyword;
    else
        return nil;
    end;
end;
v68.shouldShowTopics = function(v86)
    local l_fromSearch_0 = v86.props.fromSearch;
    local l_searchParameters_1 = v86.props.searchParameters;
    return not not v86.props.showTopicsInSearch and l_fromSearch_0 or v86.props.showTopicsInCategories and (not not l_searchParameters_1 and l_searchParameters_1.categoryInfo or {}).ShowTopics;
end;
v68.renderTopPanel = function(v89, v90, _, v92, v93, v94)
    local l_fromSearch_1 = v89.props.fromSearch;
    local l_catalogAnalytics_1 = v89.props.catalogAnalytics;
    local l_axAnalytics_0 = v89.props.axAnalytics;
    local l_searchInCatalog_1 = v89.props.searchInCatalog;
    local v99 = not not l_searchInCatalog_1 and l_searchInCatalog_1.items or nil;
    local v100 = if not v93 then nil else v93.Font;
    local v101 = v89:shouldShowTopics();
    local v102 = v89:getSearchKeyword();
    local v103 = (not not v61() and v89.props.enableSearchResultsCategories) and true or not l_fromSearch_1;
    local l_l_fromSearch_1_0 = l_fromSearch_1;
    local l_hideTopBar_0 = v89.props.hideTopBar;
    local l_active_0 = v89.props.focusedWidget.active;
    if not (not v53() or not l_hideTopBar_0) then
        v103 = false;
        l_l_fromSearch_1_0 = false;
        v101 = false;
    end;
    local v107 = if not v103 then nil else v89.navBarRef;
    local v108 = nil;
    if v53() then
        v108 = v100.BaseSize * v100.Header1.RelativeSize;
    end;
    if l_GetFFlagHideDraggerPeekView_0() then
        v108 = v100.BaseSize * v100.Header2.RelativeSize;
    end;
    local v109 = v3.createElement(l_Focusable_0.Frame, {
        BackgroundTransparency = v90.BackgroundDefault.Transparency or 1, 
        BackgroundColor3 = v90.BackgroundDefault.Color, 
        BorderSizePixel = 0, 
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        restorePreviousChildFocus = v89.state.restorePreviousChildFocus, 
        ref = v89.topPanelRef, 
        defaultChild = if not v103 then v89.pillBarRef else v89.navBarRef, 
        NextSelectionDown = if not v92 then nil else v89.gridRef
    }, {
        ListLayout = v3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 0)
        }), 
        NavBar = if not v103 then nil else v3.createElement(v42, {
            analytics = l_catalogAnalytics_1, 
            axAnalytics = l_axAnalytics_0, 
            layoutOrderMain = 1, 
            layoutOrderSub = 2, 
            navHeightMain = v33.MainNavHeight, 
            navHeightSub = v33.SubNavHeight, 
            absoluteSizeChanged = v89.onNavBarSizeChanged, 
            navBarRef = v89.navBarRef, 
            NextSelectionDown = if not v101 then nil else v89.pillBarRef, 
            backToTopSignal = v89.props.backToTopSignal, 
            showingTopics = v101, 
            fromSearch = if not not v61() and v89.props.enableSearchResultsCategories then l_fromSearch_1 else nil, 
            onCategoryOrSubcategoryChange = if not not v61() and v89.props.enableSearchResultsCategories then v89.props.onCategoryOrSubcategoryChange else nil, 
            enableSearchResultsCategories = if not v61() then nil else v89.props.enableSearchResultsCategories
        }), 
        PillBar = if not v101 then if l_l_fromSearch_1_0 then v3.createElement(v52, {
            height = v33.PillBarHeight, 
            isContentEmpty = true, 
            layoutOrder = 3, 
            showFilterButton = true, 
            layoutRef = v89.pillBarRef, 
            NextSelectionUp = v107
        }) else nil else v3.createElement(v41, {
            layoutOrder = 3, 
            NextSelectionUp = v107, 
            frameRef = v89.pillBarRef, 
            items = v99, 
            searchKeyword = v102
        }), 
        FocusedWidgetBar = if not not v53() and l_active_0 then v3.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, v33.FocusedWidgetTitleHeight), 
            BackgroundTransparency = 1, 
            LayoutOrder = 1
        }, {
            UIPadding = if not v59() then nil else v3.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, v65)
            }), 
            UIListLayout = if not v59() then nil else v3.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                Padding = UDim.new(0, 8)
            }), 
            BackButton = if not v59() then nil else v3.createElement(l_ImageSetButton_0, {
                BackgroundTransparency = 1, 
                Size = UDim2.new(0, 36, 0, 36), 
                Image = v67, 
                ImageColor3 = v90.SystemPrimaryDefault.Color, 
                Visible = true, 
                LayoutOrder = 1, 
                [v3.Event.Activated] = function()
                    v89:clearFocusedWidget();
                end
            }), 
            Divider = if not v59() then nil else v3.createElement("Frame", {
                BackgroundColor3 = v90.Divider.Color, 
                BackgroundTransparency = v90.Divider.Transparency, 
                BorderSizePixel = 0, 
                LayoutOrder = 2, 
                Size = UDim2.new(0, 1, 0, 16)
            }), 
            Title = if not v94.focusedWidgetTitle then nil else v3.createElement("TextLabel", {
                AnchorPoint = if not v59() then Vector2.new(0, 0.5) else nil, 
                Position = if not v59() then UDim2.fromScale(0, 0.5) else nil, 
                Text = v94.focusedWidgetTitle, 
                Font = if not l_GetFFlagHideDraggerPeekView_0() then v100.Header1.Font else v100.Header2.Font, 
                TextSize = v108, 
                TextColor3 = v90.TextEmphasis.Color, 
                TextTransparency = v90.TextEmphasis.Transparency, 
                Size = UDim2.fromScale(1, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                BackgroundTransparency = 1, 
                LayoutOrder = if not v59() then nil else 3
            }, {
                Padding = v3.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, 10), 
                    PaddingLeft = UDim.new(0, if not v59() then v65 else 5), 
                    PaddingRight = UDim.new(0, v65), 
                    PaddingBottom = UDim.new(0, 10)
                })
            }), 
            CloseButton = if not v59() then v3.createElement(l_ImageSetButton_0, {
                AnchorPoint = Vector2.new(1, 0.5), 
                BackgroundTransparency = 1, 
                Position = UDim2.fromScale(1, 0.5), 
                Size = UDim2.new(0, 36, 0, 36), 
                Image = v66, 
                ImageColor3 = v90.SystemPrimaryDefault.Color, 
                Visible = true, 
                [v3.Event.Activated] = if v50() or v89.props.widgetListPerfRefactorEnabled then v89.clearFocusedWidget else function()
                    v89:clearFocusedWidget();
                end
            }) else nil, 
            Padding = v58 and v3.createElement("UIPadding", {
                PaddingRight = UDim.new(0, v65)
            })
        }) else nil
    });
    local v110 = 0;
    if v103 then
        v110 = v110 + v89.state.navBarSizeY;
    end;
    if not (not v101 and not l_l_fromSearch_1_0) then
        v110 = v110 + v33.PillBarHeight;
    end;
    if not (not v53() or not l_active_0) then
        v110 = v110 + v33.FocusedWidgetTitleHeight;
    end;
    return v109, v110;
end;
if not v50() then
    v68.setFocusedWidget = function(v111, v112)
        local v113 = if not not v112 and v112.template then v112.template.title else nil;
        local v114 = if not not v112 and v112.template then v112.template.description else nil;
        v111.recordCurrentScrollingFrameYPositionSignal:fire();
        v111.props.dispatchSetResultsListFocusedWidget(v111.props.searchUuid, v112.id, v113 or "", v114 or "");
    end;
    v68.clearFocusedWidget = function(v115)
        v115.props.dispatchClearResultsListFocusedWidget(v115.props.searchUuid);
    end;
end;
v68.renderResultsList = function(v116, v117, v118)
    local l_searchInCatalog_2 = v116.props.searchInCatalog;
    local l_dataStatus_0 = v116.props.dataStatus;
    local l_key_0 = v116.props.navigation.state.key;
    local l_avatarRoute_0 = v116.props.avatarRoute;
    local l_name_0 = l_avatarRoute_0.current.name;
    local l_key_1 = l_avatarRoute_0.current.key;
    local l_entries_0 = v116.state.entries;
    local v126 = l_entries_0 and #l_entries_0 ~= 0;
    local v127 = l_dataStatus_0 == v22.Done;
    local v128 = false;
    if l_dataStatus_0 == v22.Fetching then
        v128 = not v126;
    end;
    if v62() then
        local l_hasWidgets_0 = v116.props.hasWidgets;
        local l_widgetDataStatus_0 = v116.props.widgetDataStatus;
        v127 = v127 and (not l_widgetDataStatus_0 or l_widgetDataStatus_0 == v22.Done);
        local l_v128_0 = v128;
        if not l_v128_0 then
            l_v128_0 = false;
            if l_widgetDataStatus_0 == v22.Fetching then
                l_v128_0 = not l_hasWidgets_0;
            end;
        end;
        v128 = l_v128_0;
    end;
    local v132 = not not l_entries_0 and #l_entries_0 or v38.PageFetchLimit;
    local v133 = (not v127 or v126) or v116.props.hasWidgets;
    local v134 = v126 and (not not l_searchInCatalog_2 and l_searchInCatalog_2.hasMoreEntries or nil);
    local v135 = v126 and not v134;
    local l_Font_0 = v117.Font;
    local l_Font_1 = l_Font_0.Body.Font;
    local v138 = l_Font_0.BaseSize * l_Font_0.Body.RelativeSize;
    local l_Theme_0 = v117.Theme;
    local l_Color_0 = l_Theme_0.TextMuted.Color;
    local l_Transparency_0 = l_Theme_0.TextMuted.Transparency;
    local v142 = false;
    if l_name_0 ~= v21.ItemDetails then
        v142 = v118 ~= nil;
    end;
    local v143 = nil;
    local v144 = v35.ImpressionsEvents.AvatarItems .. (not l_key_0 and "" or string.gsub(l_key_0, "[-{}]", ""));
    local v145 = not v133;
    if v62() then
        v145 = v145 and not v116.props.hasWidgets;
    end;
    local l_active_1 = v116.props.focusedWidget.active;
    local l_title_0 = v116.props.focusedWidget.title;
    local l_id_0 = v116.props.focusedWidget.id;
    local v149 = if not not v53() and l_active_1 then l_title_0 else nil;
    return l_withLocalization_0({
        noItemsFound = "Feature.Catalog.Response.NoItemsFound", 
        focusedWidgetTitle = if v149 ~= "" then v149 else nil
    })(function(v150)
        local v151 = v116:getNextSelectionRight(l_name_0, l_key_1);
        v143 = v3.createElement(v64, {
            parentRef = v116.gridRef, 
            pageFilter = function()
                return l_key_0 == l_key_1;
            end, 
            onRequestImpressionsSignal = v116.requestImpressionsSignal, 
            eventContext = v48(), 
            eventName = "marketplaceOrganicFELog", 
            requestId = v116.props.widgetRequestId, 
            impressionsTag = v144, 
            impressionsSchema = "defaultItem"
        });
        local l_frameRef_0 = v116.props.frameRef;
        local l_backToTopSignal_0 = v116.props.backToTopSignal;
        local v154, v155 = v116:renderTopPanel(l_Theme_0, v128, v126, v117, v150);
        local v156 = v116.props.adaptiveScrolling or {};
        local v157 = 0;
        if v116.props.multiTryOnBottomBarRef then
            local v158 = v116.props.multiTryOnBottomBarRef:getValue();
            v157 = not v158 and 0 or v158.AbsoluteSize.Y;
        end;
        if v156.setTopAndBottomPanelHeights then
            v156.setTopAndBottomPanelHeights(v155, v157);
        end;
        return v3.createElement(l_Focusable_0.Frame, {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 1, 0), 
            ClipsDescendants = true, 
            LayoutOrder = v116.props.layoutOrder, 
            [v3.Ref] = l_frameRef_0, 
            defaultChild = v116.topPanelRef, 
            NextSelectionUp = v116.props.NextSelectionUp, 
            restorePreviousChildFocus = v116.state.restorePreviousChildFocus, 
            inputBindings = not not v142 and {
                NavUp = v5.Input.onBegin(Enum.KeyCode.ButtonB, function()
                    v118.moveFocusTo(v116.props.NextSelectionUp);
                end)
            } or nil
        }, {
            BackToTopSignal = if not l_backToTopSignal_0 then nil else v3.createElement(v43, {
                signal = l_backToTopSignal_0, 
                callback = v116.scrollBackToTop
            }), 
            ScrollPanel = v3.createElement(l_Focusable_0.Frame, {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 1, 0), 
                ClipsDescendants = true
            }, {
                TopPanel = v3.createElement(l_Focusable_0.Frame, {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 0, v155), 
                    ZIndex = 2, 
                    ref = v116.props.namedRefs[v116.props.navigation.state.routeName .. "TopPanel"]
                }, v154), 
                ListFrame = v3.createElement("Frame", {
                    Size = UDim2.new(1, 0, 1, -v155), 
                    Position = UDim2.fromOffset(0, v155), 
                    BackgroundTransparency = 1
                }, {
                    WidgetList = v3.createElement(if v50() or v116.props.widgetListPerfRefactorEnabled then v45.WidgetList else v45.WidgetListDeprecated, {
                        entries = l_entries_0, 
                        fromSearch = v116.props.fromSearch, 
                        bottomBarHeight = v157, 
                        showingEntries = v133, 
                        searchUuid = v116.props.searchUuid, 
                        loadMore = not not v134 and v116.loadMore or nil, 
                        hasMoreRows = v134, 
                        createEndOfScrollElement = v135, 
                        itemDetailsPeekViewRefs = v116.itemDetailsPeekViewRefs, 
                        gridRef = v116.gridRef, 
                        flatListRef = if (not not v61() and v116.props.enableSearchResultsCategories) and (v50() or v116.props.widgetListPerfRefactorEnabled) then v116.widgetFlatListRef else nil, 
                        scrollToYPosSignal = if v50() or v116.props.widgetListPerfRefactorEnabled then nil else v116.scrollBackToYPosSignal, 
                        recordCurrentScrollingFrameYPositionSignal = if v50() or v116.props.widgetListPerfRefactorEnabled then nil else v116.recordCurrentScrollingFrameYPositionSignal, 
                        recordCurrentScrollingFrameYPosition = if v50() or v116.props.widgetListPerfRefactorEnabled then nil else function(v159)
                            v116:setState({
                                scrollingFrameYPosition = v159
                            });
                        end, 
                        onScroll = v116.onItemsListScroll, 
                        focusedWidget = if not not v53() and l_active_1 then l_id_0 else nil, 
                        onWidgetFocusAcquired = if not v53() then nil else if v50() or v116.props.widgetListPerfRefactorEnabled then v116.setFocusedWidget else function(v160)
                            v116:setFocusedWidget(v160);
                        end, 
                        onWidgetFocusReleased = if not v53() then nil else if v50() or v116.props.widgetListPerfRefactorEnabled then v116.clearFocusedWidget else function()
                            v116:clearFocusedWidget();
                        end, 
                        requestImpressionsSignal = v116.requestImpressionsSignal, 
                        onNumItemsPerRowChanged = v116.onNumItemsPerRowChanged, 
                        NextSelectionRight = v151, 
                        NextSelectionUp = v116.topPanelRef, 
                        restorePreviousChildFocus = v116.state.restorePreviousChildFocus, 
                        onFocusGained = not v116.state.restorePreviousChildFocus and v116.onFocusGained or nil, 
                        numItemsExpected = v132, 
                        scrollingEnabled = v156.scrollingEnabled, 
                        selectedCategoryIndex = if v56() or v57() then v116.props.selectedCategoryIndex else nil, 
                        enableSearchResultsCategories = if not v61() then nil else v116.props.enableSearchResultsCategories
                    }), 
                    NoItemsFound = v145 and v3.createElement(l_FitTextLabel_0, {
                        width = UDim.new(1, 0), 
                        AnchorPoint = Vector2.new(0.5, 0.5), 
                        BackgroundTransparency = 1, 
                        Position = UDim2.new(0.5, 0, 0, not v60() and 10 or v117.Tokens.Global.Space_400), 
                        Text = v150.noItemsFound, 
                        TextSize = v138, 
                        TextColor3 = l_Color_0, 
                        TextTransparency = l_Transparency_0, 
                        Font = l_Font_1
                    })
                })
            }), 
            ImpressionsReporter = v143
        });
    end);
end;
v68.render = function(v161)
    local v162 = v161.props.dataStatus == v22.Failed;
    local l_entries_1 = v161.state.entries;
    if not (v162 and not (l_entries_1 and #l_entries_1 ~= 0)) then
        return l_withStyle_0(function(v164)
            return v5.withFocusController(function(v165)
                return v161:renderResultsList(v164, v165);
            end);
        end);
    else
        return l_withLocalization_0({
            emptyText = "Feature.EmptyStatePage.Message.NoInternet"
        })(function(v166)
            return v3.createElement("Frame", {
                LayoutOrder = v161.props.layoutOrder, 
                Size = UDim2.fromScale(1, 1), 
                BackgroundTransparency = 1
            }, {
                EmptyState = v3.createElement(l_EmptyState_0, {
                    onActivated = v161.props.onRetry, 
                    text = v166.emptyText, 
                    [v3.Ref] = v161.emptyStateRef
                })
            });
        end);
    end;
end;
v68.updateItems = function(v167, v168)
    local l_searchInCatalog_3 = v167.props.searchInCatalog;
    local v170 = not not l_searchInCatalog_3 and l_searchInCatalog_3.items or nil;
    if v170 then
        local l_tryOnItems_0 = v167.props.tryOnItems;
        if not v168 or v13.isEmpty(l_tryOnItems_0) then
            v167:setState({
                entries = v170
            });
            return ;
        else
            local v172 = not not v167.props.searchParameters and v167.props.searchParameters.categoryInfo or {};
            local v173 = {};
            local v174 = 0;
            if v172.AssetTypeIdStrings then
                for _, v176 in v172.AssetTypeIdStrings, nil, nil do
                    v173 = v13.Dictionary.join(v173, {
                        [v176] = v33.ItemType.Asset
                    });
                end;
                v174 = v174 + #v172.AssetTypeIdStrings;
            end;
            if v172.BundleTypes then
                for _, v178 in v172.BundleTypes, nil, nil do
                    v173 = v13.Dictionary.join(v173, {
                        [v178] = v33.ItemType.Bundle
                    });
                end;
                v174 = v174 + #v172.BundleTypes;
            end;
            local v179 = table.create(#v170);
            if v174 > 0 then
                for v180, v181 in l_tryOnItems_0, nil, nil do
                    if v181.itemSubType and v173[v181.itemSubType] == v181.itemType then
                        table.insert(v179, {
                            id = tostring(v180), 
                            type = tostring(v181.itemType), 
                            encryptedAdTrackingData = nil
                        });
                    end;
                end;
            end;
            for _, v183 in v170, nil, nil do
                if not l_tryOnItems_0[v183.id] then
                    table.insert(v179, v183);
                end;
            end;
            v167:setState({
                entries = v179
            });
            return ;
        end;
    else
        v167:setState({
            entries = v3.None
        });
        return ;
    end;
end;
v68.didMount = function(v184)
    v184:updateItems(true);
end;
v68.didUpdate = function(v185, v186, v187)
    local v188 = v185.props.searchUuid ~= v186.searchUuid;
    if not ((not v61() or not v185.props.enableSearchResultsCategories) or not v185.props.fromSearch) then
        v188 = (v188 or v186.categoryInfo ~= v185.props.categoryInfo) or not v185.props.searchInCatalog;
    end;
    if v188 then
        v185:setState({
            restorePreviousChildFocus = false
        });
    end;
    if v188 or v185.state.numItemsPerRow ~= v187.numItemsPerRow then
        v185.requestImpressionsSignal:fire();
    end;
    local v189 = false;
    if v185.props.dataStatus == v22.Done then
        v189 = v186.dataStatus ~= v22.Done;
    end;
    if not (not v188 and not v189) then
        v185:updateItems(v188);
    end;
    if not (not (v185.props.dataStatus == v22.Done and v186.dataStatus == v22.Fetching) or not v185.retryLoadMore) then
        v185.retryLoadMore = false;
        v185.loadMore();
    end;
    if (not ((((v50() or v185.props.widgetListPerfRefactorEnabled) or v188) or not v186.focusedWidget.active) or v185.props.focusedWidget.active) and type(v185.state.scrollingFrameYPosition) == "number") and v33.ScrollYPositionDetectableEpsilon <= v185.state.scrollingFrameYPosition then
        v185.scrollBackToYPosSignal:fire(v185.state.scrollingFrameYPosition);
        return ;
    else
        if not ((not v61() or not v185.props.enableSearchResultsCategories) or not v188) then
            if (v50() or v185.props.widgetListPerfRefactorEnabled) or not v185.scrollBackToYPosSignal then
                if not (not v50() and not v185.props.widgetListPerfRefactorEnabled or not v185.widgetFlatListRef.current) then
                    v185.widgetFlatListRef.current:scrollToOffset({
                        offset = 0, 
                        animated = false
                    });
                end;
            else
                v185.scrollBackToYPosSignal:fire(2);
                return ;
            end;
        end;
        return ;
    end;
end;
v68 = v14((l_withNavigation_0((l_RoactServices_0.connect({
    axAnalytics = v36, 
    catalogAnalytics = v37
})((v29.connectTestVariables({
    showTopicsInSearch = v49.ShowInSearch, 
    showTopicsInCategories = v49.ShowInCategories
})((v44((v31((v4.connect(function(v190, v191)
    local l_searchUuid_1 = v191.searchUuid;
    local l_categoryInfo_0 = v191.categoryInfo;
    local v194 = v34.getSearchKey(v190, l_searchUuid_1);
    local v195 = false;
    local v196 = nil;
    if v62() then
        local l_fromSearch_2 = v191.fromSearch;
        if not (not l_searchUuid_1 or not l_fromSearch_2) then
            local v198 = v47.getQueryStringForSearchWidgets(v190.SearchesParameters[l_searchUuid_1]);
            local v199 = v190.AvatarExperience.Common.Widgets.SearchPageWidgetInfo[v198];
            if v199 then
                local l_Details_0 = v199.Details;
                local v201 = false;
                if typeof(l_Details_0) == "table" then
                    v201 = next(l_Details_0) ~= nil;
                end;
                v195 = v201;
                if not (not v61() or not v191.enableSearchResultsCategories) then
                    v195 = not not v195 and ((v13.isEmpty(l_categoryInfo_0) or l_categoryInfo_0.ShowWidgets) or false);
                end;
            end;
            v196 = l_PerformFetch_0.GetStatus(v190, (v47.getFetchWidgetInfoFetchKey(v198)));
        end;
    end;
    return {
        fullView = v46(v190, v21.Catalog), 
        searchParameters = v190.SearchesParameters[v191.searchUuid], 
        selectedCategoryIndex = if v56() or v57() then v190.AvatarExperience.Catalog.Categories.category else nil, 
        searchInCatalog = v190.Search.SearchesInCatalog[v191.searchUuid], 
        dataStatus = l_PerformFetch_0.GetStatus(v190, v194), 
        tryOnItems = v190.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems, 
        focusedWidget = not not v190.AvatarExperience.Catalog.ResultsList[v191.searchUuid] and v190.AvatarExperience.Catalog.ResultsList[v191.searchUuid].focusedWidget or {}, 
        hideTopBar = not not v190.AvatarExperience.Catalog.ResultsList[v191.searchUuid] and (v190.AvatarExperience.Catalog.ResultsList[v191.searchUuid].hideTopBar or false), 
        widgetRequestId = v190.AvatarExperience.Common.Widgets.WidgetInfo.RequestId, 
        widgetDataStatus = if not v62() then nil else v196, 
        hasWidgets = if not v62() then nil else v195
    };
end, function(v202)
    return {
        dispatchLoadMore = function(_, v204, v205, v206)
            return v202(v40(v39({
                searchKeyword = v204, 
                searchUuid = v205, 
                categoryInfo = v206
            })));
        end, 
        dispatchSetResultsListFocusedWidget = function(v207, v208, v209, v210)
            return v202(v54(v207, v208, v209, v210));
        end, 
        dispatchClearResultsListFocusedWidget = function(v211)
            return v202(v55(v211));
        end
    };
end)(v68)))))))))))));
if v51() then
    v68 = v23.connectUserLayer({
        v24.PlatformExcellenceQualityImprovementAvatarMarketplace
    }, function(v212, _)
        local v214 = v212[v24.PlatformExcellenceQualityImprovementAvatarMarketplace];
        return {
            widgetListPerfRefactorEnabled = v214 and v214.widgetListPerfRefactorEnabled
        };
    end)(v68);
end;
return v68;
