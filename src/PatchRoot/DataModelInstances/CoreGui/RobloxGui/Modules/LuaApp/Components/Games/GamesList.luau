local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
local l_TweenService_0 = game:GetService("TweenService");
local v4 = require(l_CorePackages_0.Packages.t);
local l_Signal_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Signal;
local v6 = require(l_Modules_0.Common.Roact);
local v7 = require(l_Modules_0.Common.RoactRodux);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v9 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags);
local v10 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local l_RoactAnalyticsCommonGameEvents_0 = v9.RoactAnalyticsCommonGameEvents;
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local v13 = require(l_Modules_0.LuaApp.Services.AppEventIngestService);
local v14 = require(l_Modules_0.LuaApp.Experiment.RoactAppExperiment);
local v15 = require(l_CorePackages_0.Packages.React);
local v16 = require(l_CorePackages_0.UIBlox);
local v17 = require(l_CorePackages_0.Cryo);
local l_withStyle_0 = v16.Style.withStyle;
local l_TooltipOrientation_0 = v16.App.Dialog.Enum.TooltipOrientation;
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local l_GetFFlagEnableAppCommonInputHooks_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableAppCommonInputHooks;
local v24 = nil;
v24 = if not l_GetFFlagEnableAppCommonInputHooks_0() then require(l_CorePackages_0.Packages.ReactFocusNavigation).useLastInputMode else require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils).useLastInputMode;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local v26 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local v27 = require(l_Modules_0.LuaApp.Constants);
local v28 = require(l_Modules_0.LuaApp.Experiment.AppUserLayers);
local v29 = require(l_Modules_0.LuaApp.FitChildren);
local v30 = require(l_Modules_0.LuaApp.Components.FitTextLabel);
local v31 = require(l_Modules_0.LuaApp.Components.Games.GamesDropDownList);
local v32 = require(l_Modules_0.LuaApp.Components.Games.GameCategoryTabGroup);
local v33 = require(l_Modules_0.LuaApp.Components.Games.GameGridSelector);
local v34 = require(l_Modules_0.LuaApp.Components.RefreshScrollingFrameWithLoadMore);
local v35 = require(l_Modules_0.LuaApp.Thunks.Games.ApiFetchGamesData);
local v36 = require(l_Modules_0.LuaApp.Thunks.Games.ApiFetchGamesInSort);
local v37 = require(l_Modules_0.LuaApp.Thunks.Omni.ApiFetchOmniRecommendations);
local v38 = require(l_Modules_0.LuaApp.Thunks.Omni.ApiFetchOmniRecommendationsMetadata);
local v39 = require(l_Modules_0.LuaApp.Thunks.FetchDataWithErrorToasts);
local v40 = require(l_Modules_0.LuaApp.Thunks.RefreshGameSorts);
local v41 = require(l_Modules_0.LuaApp.Thunks.Games.RefreshExpiringSortTokens);
local v42 = require(l_Modules_0.LuaApp.Actions.RefreshSiteAlertInfo);
local v43 = require(l_Modules_0.Personalization.PersonalizationTopBar);
local v44 = require(l_Modules_0.Personalization.Games.GameSeeAllImpressionsDetector);
local v45 = require(l_Modules_0.Personalization.Games.SendGameImpressions);
local v46 = require(l_Modules_0.LuaApp.Analytics.Events.Games.gamePlayIntent);
local l_AppOmniRecommendationsRequest_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppOmniRecommendationsRequest;
local v48 = require(l_Modules_0.Personalization.OmniFeed.OmniFeedConstants);
local l_useUiModeInfo_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useUiModeInfo;
local l_UiMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).UiMode;
local l_useDeviceType_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useDeviceType;
local l_useNavigationProps_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppNavigation).useNavigationProps;
local l_IconWithTooltip_0 = require(l_CorePackages_0.Workspace.Packages.AppBlox).IconWithTooltip;
local v54 = require(l_Modules_0.LuaApp.Thunks.Games.OpenInfoPeekView);
local v55 = require(l_Modules_0.Personalization.Games.ChartsPageExperimentation);
local v56 = require(l_Modules_0.LuaApp.AppPage);
local v57 = require(l_Modules_0.LuaApp.Flags.LuaAppGameTileConfig);
local l_GetFFlagTenFootUiSeeAll_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagTenFootUiSeeAll;
local l_GetFFlagTenFootUiScrollBackFix_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagTenFootUiScrollBackFix;
local l_GetFFlagTenFootUiCategoryTabSafeArea_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagTenFootUiCategoryTabSafeArea;
local v61 = require(l_Modules_0.Personalization.Flags.GetFFlagExploreApiSortsEnabledIXP);
local v62 = require(l_Modules_0.Personalization.Flags.GetFFlagExploreApiSortsEnabledByDefault);
local l_GetFFlagGamesListBackgroundFix_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagGamesListBackgroundFix;
local l_IsPrefetchOneCopyEnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).IsPrefetchOneCopyEnabled;
local v65 = game:DefineFastFlag("LuaAppExploreApiRefreshFix", false);
local v66 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableSponsoredAdsSeeAllGamesListTooltip);
local v67 = require(l_Modules_0.Personalization.Flags.GetFFlagLuaAppExploreSortsConfigurableIXPLayer);
local v68 = require(l_Modules_0.Personalization.Flags.FStringLuaAppExploreApiSortsMigrationLayer);
local v69 = require(l_Modules_0.LuaApp.Flags.FFlagLuaAppSingleHeaderBar);
local v70 = require(l_Modules_0.Personalization.Flags.FFlagLuaAppChartsPageRename);
local v71 = require(l_Modules_0.Personalization.Flags.FFlagLuaAppChartsPageRenameIXP);
local l_GAME_GRID_PADDING_0 = v27.GAME_GRID_PADDING;
local l_SECTION_HEADER_HEIGHT_0 = v27.SECTION_HEADER_HEIGHT;
local v74 = {
    OMNI_HOME = {
        sortType = v27.OmniRecommendationsPageType.PAGE_TYPE_HOME, 
        isOmni = true
    }, 
    GAMES = {
        sortType = v27.GameSortGroups.Games, 
        isOmni = false
    }
};
local v75 = {
    OMNI_HOME = {
        sortType = v27.OmniRecommendationsPageType.PAGE_TYPE_HOME, 
        isOmni = true
    }, 
    GAMES = {
        sortType = v27.GameSortGroups.GamesList, 
        isOmni = false
    }
};
local v76 = {
    Dropdown = "Dropdown", 
    Tabs = "Tabs"
};
local v77 = v6.PureComponent:extend("GamesList");
v77.validateProps = v4.strictInterface({
    sortPageId = v4.optional(v4.string), 
    isOmni = v4.optional(v4.boolean), 
    initialSortIndex = v4.optional(v4.number), 
    initialSortName = v4.optional(v4.string), 
    pageContext = v4.string, 
    topBarHeight = if not v69 then v4.number else nil, 
    screenSize = v4.Vector2, 
    omniRecommendationsSorts = v4.table, 
    gameSorts = v4.table, 
    gameSortContents = v4.table, 
    sponsoredTooltipTitle = v4.string, 
    sponsoredTooltipBody = v4.string, 
    dispatchRefresh = v4.callback, 
    dispatchRefreshOmni = v4.callback, 
    dispatchRefreshSortContents = v4.callback, 
    dispatchLoadMoreGames = v4.callback, 
    dispatchLoadMoreGamesOmni = v4.callback, 
    dispatchFetchExpiringTokens = v4.callback, 
    onActivateTooltip = v4.callback, 
    useCreationCenterTitle = v4.optional(v4.boolean), 
    useCategoryScrollList = if not l_GetFFlagTenFootUiSeeAll_0() then nil else v4.optional(v4.boolean), 
    onBackToTop = if not l_GetFFlagTenFootUiScrollBackFix_0() then nil else v4.optional(v4.callback), 
    deviceType = if not v66() then nil else v4.string, 
    safeAreaPadding = if not l_GetFFlagTenFootUiCategoryTabSafeArea_0() then nil else v4.optional(v4.number), 
    categorySelectorHeight = if not l_GetFFlagTenFootUiSeeAll_0() then nil else v4.optional(v4.number), 
    topBarCategoriesScrollerPadding = if not l_GetFFlagTenFootUiSeeAll_0() then nil else v4.optional(v4.number), 
    topBarCategoriesScrollerHeight = if not l_GetFFlagTenFootUiSeeAll_0() then nil else v4.optional(v4.number), 
    backgroundTransparency = if not l_GetFFlagGamesListBackgroundFix_0() then nil else v4.optional(v4.number), 
    hasTopBar = if not v69 then if l_GetFFlagTenFootUiSeeAll_0() then v4.boolean else nil else nil, 
    hideGameStatsIXP = v4.optional(v4.boolean), 
    areExploreApiSortsEnabledByIxp = if not v61() then nil else v4.optional(v4.boolean), 
    navigation = v4.optional(v4.table), 
    screenProps = v4.optional(v4.table), 
    networking = v4.callback, 
    eventIngest = v4.table, 
    analytics = v4.table, 
    appAnalytics = v4.table, 
    omniRecommendationsRequest = if not l_IsPrefetchOneCopyEnabled_0() then nil else v4.callback
});
v77.init = function(v78)
    v78.isOmni = function()
        return v78.state.selectedOmni;
    end;
    v78.gamesListViewChangedSignal = l_Signal_0.new();
    v78.containerRef = v6.createRef();
    local l_screenSize_0 = v78.props.screenSize;
    v78:setState({
        sortIndex = if not v78.props.isOmni then nil else v78.props.initialSortIndex, 
        sortName = v78.props.initialSortName, 
        selectedOmni = v78.props.isOmni, 
        contentSize = Vector2.new(l_screenSize_0.X - 2 * v27.GetPageSideMargin(l_screenSize_0.X), l_screenSize_0.Y), 
        frameSize = l_screenSize_0
    });
    v78.getSelectedSort = function()
        if not v78.isOmni() then
            return v78.props.gameSorts[v78.state.sortName] or {};
        else
            local l_sortType_0 = v74.OMNI_HOME.sortType;
            if v78.props.omniRecommendationsSorts[l_sortType_0] then
                return v78.props.omniRecommendationsSorts[l_sortType_0][v78.state.sortIndex] or {};
            else
                return {};
            end;
        end;
    end;
    v78.getSelectedSortContents = function()
        return v78.props.gameSortContents[v78.state.sortName];
    end;
    v78.getSelectedSortIdentifier = function()
        local v81 = v78.getSelectedSort();
        if not v78.isOmni() then
            return v81.name;
        else
            return v81.topicId;
        end;
    end;
    v78.isSponsoredSort = function()
        local v82 = v78.getSelectedSort();
        if not v78.isOmni() then
            if v82 and v82.gameSetTypeId == "27" then
                return true;
            end;
        elseif v82 and v82.topicId == v48.GameGridTopicIds.Sponsored then
            return true;
        end;
        return false;
    end;
    v78.refresh = function()
        local v83 = if v62() or v78.props.areExploreApiSortsEnabledByIxp then v75 else v74;
        return not not v78.isOmni() and v78.props.dispatchRefreshOmni(v78.props.networking, v78.props.omniRecommendationsRequest, v83.OMNI_HOME.sortType, v48.OmniRecommendationsRequestIntent.ManualRefresh) or v78.props.dispatchRefresh(v78.props.networking, v78.state.sortName, v83.GAMES.sortType, v78.props.areExploreApiSortsEnabledByIxp);
    end;
    v78.loadMoreGames = function(v84)
        local v85 = v84 or v27.DEFAULT_GAME_FETCH_COUNT;
        local l_dispatchLoadMoreGames_0 = v78.props.dispatchLoadMoreGames;
        local l_networking_0 = v78.props.networking;
        local v88 = v78.getSelectedSort();
        local v89 = v78.getSelectedSortContents();
        if not v78.isOmni() then
            if not v89 then
                return ;
            else
                return l_dispatchLoadMoreGames_0(l_networking_0, v88, v89.rowsRequested, v85, v89.nextPageExclusiveStartId, v89.nextPageToken);
            end;
        else
            return v78.props.dispatchLoadMoreGamesOmni(l_networking_0, v74.OMNI_HOME.sortType, v78.state.sortIndex, v85);
        end;
    end;
    v78.switchToSort = function(v90, v91, v92)
        if v78.isMounted then
            if v90.topicId ~= nil then
                v78.props.analytics.reportFilterChangeWithId(v90.topicId, nil, v92);
                v78:setState({
                    sortIndex = v91, 
                    selectedOmni = true, 
                    sortName = tostring(v90.topicId)
                });
            else
                v78.props.analytics.reportFilterChangeWithId(v90.gameSetTypeId, v90.gameSetTargetId, v92);
                v78:setState({
                    sortName = v90.name, 
                    selectedOmni = false
                });
            end;
            spawn(function()
                if v78.isMounted then
                    v78:setState({
                        forceRender = nil
                    });
                end;
            end);
            return ;
        else
            return ;
        end;
    end;
    v78.reportGameDetailOpened = function(v93)
        local v94 = v78.getSelectedSortIdentifier();
        local v95 = v78.getSelectedSort();
        local l_analytics_0 = v78.props.analytics;
        local v97 = nil;
        local v98 = v78.getSelectedSortContents();
        v97 = not not v98 and v98.entries or nil;
        if v97 then
            if not v78.isOmni() then
                v94 = v95 and v95.gameSetTypeId;
            end;
            local v99 = #v97;
            local v100 = v97[v93];
            l_analytics_0.reportOpenGameDetailWithId(v100.placeId, v94, v95 and v95.gameSetTargetId, nil, v93, v99, v100.isSponsored, v100.universeId, v78.props.pageContext);
            return ;
        else
            return ;
        end;
    end;
    v78.sendGameImpressions = function(v101)
        local v102 = v78.getSelectedSortContents();
        if v102 then
            local v103 = v78.getSelectedSort();
            if v103 then
                local v104 = nil;
                local v105 = nil;
                local v106 = nil;
                if not v78.isOmni() then
                    v104 = v103.gameSetTypeId;
                    v105 = v103.gameSetTargetId;
                    v106 = v78.props.sortPageId;
                else
                    v104 = v103.topicId;
                end;
                v45.sendFromSeeAll(v78.props.eventIngest, v78.props.appAnalytics, v101, v102.entries, v78.props.pageContext, v104, v105, v106);
                return ;
            else
                return ;
            end;
        else
            return ;
        end;
    end;
    v78.onAbsoluteContentSizeChanged = function(v107)
        if not (not v78.isMounted or not v107) then
            local l_AbsoluteContentSize_0 = v107.AbsoluteContentSize;
            if v78.state.contentSize == l_AbsoluteContentSize_0 then
                return ;
            elseif l_AbsoluteContentSize_0.X > 0 and l_AbsoluteContentSize_0.Y > 0 then
                v78:setState({
                    contentSize = l_AbsoluteContentSize_0
                });
            end;
        end;
    end;
    v78.updateGamesInSort = function()
        v78.props.dispatchFetchExpiringTokens(v78.props.networking, (if v62() or v78.props.areExploreApiSortsEnabledByIxp then v75 else v74).GAMES.sortType, v78.props.areExploreApiSortsEnabledByIxp);
        local v109 = v78.getSelectedSortContents();
        local v110 = (not not v109 and v109.entries) and #v109.entries or nil;
        if v110 ~= nil and v110 == 0 then
            if not v78.isOmni() then
                v78.props.dispatchRefreshSortContents(v78.props.networking, v78.state.sortName);
            else
                v78.loadMoreGames():catch(function()
                    warn("Failed to load omni games");
                end);
                return ;
            end;
        end;
    end;
    v78.reportExperienceLaunched = function(v111, v112)
        local v113 = v78.getSelectedSort();
        v46(v78.props.eventIngest, v27.AnalyticsContext.ExperienceTile, {
            placeId = v111.placeId, 
            rootPlaceId = tonumber(v111.placeId), 
            sortIndex = tostring(v78.state.sortIndex), 
            sortEntryIndex = tostring(v111.index), 
            referralSource = v112, 
            gameSetTypeId = if not v78.isOmni() then v113.gameSetTypeId else v113.topicId, 
            gameSetTargetId = if not v78.isOmni() then v113.gameSetTargetId else nil
        });
    end;
    v78.onActivateTooltip = function()
        if not (not v78.isMounted or not v78.isSponsoredSort()) then
            v78.props.onActivateTooltip(v78.props.sponsoredTooltipTitle, v78.props.sponsoredTooltipBody);
        end;
    end;
end;
v77.renderWithLocalized = function(v114, v115)
    local v116 = if not v69 then v114.props.topBarHeight else 0;
    local v117 = v114.getSelectedSortIdentifier();
    local l_screenSize_1 = v114.props.screenSize;
    local l_frameSize_0 = v114.state.frameSize;
    local l_contentSize_0 = v114.state.contentSize;
    local v121 = v114.getSelectedSort();
    local v122 = v114.getSelectedSortContents();
    local l_useCreationCenterTitle_0 = v114.props.useCreationCenterTitle;
    local v124 = v27.GetPageSideMargin(l_screenSize_1.X);
    local v125 = v57.shouldHideGameStats(v114.props.pageContext, v114.props.hideGameStatsIXP);
    local v126 = if not not l_GetFFlagTenFootUiSeeAll_0() and v114.props.useCategoryScrollList then v76.Tabs else v76.Dropdown;
    if v117 then
        if v122 then
            local v127 = nil;
            if not v69 then
                if not l_useCreationCenterTitle_0 then
                    if not (not (v70 and v114.props.pageContext == v56.Games) or v71 and not v55.getIsChartsPageRenameEnabled()) then
                        v127 = v115.chartsTitle;
                    end;
                else
                    v127 = v115.creationCenter;
                end;
            end;
            local v128 = 38;
            local v129 = 12;
            local v130 = ((v128 + v129) + l_SECTION_HEADER_HEIGHT_0) + 14;
            if v126 == v76.Tabs then
                v128 = 0;
                v129 = 0;
                v116 = v114.props.topBarCategoriesScrollerHeight;
            end;
            local v131 = if v62() or v114.props.areExploreApiSortsEnabledByIxp then v75 else v74;
            local v132 = false;
            local v133 = nil;
            v132 = v114.isSponsoredSort();
            v133 = v114.props.sponsoredTooltipBody;
            return l_withStyle_0(function(v134)
                return v6.createElement("Frame", {
                    Size = UDim2.new(1, 0, 1, 0), 
                    BackgroundTransparency = if not l_GetFFlagGamesListBackgroundFix_0() then nil else v114.props.backgroundTransparency, 
                    BorderSizePixel = 0
                }, {
                    TopBar = if not v69 then if l_GetFFlagTenFootUiSeeAll_0() then if v114.props.hasTopBar then v6.createElement(v43, {
                        titleText = v127
                    }) else nil else v6.createElement(v43, {
                        titleText = v127
                    }) else nil, 
                    CategorySelectorScrollWrapper = if v126 == v76.Tabs then v6.createElement("Frame", {
                        Size = UDim2.new(1, 0, 0, v114.props.categorySelectorHeight), 
                        ZIndex = 2, 
                        BackgroundColor3 = v134.Theme.BackgroundDefault.Color, 
                        BackgroundTransparency = if not l_GetFFlagGamesListBackgroundFix_0() then v134.Theme.BackgroundDefault.Transparency else v114.props.backgroundTransparency, 
                        Position = UDim2.fromOffset(0, v114.props.topBarCategoriesScrollerPadding)
                    }, {
                        Padding = if not l_GetFFlagTenFootUiCategoryTabSafeArea_0() then nil else v6.createElement("UIPadding", {
                            PaddingRight = UDim.new(0, v114.props.safeAreaPadding), 
                            PaddingLeft = UDim.new(0, v114.props.safeAreaPadding)
                        }), 
                        GameCategoryTabGroup = v6.createElement(v32, {
                            size = UDim2.new(1, 0, 0, v114.props.categorySelectorHeight), 
                            sortCategories = v131, 
                            selectedSortIndex = v114.state.sortIndex, 
                            selectedSortName = v117, 
                            onSelected = v114.switchToSort
                        })
                    }) else nil, 
                    Scroller = v6.createElement(v34, {
                        Position = UDim2.new(0, 0, 0, v116), 
                        Size = UDim2.new(1, 0, 1, -v116), 
                        BackgroundTransparency = if not l_GetFFlagGamesListBackgroundFix_0() then nil else v114.props.backgroundTransparency, 
                        CanvasSize = UDim2.new(1, 0, 0, 0), 
                        refresh = v114.refresh, 
                        onLoadMore = v122.hasMoreRows and v114.loadMoreGames, 
                        onBackToTop = not not l_GetFFlagTenFootUiScrollBackFix_0() and v114.props.onBackToTop or nil, 
                        createEndOfScrollElement = not v122.hasMoreRows, 
                        onAbsoluteSizeChangedCallback = function(v135)
                            if not (not v114.isMounted or not v135) then
                                v114:setState({
                                    frameSize = v135.AbsoluteSize
                                });
                            end;
                        end, 
                        onCanvasPositionChangedCallback = function()
                            v114.gamesListViewChangedSignal:fire();
                        end, 
                        [v6.Ref] = v114.containerRef
                    }, {
                        Layout = v6.createElement("UIListLayout", {
                            FillDirection = Enum.FillDirection.Vertical, 
                            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                            SortOrder = Enum.SortOrder.LayoutOrder, 
                            [v6.Change.AbsoluteContentSize] = v114.onAbsoluteContentSizeChanged
                        }), 
                        Padding = v6.createElement("UIPadding", {
                            PaddingLeft = UDim.new(0, v124), 
                            PaddingRight = UDim.new(0, v124), 
                            PaddingTop = UDim.new(0, l_GAME_GRID_PADDING_0)
                        }), 
                        TopSection = if v126 == v76.Dropdown then v6.createElement("Frame", {
                            BackgroundTransparency = 1, 
                            LayoutOrder = 1, 
                            Size = UDim2.new(1, 0, 0, v130), 
                            AutomaticSize = Enum.AutomaticSize.Y
                        }, {
                            Padding = v6.createElement("UIPadding", {
                                PaddingBottom = UDim.new(0, v129)
                            }), 
                            DropDown = v6.createElement(v31, {
                                size = UDim2.new(1, 0, 0, v128), 
                                position = UDim2.new(0, 0, 0, 0), 
                                selectedSortName = v117, 
                                selectedSortIndex = v114.state.sortIndex, 
                                onSelected = v114.switchToSort, 
                                isOmni = v114.isOmni(), 
                                sortCategories = v131
                            }), 
                            Title = if not not v66() and v132 then v6.createElement("Frame", {
                                Name = "TitleWithTooltip", 
                                AutomaticSize = Enum.AutomaticSize.XY, 
                                Position = UDim2.new(0, 0, 0, v128 + v129), 
                                BackgroundTransparency = 1
                            }, {
                                Layout = v6.createElement("UIListLayout", {
                                    FillDirection = Enum.FillDirection.Horizontal, 
                                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                                    SortOrder = Enum.SortOrder.LayoutOrder, 
                                    Padding = UDim.new(0, 4)
                                }), 
                                Title = v6.createElement("TextLabel", {
                                    Text = v121.displayName, 
                                    Font = v134.Font.Header1.Font, 
                                    TextSize = v134.Font.BaseSize * v134.Font.Header1.RelativeSize, 
                                    TextColor3 = v134.Theme.TextEmphasis.Color, 
                                    TextTransparency = v134.Theme.TextEmphasis.Transparency, 
                                    TextXAlignment = Enum.TextXAlignment.Left, 
                                    TextYAlignment = Enum.TextYAlignment.Top, 
                                    AutomaticSize = Enum.AutomaticSize.XY, 
                                    BackgroundTransparency = 1, 
                                    TextWrapped = true, 
                                    LayoutOrder = 1
                                }), 
                                GamesListTooltip = v6.createElement(l_IconWithTooltip_0, {
                                    tooltipOrientation = l_TooltipOrientation_0.Bottom, 
                                    onActivateTooltip = v114.onActivateTooltip, 
                                    layoutOrder = 2, 
                                    hoverText = v133, 
                                    triggerPointName = "GamesListTooltip"
                                })
                            }) else v6.createElement(v30, {
                                Text = v121.displayName, 
                                Position = UDim2.new(0, 0, 0, v128 + v129), 
                                Font = v134.Font.Header1.Font, 
                                TextSize = v134.Font.BaseSize * v134.Font.Header1.RelativeSize, 
                                TextColor3 = v134.Theme.TextEmphasis.Color, 
                                TextTransparency = v134.Theme.TextEmphasis.Transparency, 
                                TextXAlignment = Enum.TextXAlignment.Left, 
                                TextYAlignment = Enum.TextYAlignment.Top, 
                                BackgroundTransparency = 1, 
                                Size = UDim2.new(1, 0, 0, 0), 
                                fitAxis = v29.FitAxis.Height, 
                                TextWrapped = true
                            })
                        }) else nil, 
                        ["GameGrid " .. v117] = v6.createElement(v33, {
                            LayoutOrder = 2, 
                            entries = v122.entries, 
                            reportGameDetailOpened = v114.reportGameDetailOpened, 
                            windowSize = Vector2.new(l_contentSize_0.X, l_frameSize_0.Y), 
                            screenSize = l_screenSize_1, 
                            hideGameStats = v125, 
                            currentSidePadding = v124, 
                            impressionsTag = "GamesList", 
                            reportExperienceLaunched = v114.reportExperienceLaunched, 
                            launchExperienceEventContext = v27.AnalyticsContext.ExperienceTile
                        }), 
                        GameSeeAllImpressionsDetector = v6.createElement(v44, {
                            parentRef = v114.containerRef, 
                            impressionsTag = "GamesList", 
                            scrollViewPositionChangedSignal = v114.gamesListViewChangedSignal, 
                            sendGameImpressions = v114.sendGameImpressions, 
                            gameSortId = v114.state.sortName
                        })
                    })
                });
            end);
        else
            return nil;
        end;
    else
        return nil;
    end;
end;
v77.render = function(v136)
    return l_withLocalization_0({
        creationCenter = "CommonUI.Features.Label.CreationCenter", 
        chartsTitle = if not v70 then nil else "CommonUI.Features.Label.Charts"
    })(function(v137)
        return v136:renderWithLocalized(v137);
    end);
end;
v77.didMount = function(v138)
    v138.isMounted = true;
    v138.updateGamesInSort();
end;
v77.willUnmount = function(v139)
    v139.isMounted = false;
end;
v77.didUpdate = function(v140, _, v142)
    if v140.state.sortName ~= v142.sortName then
        v140.updateGamesInSort();
    end;
end;
v77 = l_RoactAppPolicy_0.connect(function(v143, _)
    return {
        useCreationCenterTitle = v143.getGamesPageCreationCenterTitle()
    };
end)((v7.connect(function(v145, _)
    return {
        topBarHeight = if not v69 then v145.TopBar.topBarHeight else nil, 
        screenSize = v145.ScreenSize, 
        omniRecommendationsSorts = v145.OmniRecommendationsSorts, 
        gameSorts = v145.GameSorts, 
        gameSortContents = v145.Personalization.TopicContents
    };
end, function(v147)
    return {
        dispatchRefresh = function(v148, v149, v150, v151)
            v147(v42());
            return v147(v39(v40(v148, {
                v150
            }, v149, nil, if not v65 then nil else v151)));
        end, 
        dispatchRefreshOmni = function(v152, v153, v154, v155)
            v147(v42());
            return v147(v39(v37(v152, v153, v154, nil, nil, v155)));
        end, 
        dispatchRefreshSortContents = function(v156, v157)
            return v147(v35(v156, nil, v157, nil, nil));
        end, 
        dispatchLoadMoreGames = function(v158, v159, v160, v161, v162, v163)
            return v147(v39(v36(v158, v159, true, {
                startRows = v160, 
                maxRows = v161, 
                exclusiveStartId = v162, 
                pageToken = v163
            })));
        end, 
        dispatchLoadMoreGamesOmni = function(v164, v165, v166, v167)
            return v147(v39(v38(v164, v165, v166, v167)));
        end, 
        dispatchFetchExpiringTokens = function(v168, v169, v170)
            return v147(v41(v168, {
                v169
            }, v170));
        end
    };
end)(v77)));
if l_GetFFlagTenFootUiSeeAll_0() then
    local v173 = l_RoactAppPolicy_0.connect(function(v171, _)
        return {
            useCategoryScrollList = v171.getGameListCategoryScrollListEnabled()
        };
    end)(v77);
    local l_v173_0 = v173 --[[ copy: 79 -> 80 ]];
    v77 = function(v175)
        local v176 = l_useDesignTokens_0();
        return v6.createElement(l_v173_0, (v17.Dictionary.join(v175, {
            categorySelectorHeight = v176.Global.Size_600, 
            topBarCategoriesScrollerHeight = v176.Global.Size_1000, 
            topBarCategoriesScrollerPadding = v176.Global.Space_200, 
            hasTopBar = if not v69 then l_useUiModeInfo_0().uiMode ~= l_UiMode_0.TenFoot else nil
        })));
    end;
end;
if l_GetFFlagGamesListBackgroundFix_0() then
    local l_v77_0 = v77;
    local l_l_v77_0_0 = l_v77_0 --[[ copy: 79 -> 81 ]];
    v77 = function(v179)
        return v6.createElement(l_l_v77_0_0, (v17.Dictionary.join(v179, {
            backgroundTransparency = l_useDesignTokens_0().LuaApps.SeeAll.BackgroundTransparency
        })));
    end;
end;
if l_GetFFlagTenFootUiCategoryTabSafeArea_0() then
    local l_v77_1 = v77;
    local l_l_v77_1_0 = l_v77_1 --[[ copy: 79 -> 82 ]];
    v77 = function(v182)
        return v6.createElement(l_l_v77_1_0, (v17.Dictionary.join(v182, {
            safeAreaPadding = l_useDesignTokens_0().Global.Space_800
        })));
    end;
end;
local l_v77_2 = v77;
return l_RoactServices_0.connect({
    networking = v10, 
    eventIngest = v13, 
    analytics = l_RoactAnalyticsCommonGameEvents_0, 
    appAnalytics = v26, 
    omniRecommendationsRequest = if not l_IsPrefetchOneCopyEnabled_0() then nil else l_AppOmniRecommendationsRequest_0
})((v14.connectUserLayer({
    v28.GameTileLayer, 
    if not v67() then v28.DiscoverPageAccessLayer else v68
}, function(v184, _)
    return {
        hideGameStatsIXP = (v184[v28.GameTileLayer] or {}).hideGameStats == "true", 
        areExploreApiSortsEnabledByIxp = if not v61() then nil else (v184[if not v67() then v28.DiscoverPageAccessLayer else v68] or {}).IsExploreApiSortsEnabled
    };
end)(function(v186)
    local v187 = nil;
    local v188 = nil;
    local v189 = nil;
    local v190 = l_useLocalization_0({
        SponsoredDisclosure = "CoreScripts.Ads.Label.SponsoredAdsDisclosureStatic", 
        SponsoredTitle = "CoreScripts.Ads.Label.SponsoredAds"
    });
    v187 = v190.SponsoredDisclosure;
    v188 = v190.SponsoredTitle;
    local v191 = l_useDispatch_0();
    v189 = v15.useCallback(function(v192, v193)
        v191(v54(v192, v193));
    end);
    local v194 = if not l_GetFFlagTenFootUiScrollBackFix_0() then nil else v24();
    return v6.createElement(l_v77_2, (v17.Dictionary.join(v186, {
        onBackToTop = if not l_GetFFlagTenFootUiScrollBackFix_0() then nil else function(v195)
            if v194 == "Focus" then
                local v196 = l_TweenService_0:Create(v195, TweenInfo.new(0.3), {
                    CanvasPosition = Vector2.new(0, 0)
                });
                v196:Play();
                v196.Completed:Connect(function()
                    l_GuiService_0:Select(v195);
                end);
            end;
        end, 
        deviceType = if not v66() then nil else l_useDeviceType_0(), 
        onActivateTooltip = v189, 
        sponsoredTooltipBody = v187, 
        sponsoredTooltipTitle = v188
    }, (l_useNavigationProps_0(function(v197, v198)
        local v199 = {
            sortPageId = v198.sortPageId, 
            pageContext = v198.pageContext, 
            initialSortName = v197
        };
        if v198.isOmni then
            v199.isOmni = true;
            v199.initialSortIndex = v198.sortIndex;
        end;
        return v199;
    end)))));
end)));
