local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Cryo);
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.RoactRodux);
local v5 = require(l_CorePackages_0.Packages.t);
local l_GridMetrics_0 = require(l_CorePackages_0.UIBlox).App.Grid.GridMetrics;
local l_Signal_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Signal;
local l_withNavigation_0 = require(l_CorePackages_0.RoactNavigation).withNavigation;
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
local l_useDeviceType_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useDeviceType;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v12 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags);
local l_RoactAnalytics_0 = v12.RoactAnalytics;
local l_RoactNetworking_0 = v12.RoactNetworking;
local l_AppEventIngestService_0 = v12.AppEventIngestService;
local l_AppPage_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).AppPage;
local l_RetrievalStatus_0 = require(l_CorePackages_0.Workspace.Packages.Http).Enum.RetrievalStatus;
local v18 = require(l_CorePackages_0.Packages.RoactAppExperiment);
local v19 = require(l_CorePackages_0.Workspace.Packages.GameTile);
local l_AppGameTile_0 = v19.AppGameTile;
local l_WideGameTileViewConfig_0 = v19.WideGameTileViewConfig;
local l_NavigateDown_0 = require(l_CorePackages_0.Workspace.Packages.NavigationRodux).Thunks.NavigateDown;
local l_isSubjectToDesktopPolicies_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).isSubjectToDesktopPolicies;
local l_mutedError_0 = require(l_CorePackages_0.Workspace.Packages.Loggers).mutedError;
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_CountdownSubtitleText_0 = require(l_CorePackages_0.Workspace.Packages.GameCollectionViews).CountdownSubtitleText;
local l_OpenGameDetails_0 = require(l_CorePackages_0.Workspace.Packages.GameDetail).OpenGameDetails;
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v31 = require(l_Modules_0.LuaApp.Constants);
local v32 = require(l_Modules_0.LuaApp.getGameCardSize);
local v33 = require(l_Modules_0.LuaApp.Experiment.AppUserLayers);
local v34 = require(l_Modules_0.LuaApp.Components.Generic.CarouselWidget);
local v35 = require(l_Modules_0.LuaApp.Thunks.Games.ApiFetchGamesInSort);
local v36 = require(l_Modules_0.LuaApp.Thunks.Omni.ApiFetchOmniRecommendationsMetadata);
local v37 = require(l_Modules_0.LuaApp.Thunks.FetchDataWithErrorToasts);
local v38 = require(l_Modules_0.Personalization.Games.GameSortImpressionsDetector);
local v39 = require(l_Modules_0.Personalization.Games.SendGameImpressions);
local v40 = require(l_Modules_0.Personalization.Analytics.ScrollDetector);
local v41 = require(l_Modules_0.Personalization.Analytics.feedScroll);
local v42 = require(l_Modules_0.LuaApp.Thunks.Games.OpenInfoPeekView);
local v43 = require(l_Modules_0.Personalization.OmniFeed.OmniFeedConstants);
local v44 = require(l_Modules_0.Personalization.Games.useNavigateToSortLinkWebView);
local v45 = require(l_Modules_0.LuaApp.Flags.LuaAppGameTileConfig);
local l_GetFFlagApolloClientFetchExperiences_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagApolloClientFetchExperiences;
local v47 = require(l_Modules_0.LuaApp.Flags.GetFFlagGameSortGridRowAnalyticsWithoutStore);
local v48 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableSponsoredAdsGameCarouselTooltip);
local v49 = require(l_Modules_0.Personalization.Flags.GetFFlagLuaAppSortHideSeeAll);
local l_GetFFlagLuaAppSortSubtitlesEnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagLuaAppSortSubtitlesEnabled;
local l_GetFFlagLuaAppUseTooltipsFromSort_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagLuaAppUseTooltipsFromSort;
local l_FFlagLuaAppPlayButtonStyle_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppPlayButtonStyle;
local l_FFlagLuaAppGameTileProps_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppGameTileProps;
local v54 = require(l_Modules_0.Personalization.Flags.FFlagLuaAppCountdownSubtitle);
local v55 = require(l_Modules_0.LuaApp.Flags.FFlagLuaAppRemoveExtraCarouselPadding);
local v56 = require(l_Modules_0.Personalization.Flags.FFlagLuaAppLinkSortTitle);
local l_FFlagLuaAppRefactorOpenGameDetail_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppRefactorOpenGameDetail;
local l_FFlagLuaAppFixNavigationUidLogging_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppFixNavigationUidLogging;
local l_GAME_CAROUSEL_PADDING_0 = v31.GAME_CAROUSEL_PADDING;
local l_GAME_CAROUSEL_CHILD_PADDING_0 = v31.GAME_CAROUSEL_CHILD_PADDING;
local l_GAME_GRID_CHILD_PADDING_0 = v31.GAME_GRID_CHILD_PADDING;
local v62 = v3.PureComponent:extend("GameCarousel");
v62.validateProps = v5.strictInterface({
    sortName = v5.string, 
    sortIndex = v5.optional(v5.number), 
    LayoutOrder = v5.optional(v5.number), 
    sortIndexOnPage = v5.number, 
    itemRowData = v5.optional(v5.table), 
    omniRecommendationsPageType = v5.optional(v5.string), 
    analytics = v5.optional(v5.any), 
    friendFooterEnabled = v5.boolean, 
    scrollViewPositionChangedSignal = v5.optional(v5.any), 
    context = v5.string, 
    sideMargin = v5.number, 
    sortPageId = v5.optional(v5.string), 
    isOmni = v5.optional(v5.boolean), 
    useGridTiles = v5.optional(v5.boolean), 
    playerCountStyle = v5.optional(v5.string), 
    isSponsoredFooterAllowed = v5.optional(v5.boolean), 
    linkPath = if not v56 then nil else v5.optional(v5.string), 
    componentType = v5.optional(v5.string), 
    hideSeeAll = if not v49() then nil else v5.optional(v5.boolean), 
    gameTileLayoutType = v5.string, 
    infoText = if not l_GetFFlagLuaAppUseTooltipsFromSort_0() then nil else v5.optional(v5.string), 
    endTimestamp = if not v54 then nil else v5.optional(v5.number), 
    countdownString = if not v54 then nil else v5.optional(v5.string), 
    playButtonStyle = if not l_FFlagLuaAppPlayButtonStyle_0 then nil else v5.optional(v5.string), 
    sort = v5.optional(v5.table), 
    gameSortContents = v5.optional(v5.table), 
    gameCardSize = v5.Vector2, 
    fractionalCardsPerRow = v5.number, 
    gameSortFetchingStatus = v5.string, 
    currentPage = if not v47() then v5.table else nil, 
    screenSize = v5.Vector2, 
    navigateToSort = v5.callback, 
    navigateToOmniSort = v5.callback, 
    dispatchLoadMoreGames = v5.callback, 
    dispatchLoadMoreOmniGames = v5.callback, 
    dispatchReloadSort = v5.callback, 
    openGameDetails = if not l_FFlagLuaAppRefactorOpenGameDetail_0 then nil else v5.callback, 
    hideGameStatsIXP = v5.optional(v5.boolean), 
    mobileShowMoreTilesPerRowIXP = v5.optional(v5.boolean), 
    navigation = if v47() or l_FFlagLuaAppRefactorOpenGameDetail_0 then v5.any else nil, 
    deviceType = if not v48() then nil else v5.string, 
    designTokens = v5.table, 
    sponsoredTooltipBody = v5.string, 
    sponsoredTooltipTitle = v5.string, 
    navigateToSortLinkWebView = if not v56 then nil else v5.optional(v5.callback), 
    onActivateTooltip = v5.callback, 
    networking = v5.callback, 
    eventIngest = v5.any, 
    appAnalytics = v5.table
});
v62.defaultProps = {
    friendFooterEnabled = false
};
v62.init = function(v63)
    v63.containerRef = v3.createRef();
    v63.state = {
        cardWindowStart = 1, 
        cardWindowIndex = 1, 
        cardsInWindow = 0, 
        gameCardSize = Vector2.new(0, 0)
    };
    v63.carouselViewChangedSignal = l_Signal_0.new();
    v63.getGameTileSize = function()
        return v63.props.gameCardSize;
    end;
    v63.isLoadingMoreGames = false;
    v63.scrollingFrameRef = v3.createRef();
    v63.isSponsoredSort = function()
        if not v63.props.isOmni then
            if v63.props.sort and v63.props.sort.gameSetTypeId == "27" then
                return true;
            end;
        elseif v63.props.sort and v63.props.sort.topicId == v43.GameGridTopicIds.Sponsored then
            return true;
        end;
        return false;
    end;
    v63.scrollingFrameRefCallback = function(v64)
        v63.scrollingFrameRef.current = v64;
        spawn(v63.updateCardWindowBounds);
    end;
    v63.loadMoreGamesOnPositionChange = function()
        if v63.scrollingFrameRef.current then
            local l_gameSortContents_0 = v63.props.gameSortContents;
            if l_gameSortContents_0 == nil then
                return ;
            else
                if not (not l_gameSortContents_0.hasMoreRows or v63.isLoadingMoreGames) and v63.props.gameSortFetchingStatus ~= l_RetrievalStatus_0.Fetching then
                    local l_X_0 = v63.scrollingFrameRef.current.CanvasPosition.X;
                    local l_X_1 = v63.scrollingFrameRef.current.AbsoluteWindowSize.X;
                    if (v63.scrollingFrameRef.current.CanvasSize.X.Offset - l_X_1) - math.max(l_X_1, 1000) < l_X_0 then
                        v63.isLoadingMoreGames = true;
                        v63.loadMoreGames():andThen(function()
                            v63.isLoadingMoreGames = false;
                        end, function()
                            v63.isLoadingMoreGames = false;
                        end);
                    end;
                end;
                return ;
            end;
        else
            return ;
        end;
    end;
    v63.updateCardWindowBounds = function()
        if v63.scrollingFrameRef.current then
            v63.carouselViewChangedSignal:fire();
            local v68 = v63.getGameTileSize();
            local l_fractionalCardsPerRow_0 = v63.props.fractionalCardsPerRow;
            local l_X_2 = v63.scrollingFrameRef.current.CanvasPosition.X;
            local v71 = math.max(1, (math.floor(l_X_2 / (v68.X + l_GAME_CAROUSEL_CHILD_PADDING_0))));
            local v72 = math.max(0, (math.floor(l_X_2 / (v68.X + l_GAME_CAROUSEL_CHILD_PADDING_0)))) + 1;
            local v73 = math.ceil(l_fractionalCardsPerRow_0) + 2;
            local v74 = true;
            if v71 == v63.state.cardWindowStart then
                v74 = true;
                if v72 == v63.state.cardWindowIndex then
                    v74 = true;
                    if v73 == v63.state.cardsInWindow then
                        v74 = v68 ~= v63.state.gameCardSize;
                    end;
                end;
            end;
            if v74 then
                v63:setState({
                    cardWindowStart = v71, 
                    cardWindowIndex = v72, 
                    cardsInWindow = v73, 
                    gameCardSize = v68
                });
            end;
            return ;
        else
            return ;
        end;
    end;
    v63.onChangeCanvasPosition = function()
        v63.loadMoreGamesOnPositionChange();
        v63.updateCardWindowBounds();
    end;
    v63.onSeeAll = function()
        if not v56 or not v63.props.linkPath then
            local l_navigateToSort_0 = v63.props.navigateToSort;
            local l_sort_0 = v63.props.sort;
            local l_analytics_0 = v63.props.analytics;
            local l_sortIndexOnPage_0 = v63.props.sortIndexOnPage;
            local l_isOmni_0 = v63.props.isOmni;
            if l_sort_0 then
                if not l_isOmni_0 then
                    l_navigateToSort_0(v63.props.sortName, v63.props.sortPageId, v63.props.context);
                else
                    v63.props.navigateToOmniSort(v63.props.sortPageId, v63.props.sortIndex, v63.props.sortName, v63.props.context);
                end;
                local v80 = nil;
                local v81 = nil;
                if not l_isOmni_0 then
                    v80 = l_sort_0.gameSetTypeId;
                    v81 = l_sort_0.gameSetTargetId;
                else
                    v80 = l_sort_0.topicId;
                    v81 = nil;
                end;
                l_analytics_0.reportSeeAllWithId(v80, v81, l_sortIndexOnPage_0);
                return ;
            else
                return ;
            end;
        else
            local v82 = nil;
            if v63.props.sort then
                v82 = if not v63.props.isOmni then v63.props.sort.gameSetTypeId else v63.props.sort.topicId;
            end;
            v63.props.navigateToSortLinkWebView(v63.props.linkPath, v63.props.context, not not v63.props.sort and v63.props.sort.displayName or "", v82);
            return ;
        end;
    end;
    if l_FFlagLuaAppRefactorOpenGameDetail_0 then
        v63.navigateToGameDetails = function(v83, v84)
            v63.props.openGameDetails(v83, v84, v63.props.navigation);
        end;
    end;
    v63.reportGameDetailOpened = function(v85, v86)
        local l_sort_1 = v63.props.sort;
        local l_gameSortContents_1 = v63.props.gameSortContents;
        local l_analytics_1 = v63.props.analytics;
        local v90 = if not v47() then v63.props.currentPage.name else v63.props.navigation.state.routeName;
        local l_isOmni_1 = v63.props.isOmni;
        if l_gameSortContents_1 ~= nil and l_sort_1 then
            local l_entries_0 = l_gameSortContents_1.entries;
            local v93 = l_entries_0[v85];
            local v94 = nil;
            local v95 = nil;
            if not l_isOmni_1 then
                v94 = l_sort_1.gameSetTypeId;
                v95 = l_sort_1.gameSetTargetId;
            else
                v94 = l_sort_1.topicId;
                v95 = nil;
            end;
            l_analytics_1.reportOpenGameDetailWithId(v93.placeId, v94, v95, v63.props.sortIndexOnPage, v85, #l_entries_0, v93.isSponsored, v93.universeId, v90, if not l_FFlagLuaAppFixNavigationUidLogging_0 then nil else v86);
            return ;
        else
            return ;
        end;
    end;
    v63.loadMoreGames = function(v96)
        local v97 = v96 or v31.DEFAULT_GAME_FETCH_COUNT;
        local l_networking_0 = v63.props.networking;
        local l_sort_2 = v63.props.sort;
        local l_gameSortContents_2 = v63.props.gameSortContents;
        local l_dispatchLoadMoreGames_0 = v63.props.dispatchLoadMoreGames;
        local l_isOmni_2 = v63.props.isOmni;
        if l_gameSortContents_2 == nil then
            return ;
        else
            return not not l_isOmni_2 and v63.props.dispatchLoadMoreOmniGames(l_networking_0, v63.props.omniRecommendationsPageType, v63.props.sortIndex, v97) or l_dispatchLoadMoreGames_0(l_networking_0, l_sort_2, l_gameSortContents_2.rowsRequested, v97, l_gameSortContents_2.nextPageExclusiveStartId, l_gameSortContents_2.nextPageToken);
        end;
    end;
    v63.reloadSort = function()
        return v63.props.dispatchReloadSort(v63.props.networking, v63.props.sort);
    end;
    v63.sendGameImpressions = function(v103)
        if v63.props.gameSortContents then
            local l_sort_3 = v63.props.sort;
            local v105 = nil;
            local v106 = nil;
            local v107 = nil;
            if not v63.props.isOmni then
                v106 = not not l_sort_3 and l_sort_3.gameSetTypeId or nil;
                v107 = not not l_sort_3 and l_sort_3.gameSetTargetId or nil;
                v105 = v63.props.sortPageId;
            else
                v106 = not not l_sort_3 and l_sort_3.topicId or nil;
            end;
            v39.sendFromTopicContents(v63.props.eventIngest, v63.props.appAnalytics, v103, v63.props.gameSortContents.entries, v63.props.context, v106, v63.props.sortIndexOnPage, v63.props.itemRowData, v107, v105, nil, v63.props.useGridTiles, v63.props.componentType);
            return ;
        else
            return ;
        end;
    end;
    v63.onActivateTooltip = function()
        if v63.isMounted then
            if not v63.isSponsoredSort() then
                if not (not l_GetFFlagLuaAppUseTooltipsFromSort_0() or not v63.props.infoText) then
                    v63.props.onActivateTooltip(v63.props.sort.displayName, v63.props.infoText);
                end;
            else
                v63.props.onActivateTooltip(v63.props.sponsoredTooltipTitle, v63.props.sponsoredTooltipBody);
                return ;
            end;
        end;
    end;
    v63.sendScrollEvent = function(v108, v109, v110)
        if v63.isMounted and v63.scrollingFrameRef.current then
            local l_ScrollingDirection_0 = v63.scrollingFrameRef.current.ScrollingDirection;
            local v112 = 0;
            if l_ScrollingDirection_0 == Enum.ScrollingDirection.X then
                v112 = v63.scrollingFrameRef.current.AbsoluteSize.X;
            elseif l_ScrollingDirection_0 == Enum.ScrollingDirection.Y then
                v112 = v63.scrollingFrameRef.current.AbsoluteSize.Y;
            else
                l_mutedError_0((("Direction %* is an unsupported option for feedScroll event"):format(l_ScrollingDirection_0.Name)));
            end;
            local l_sort_4 = v63.props.sort;
            local v114 = nil;
            local v115 = nil;
            if not v63.props.isOmni then
                v114 = not not l_sort_4 and l_sort_4.gameSetTypeId or nil;
                v115 = not not l_sort_4 and l_sort_4.gameSetTargetId or nil;
            else
                v114 = not not l_sort_4 and l_sort_4.topicId or nil;
                if not v114 then
                    l_mutedError_0("There must be a non-nil value for gameSetTypeId for a horizontal feedScroll event");
                end;
            end;
            v41(v63.props.eventIngest, v63.props.context, l_ScrollingDirection_0, {
                distance = v108, 
                screenSizeX = v63.props.screenSize.X, 
                screenSizeY = v63.props.screenSize.Y, 
                scrollAreaSize = v112, 
                scrollDepth = if v112 > 0 then v108 / v112 else nil, 
                startDepth = if v112 > 0 then v110 / v112 else nil, 
                startPos = v110, 
                scrollDuration = v109, 
                sortPos = v63.props.sortIndexOnPage, 
                gameSetTypeId = v114, 
                gameSetTargetId = v115
            });
            return ;
        else
            return ;
        end;
    end;
end;
v62.render = function(v116)
    local l_sort_5 = v116.props.sort;
    local l_LayoutOrder_0 = v116.props.LayoutOrder;
    local l_gameSortContents_3 = v116.props.gameSortContents;
    local v120 = v116.getGameTileSize();
    local l_gameSortFetchingStatus_0 = v116.props.gameSortFetchingStatus;
    local l_friendFooterEnabled_0 = v116.props.friendFooterEnabled;
    local l_sideMargin_0 = v116.props.sideMargin;
    local l_cardsInWindow_0 = v116.state.cardsInWindow;
    local l_cardWindowStart_0 = v116.state.cardWindowStart;
    local l_cardWindowIndex_0 = v116.state.cardWindowIndex;
    local v127 = not not l_gameSortContents_3 and l_gameSortContents_3.entries or {};
    if #v127 == 0 then
        return nil;
    else
        local v128 = nil;
        v128 = if not v49() then #v127 > 0 else not v116.props.hideSeeAll and #v127 > 0;
        local v129 = "GameCarousel_" .. v116.props.sortName .. tostring(v116.props.sortIndexOnPage);
        local v130 = math.min(#v127, (l_cardWindowStart_0 + l_cardsInWindow_0) - 1);
        local v131 = if not v55 then math.max(0, #v127 * (l_GAME_CAROUSEL_CHILD_PADDING_0 + v120.X)) else math.max(0, #v127 * (l_GAME_CAROUSEL_CHILD_PADDING_0 + v120.X)) - l_GAME_CAROUSEL_CHILD_PADDING_0;
        local v132 = (l_cardWindowStart_0 - 1) * (v120.X + l_GAME_CAROUSEL_CHILD_PADDING_0);
        v120 = Vector2.new(v120.X, v120.Y);
        local v133 = {};
        local v134 = v45.shouldHideGameStats(v116.props.context, v116.props.hideGameStatsIXP);
        local v135 = false;
        local v136 = nil;
        if v116.isSponsoredSort() then
            v135 = true;
            v136 = v116.props.sponsoredTooltipBody;
        end;
        if not (not l_GetFFlagLuaAppUseTooltipsFromSort_0() or not v116.props.infoText) and v116.props.infoText ~= "" then
            v135 = true;
            v136 = v116.props.infoText;
        end;
        v133.Layout = v3.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Horizontal, 
            Padding = UDim.new(0, l_GAME_CAROUSEL_CHILD_PADDING_0), 
            HorizontalAlignment = Enum.HorizontalAlignment.Left
        });
        v133.Padding = v3.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, v132)
        });
        for v137 = l_cardWindowStart_0, v130 do
            v133[v137 % l_cardsInWindow_0] = v3.createElement(l_AppGameTile_0, {
                entry = v127[v137], 
                layoutOrder = v137, 
                size = if l_FFlagLuaAppGameTileProps_0 then nil else v120, 
                Size = if not l_FFlagLuaAppGameTileProps_0 then nil else UDim2.new(0, v120.X, 0, v120.Y), 
                reportGameDetailOpened = v116.reportGameDetailOpened, 
                index = v137, 
                friendFooterEnabled = l_friendFooterEnabled_0, 
                hideGameStats = v134, 
                showFriendActivity = v116.props.context == l_AppPage_0.Home, 
                impressionsTag = v129, 
                useGridTile = v116.props.useGridTiles, 
                playerCountStyle = v116.props.playerCountStyle, 
                isSponsoredFooterAllowed = v116.props.isSponsoredFooterAllowed, 
                gameTileLayoutType = v116.props.gameTileLayoutType, 
                topicId = if not not v116.props.isOmni and l_sort_5 then l_sort_5.topicId else nil, 
                navigateToGameDetails = if not l_FFlagLuaAppRefactorOpenGameDetail_0 then nil else v116.navigateToGameDetails, 
                playButtonStyle = if not l_FFlagLuaAppPlayButtonStyle_0 then nil else v116.props.playButtonStyle
            });
        end;
        return v3.createElement("Frame", {
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.new(1, 0, 0, 0), 
            BackgroundTransparency = 1, 
            LayoutOrder = l_LayoutOrder_0, 
            [v3.Ref] = v116.containerRef
        }, {
            Layout = v3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 0)
            }), 
            Padding = v3.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, l_sideMargin_0)
            }), 
            GameCarousel = v3.createElement(v34, {
                title = not not l_sort_5 and l_sort_5.displayName or "", 
                subtitle = if ((not not l_GetFFlagLuaAppSortSubtitlesEnabled_0() and v54) and v116.props.endTimestamp) and v116.props.countdownString then v2.createElement(l_CountdownSubtitleText_0, {
                    endTimestamp = v116.props.endTimestamp, 
                    defaultString = not not l_sort_5 and l_sort_5.subtitle or "", 
                    formatStringHoursMinutes = v116.props.countdownString, 
                    LayoutOrder = 2
                }) else if l_GetFFlagLuaAppSortSubtitlesEnabled_0() then l_sort_5 and l_sort_5.subtitle or "" else nil, 
                items = v133, 
                index = math.max(1, (math.min(l_cardWindowIndex_0, #v127))), 
                itemCount = #v127, 
                itemWidth = v120.X, 
                itemPadding = l_GAME_CAROUSEL_CHILD_PADDING_0, 
                carouselMargin = l_sideMargin_0, 
                onSeeAll = v116.onSeeAll, 
                carouselHeight = v120.Y, 
                canvasWidth = v131, 
                fetchingStatus = l_gameSortFetchingStatus_0, 
                onRetry = v116.reloadSort, 
                onChangeCanvasPosition = v116.onChangeCanvasPosition, 
                onRefCallback = v116.scrollingFrameRefCallback, 
                showSeeAll = v128, 
                showTooltip = if not v48() then nil else v135, 
                onActivateTooltip = if not v48() then nil else v116.onActivateTooltip, 
                deviceType = if not v48() then nil else v116.props.deviceType, 
                tooltipHoverText = v136
            }), 
            GameSortImpressionsDetector = v3.createElement(v38, {
                parentRef = v116.containerRef, 
                pageContext = v116.props.context, 
                impressionsTag = v129, 
                scrollViewPositionChangedSignal = v116.carouselViewChangedSignal, 
                sendGameImpressions = v116.sendGameImpressions, 
                dataUpdatedTimestamp = not not l_gameSortContents_3 and l_gameSortContents_3.updatedTimestamp or nil
            }), 
            ScrollDetector = v3.createElement(v40, {
                scrollingFrameRef = v116.scrollingFrameRef, 
                sendScrollEvent = v116.sendScrollEvent
            })
        });
    end;
end;
v62.didMount = function(v138)
    v138.isMounted = true;
    if v138.props.scrollViewPositionChangedSignal then
        v138.scrollViewPositionChangedSignalConnection = v138.props.scrollViewPositionChangedSignal:connect(function()
            v138.carouselViewChangedSignal:fire();
        end);
    end;
end;
v62.willUnmount = function(v139)
    if v139.scrollViewPositionChangedSignalConnection ~= nil then
        v139.scrollViewPositionChangedSignalConnection:disconnect();
    end;
    v139.isMounted = false;
end;
v62.didUpdate = function(v140, v141)
    local l_gameSortContents_4 = v140.props.gameSortContents;
    local l_cardsInWindow_1 = v140.state.cardsInWindow;
    local l_cardWindowStart_1 = v140.state.cardWindowStart;
    if l_cardWindowStart_1 < math.min(#(not not l_gameSortContents_4 and l_gameSortContents_4.entries or {}), (l_cardWindowStart_1 + l_cardsInWindow_1) - 1) then
        v140.carouselViewChangedSignal:fire();
    end;
    if not (v140.props.gameCardSize == v141.gameCardSize) or v140.props.fractionalCardsPerRow ~= v141.fractionalCardsPerRow then
        v140.updateCardWindowBounds();
    end;
end;
local function _(v145, v146)
    if v145 == "Wide" then
        if not v146 then
            return 2;
        else
            return 4;
        end;
    elseif v145 == "Event" then
        if not v146 then
            return 1;
        else
            return 4;
        end;
    else
        return 3;
    end;
end;
local function _(v148, v149)
    if v148 == "Wide" then
        if not v149 then
            return 0.25;
        else
            return 0.25;
        end;
    elseif v148 == "Event" then
        if not v149 then
            return 0.3;
        else
            return 0;
        end;
    else
        return 0.25;
    end;
end;
v62 = v18.connectUserLayer({
    v33.GameTileLayer
}, function(v151, _)
    local v153 = v151[v33.GameTileLayer] or {};
    return {
        hideGameStatsIXP = v153.hideGameStats == "true", 
        mobileShowMoreTilesPerRowIXP = if not v45.mobileShowMoreTilesPerRowIXPEnabled() then nil else v153.mobileShowMoreTilesPerRow
    };
end)((v4.connect(function(v154, v155)
    local l_ScreenSize_0 = v154.ScreenSize;
    local v157 = v154.Navigation.history[#v154.Navigation.history];
    local v158 = nil;
    local v159 = not not v154.Personalization.TopicContents and v154.Personalization.TopicContents[v155.sortName] or nil;
    local v160 = nil;
    if not v155.isOmni then
        v158 = v154.GameSorts[v155.sortName];
        v160 = v154.RequestsStatus.GameSortsStatus[v155.sortName] or l_RetrievalStatus_0.NotStarted;
    else
        if v154.OmniRecommendationsSorts[v155.omniRecommendationsPageType] then
            v158 = v154.OmniRecommendationsSorts[v155.omniRecommendationsPageType][v155.sortIndex];
        end;
        v160 = v154.RequestsStatus.OmniRecommendationsRetrievalStatus[v155.omniRecommendationsPageType] or l_RetrievalStatus_0.NotStarted;
    end;
    local v161 = nil;
    local v162 = nil;
    if not l_isSubjectToDesktopPolicies_0() then
        if not v155.useGridTiles then
            local v163, v164 = v32(l_ScreenSize_0.X - l_GAME_CAROUSEL_PADDING_0, l_GAME_CAROUSEL_PADDING_0, l_GAME_CAROUSEL_CHILD_PADDING_0, not v155.mobileShowMoreTilesPerRowIXP and 0.25 or 0.6);
            v161 = v163;
            v162 = v164;
        else
            local l_gameTileLayoutType_0 = v155.gameTileLayoutType;
            local v166 = v154.FormFactor == l_FormFactor_0.WIDE;
            local v167 = if l_gameTileLayoutType_0 == "Wide" then v166 and 0.25 or 0.25 else if l_gameTileLayoutType_0 == "Event" then v166 and 0 or 0.3 else 0.25;
            v166 = v155.gameTileLayoutType;
            local v168 = v154.FormFactor == l_FormFactor_0.WIDE;
            l_gameTileLayoutType_0 = if v166 == "Wide" then v168 and 4 or 2 else if v166 == "Event" then v168 and 4 or 1 else 3;
            v162 = l_gameTileLayoutType_0 + v167;
            v166 = l_GridMetrics_0.getMetricsForFixedColumns(l_ScreenSize_0.X - 2 * v155.sideMargin, l_GAME_GRID_CHILD_PADDING_0, l_gameTileLayoutType_0 + v167).itemWidth;
            v161 = Vector2.new(v166, (l_WideGameTileViewConfig_0.getTileHeight(v155.designTokens, v166)));
        end;
    else
        local v169 = l_GridMetrics_0.getSmallMetrics(l_ScreenSize_0.X, l_GAME_CAROUSEL_CHILD_PADDING_0);
        local l_itemWidth_0 = v169.itemWidth;
        v161 = Vector2.new(l_itemWidth_0, (math.floor(l_itemWidth_0 + v31.GAME_GRID_TILE_FOOTER_HEIGHT)));
        v162 = v169.itemsPerRow + 1;
    end;
    return {
        sort = if not not l_GetFFlagApolloClientFetchExperiences_0() and v155.sort then v155.sort else v158, 
        gameSortContents = if not not l_GetFFlagApolloClientFetchExperiences_0() and v155.gameSortContents then v155.gameSortContents else v159, 
        gameCardSize = v161, 
        fractionalCardsPerRow = v162, 
        gameSortFetchingStatus = if not not l_GetFFlagApolloClientFetchExperiences_0() and v155.gameSortContents then l_RetrievalStatus_0.Done else v160, 
        currentPage = if not v47() then v157[#v157] else nil, 
        screenSize = l_ScreenSize_0
    };
end, function(v171)
    return {
        navigateToSort = function(v172, v173, v174)
            v171(l_NavigateDown_0({
                name = l_AppPage_0.GamesList, 
                detail = v172, 
                extraProps = {
                    sortPageId = v173, 
                    pageContext = v174
                }
            }));
        end, 
        navigateToOmniSort = function(v175, v176, v177, v178)
            v171(l_NavigateDown_0({
                name = l_AppPage_0.GamesList, 
                detail = v177, 
                extraProps = {
                    sortPageId = v175, 
                    sortIndex = v176, 
                    isOmni = true, 
                    pageContext = v178
                }
            }));
        end, 
        dispatchLoadMoreGames = function(v179, v180, v181, v182, v183, v184)
            return v171(v37(v35(v179, v180, true, {
                startRows = v181, 
                maxRows = v182, 
                exclusiveStartId = v183, 
                pageToken = v184
            })));
        end, 
        dispatchLoadMoreOmniGames = function(v185, v186, v187, v188)
            return v171(v37(v36(v185, v186, v187, v188)));
        end, 
        dispatchReloadSort = function(v189, v190)
            return v171(v35(v189, v190, false, nil));
        end, 
        openGameDetails = if not l_FFlagLuaAppRefactorOpenGameDetail_0 then nil else function(v191, v192, v193)
            v171(l_OpenGameDetails_0(v191, v193, v192));
        end
    };
end)(v62)));
if not (not v47() and not l_FFlagLuaAppRefactorOpenGameDetail_0) then
    v62 = l_withNavigation_0(v62);
end;
local l_v62_0 = v62;
return l_RoactServices_0.connect({
    networking = l_RoactNetworking_0, 
    eventIngest = l_AppEventIngestService_0, 
    appAnalytics = l_RoactAnalytics_0
})(function(v195)
    local v196 = if not v48() then nil else l_useDeviceType_0();
    local v197 = l_useDesignTokens_0();
    local v198 = nil;
    local v199 = nil;
    local v200 = nil;
    local v201 = l_useLocalization_0({
        SponsoredDisclosure = "CoreScripts.Ads.Label.SponsoredAdsDisclosureStatic", 
        SponsoredTitle = "CoreScripts.Ads.Label.SponsoredAds"
    });
    v198 = v201.SponsoredDisclosure;
    v199 = v201.SponsoredTitle;
    local v202 = l_useDispatch_0();
    v200 = v2.useCallback(function(v203, v204)
        v202(v42(v203, v204));
    end);
    local v205 = nil;
    if v56 then
        v205 = v44();
    end;
    return v3.createElement(l_v62_0, (v1.Dictionary.join(v195, {
        deviceType = v196, 
        designTokens = v197, 
        sponsoredTooltipBody = v198, 
        sponsoredTooltipTitle = v199, 
        onActivateTooltip = v200, 
        navigateToSortLinkWebView = v205
    })));
end);
