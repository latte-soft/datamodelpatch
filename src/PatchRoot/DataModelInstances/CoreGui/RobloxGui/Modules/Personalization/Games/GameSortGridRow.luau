local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Roact);
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.t);
local v5 = require(l_CorePackages_0.Cryo);
local v6 = require(l_CorePackages_0.Packages.Dash);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local v8 = require(l_CorePackages_0.UIBlox);
local l_useResponsiveLayout_0 = v8.Core.Layout.Responsive.useResponsiveLayout;
local l_ResponsiveCarousel_0 = v8.App.Container.Carousel.ResponsiveCarousel;
local l_withNavigation_0 = require(l_CorePackages_0.RoactNavigation).withNavigation;
local v12 = require(l_CorePackages_0.FitFrame);
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local l_TenFootUiGridCarouselHeader_0 = require(l_CorePackages_0.Workspace.Packages.TenFootUiSharedComponents).TenFootUiGridCarouselHeader;
local l_gamePlayIntent_0 = require(l_CorePackages_0.Workspace.Packages.ExperienceAnalytics).Events.gamePlayIntent;
local l_RoactAnalytics_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).RoactAnalytics;
local l_RoactNetworking_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).RoactNetworking;
local l_AppEventIngestService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppEventIngestService;
local l_AppPage_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).AppPage;
local l_AppGameTile_0 = require(l_CorePackages_0.Workspace.Packages.GameTile).AppGameTile;
local l_NavigateDown_0 = require(l_CorePackages_0.Workspace.Packages.NavigationRodux).Thunks.NavigateDown;
local l_LayoutConfig_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).LayoutConfig;
local l_mutedError_0 = require(l_CorePackages_0.Workspace.Packages.Loggers).mutedError;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_CloseCentralOverlay_0 = require(l_CorePackages_0.Workspace.Packages.CentralOverlay).Thunks.CloseCentralOverlay;
local l_IsVRAppBuild_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).IsVRAppBuild;
local l_CountdownSubtitleText_0 = require(l_CorePackages_0.Workspace.Packages.GameCollectionViews).CountdownSubtitleText;
local l_OpenGameDetails_0 = require(l_CorePackages_0.Workspace.Packages.GameDetail).OpenGameDetails;
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v32 = require(l_Modules_0.LuaApp.Constants);
local v33 = require(l_Modules_0.Personalization.Games.GameSortGridRowSeeAllTile);
local v34 = require(l_Modules_0.Personalization.Games.GameSortImpressionsDetector);
local v35 = require(l_Modules_0.Personalization.Games.GameSortHeaderWithTooltip);
local v36 = require(l_Modules_0.Personalization.Games.SendGameImpressions);
local v37 = require(l_Modules_0.LuaApp.getCurrentPage);
local v38 = require(script.Parent.SeeAllNavigationBindings);
local v39 = require(l_Modules_0.Personalization.OmniFeed.OmniFeedConstants);
local v40 = require(l_Modules_0.Personalization.Analytics.ScrollDetector);
local v41 = require(l_Modules_0.Personalization.Analytics.feedScroll);
local v42 = require(l_Modules_0.LuaApp.Thunks.Games.OpenCloseOnlyInteractiveAlert);
local v43 = require(l_Modules_0.Personalization.Games.useNavigateToSortLinkWebView);
local v44 = require(l_Modules_0.LuaApp.Components.GridHome.Flags.GetFFlagLuaAppGridConfigRelativeHeight);
local l_GetFFlagApolloClientFetchExperiences_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagApolloClientFetchExperiences;
local l_GetFFlagTenFootUiGameCarousel_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagTenFootUiGameCarousel;
local l_GetFFlagGridCarouselHeaderHeightFix_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagGridCarouselHeaderHeightFix;
local l_GetFFlagTenFootUiSeeAll_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagTenFootUiSeeAll;
local l_FFlagLuaAppPlayButtonStyle_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppPlayButtonStyle;
local v50 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppUpdateGameSortGridRowHeight10ft);
local v51 = require(l_Modules_0.LuaApp.Flags.GetFFlagGameSortGridRowAnalyticsWithoutStore);
local v52 = require(l_Modules_0.Personalization.Flags.GetFFlagAddSeeAllShortcutControllerBar10ft);
local v53 = require(l_Modules_0.Personalization.Flags.FFlagLuaAppCountdownSubtitle);
local v54 = require(l_Modules_0.Personalization.Flags.GetFFlagLuaAppScrollTelemetryHorizontalConsole);
local v55 = require(l_Modules_0.Personalization.Flags.GetFFlagLuaAppSortHideSeeAll);
local l_GetFFlagLuaAppSortSubtitlesEnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagLuaAppSortSubtitlesEnabled;
local l_GetFFlagLuaAppUseTooltipsFromSort_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagLuaAppUseTooltipsFromSort;
local l_GetFFlagLuaAppSortTooltipEnableVR_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagLuaAppSortTooltipEnableVR;
local l_GetFFlagTenFootUiSupportSortHeaderTooltip_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagTenFootUiSupportSortHeaderTooltip;
local l_GetFFlagTenFootUiSupportSortSubtitle_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagTenFootUiSupportSortSubtitle;
local l_GetUIBloxEnableFontNameMapping_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).UIBlox.GetUIBloxEnableFontNameMapping;
local v62 = require(l_Modules_0.Personalization.Flags.GetFFlagLuaAppFixHideSeeAllRefresh);
local v63 = require(l_Modules_0.Personalization.Flags.FFlagLuaAppLinkSortTitle);
local l_FFlagLuaAppRefactorOpenGameDetail_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppRefactorOpenGameDetail;
local l_FFlagLuaAppFixNavigationUidLogging_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppFixNavigationUidLogging;
local v66 = v1.PureComponent:extend("GameSortGridRow");
v66.validateProps = v4.strictInterface({
    sortName = v4.string, 
    sortIndex = v4.optional(v4.number), 
    sortIndexOnPage = v4.number, 
    itemRowData = v4.optional(v4.table), 
    omniRecommendationsPageType = v4.optional(v4.string), 
    gameAnalytics = v4.optional(v4.any), 
    scrollViewPositionChangedSignal = v4.optional(v4.any), 
    context = v4.string, 
    sortPageId = v4.optional(v4.string), 
    isOmni = v4.optional(v4.boolean), 
    linkPath = if not v63 then nil else v4.optional(v4.string), 
    useGridTiles = v4.optional(v4.boolean), 
    playerCountStyle = v4.optional(v4.string), 
    isSponsoredFooterAllowed = v4.optional(v4.boolean), 
    componentType = v4.optional(v4.string), 
    hideSeeAll = if not v55() then nil else v4.optional(v4.boolean), 
    gameTileLayoutType = v4.string, 
    infoText = if not l_GetFFlagLuaAppUseTooltipsFromSort_0() then nil else v4.optional(v4.string), 
    endTimestamp = if not v53 then nil else v4.optional(v4.number), 
    countdownString = if not v53 then nil else v4.optional(v4.string), 
    playButtonStyle = if not l_FFlagLuaAppPlayButtonStyle_0 then nil else v4.optional(v4.string), 
    sort = v4.optional(v4.table), 
    gameSortContents = v4.optional(v4.table), 
    currentPageName = if not v51() then v4.string else nil, 
    screenSize = if not v54() then nil else v4.Vector2, 
    navigateToSort = v4.callback, 
    navigateToOmniSort = v4.callback, 
    openGameDetails = if not l_FFlagLuaAppRefactorOpenGameDetail_0 then nil else v4.callback, 
    gridCarouselSeeAllTilesEnabled = if not l_GetFFlagTenFootUiGameCarousel_0() then nil else v4.optional(v4.boolean), 
    navigation = if v51() or l_FFlagLuaAppRefactorOpenGameDetail_0 then v4.any else nil, 
    onActivateTooltip = if not l_GetFFlagLuaAppSortTooltipEnableVR_0() then nil else v4.optional(v4.callback), 
    navigateToSortLinkWebView = if not v63 then nil else v4.optional(v4.callback), 
    horizontalMargin = if not l_GetFFlagTenFootUiGameCarousel_0() then nil else v4.optional(v4.number), 
    headerHeight = if not l_GetFFlagGridCarouselHeaderHeightFix_0() then nil else v4.optional(v4.number), 
    headerPadding = if not l_GetFFlagGridCarouselHeaderHeightFix_0() then nil else v4.optional(v4.number), 
    subtitleHeight = if not l_GetFFlagTenFootUiSupportSortSubtitle_0() then nil else v4.optional(v4.number), 
    subtitlePadding = if not l_GetFFlagTenFootUiSupportSortSubtitle_0() then nil else v4.optional(v4.number), 
    gridColumns = if not l_GetFFlagTenFootUiSeeAll_0() then nil else v4.number, 
    scrollableMaxTilesPerRow = if not l_GetFFlagTenFootUiSeeAll_0() then nil else v4.number, 
    networking = v4.callback, 
    eventIngest = v4.any, 
    appAnalytics = v4.any
});
v66.getGameSortId = function(v67)
    local l_sort_0 = v67.props.sort;
    local l_isOmni_0 = v67.props.isOmni;
    if l_sort_0 ~= nil then
        if not l_isOmni_0 then
            return l_sort_0.gameSetTypeId;
        else
            return l_sort_0.topicId;
        end;
    else
        return nil;
    end;
end;
v66.getGameSetTargetId = function(v70)
    local l_sort_1 = v70.props.sort;
    if not v70.props.isOmni and l_sort_1 ~= nil then
        return l_sort_1.gameSetTargetId;
    else
        return nil;
    end;
end;
v66.init = function(v72)
    v72.containerRef = v1.createRef();
    if v63 then
        v72.navigateToLink = function()
            v72.props.navigateToSortLinkWebView(v72.props.linkPath, v72.props.context, not not v72.props.sort and v72.props.sort.displayName or "", v72:getGameSortId());
        end;
    end;
    if v54() then
        v72.scrollingFrameRef = v1.createRef();
    end;
    v72.sendGameImpressions = function(v73)
        if v72.props.gameSortContents then
            v36.sendFromTopicContents(v72.props.eventIngest, v72.props.appAnalytics, v73, v72.props.gameSortContents.entries, v72.props.context, v72:getGameSortId(), v72.props.sortIndexOnPage, v72.props.itemRowData, v72:getGameSetTargetId(), if not v72.props.isOmni then v72.props.sortPageId else nil, nil, v72.props.useGridTiles, v72.props.componentType);
            return ;
        else
            return ;
        end;
    end;
    v72.onSeeAll = function()
        local l_navigateToSort_0 = v72.props.navigateToSort;
        local l_sort_2 = v72.props.sort;
        local l_gameAnalytics_0 = v72.props.gameAnalytics;
        local l_sortIndexOnPage_0 = v72.props.sortIndexOnPage;
        local l_isOmni_1 = v72.props.isOmni;
        if l_sort_2 == nil then
            return ;
        else
            if not l_isOmni_1 then
                l_navigateToSort_0(v72.props.sortName, v72.props.sortPageId, v72.props.context);
            else
                v72.props.navigateToOmniSort(v72.props.sortPageId, v72.props.sortIndex, v72.props.sortName, v72.props.context);
            end;
            l_gameAnalytics_0.reportSeeAllWithId(v72:getGameSortId(), v72:getGameSetTargetId(), l_sortIndexOnPage_0);
            return ;
        end;
    end;
    if not v62() then
        v72.showSeeAll = not v55() and true or not v72.props.hideSeeAll;
    else
        v72.getShowSeeAll = function()
            return not v72.props.hideSeeAll;
        end;
    end;
    local v79 = if not v62() then not v55() or v72.showSeeAll else v72.getShowSeeAll();
    if v52() then
        v72.getTileCount = function()
            local v80 = l_GetFFlagTenFootUiGameCarousel_0() and v72.props.gridCarouselSeeAllTilesEnabled;
            local l_gameSortContents_0 = v72.props.gameSortContents;
            local v82 = not not l_gameSortContents_0 and l_gameSortContents_0.entries or {};
            local v83 = nil;
            if (not v80 or not l_GetFFlagTenFootUiSeeAll_0()) or not v79 then
                if not v82 then
                    v83 = 0;
                else
                    return #v82;
                end;
            else
                v83 = math.min(not v82 and 0 or #v82, v72.props.scrollableMaxTilesPerRow);
                if v72.props.gridColumns < v83 then
                    return v83 + 1;
                end;
            end;
            return v83;
        end;
    end;
    if l_FFlagLuaAppRefactorOpenGameDetail_0 then
        v72.navigateToGameDetails = function(v84, v85)
            v72.props.openGameDetails(v84, v85, v72.props.navigation);
        end;
    end;
    v72.reportGameDetailOpened = function(v86, v87)
        if v86 then
            local l_sort_3 = v72.props.sort;
            local l_gameSortContents_1 = v72.props.gameSortContents;
            local l_gameAnalytics_1 = v72.props.gameAnalytics;
            local v91 = if not v51() then v72.props.currentPageName else v72.props.navigation.state.routeName;
            if not (l_gameSortContents_1 ~= nil) or l_sort_3 == nil then
                return ;
            else
                local l_entries_0 = l_gameSortContents_1.entries;
                local v93 = l_entries_0[v86];
                if v93 then
                    l_gameAnalytics_1.reportOpenGameDetailWithId(v93.placeId, v72:getGameSortId(), v72:getGameSetTargetId(), v72.props.sortIndexOnPage, v86, #l_entries_0, v93.isSponsored, v93.universeId, v91, if not l_FFlagLuaAppFixNavigationUidLogging_0 then nil else v87);
                    return ;
                else
                    l_mutedError_0("GameSortGridRow.reportGameDetailOpened requires a valid entry");
                    return ;
                end;
            end;
        else
            return ;
        end;
    end;
    v72.reportExperienceLaunched = function(v94, v95)
        l_gamePlayIntent_0(v72.props.eventIngest, v32.AnalyticsContext.ExperienceTile, {
            placeId = v94.placeId, 
            rootPlaceId = tonumber(v94.placeId), 
            sortIndex = tostring(v72.props.sortIndexOnPage), 
            sortEntryIndex = tostring(v94.index), 
            referralSource = v95, 
            gameSetTypeId = v72:getGameSortId(), 
            gameSetTargetId = v72:getGameSetTargetId()
        });
    end;
    v72.onSelectionChanged = function(_)
        if v72.props.scrollViewPositionChangedSignal then
            v72.props.scrollViewPositionChangedSignal:fire();
        end;
    end;
    if v54() then
        v72.sendScrollEvent = function(v97, v98, v99)
            if v72.isMounted and v72.scrollingFrameRef.current then
                local l_ScrollingDirection_0 = v72.scrollingFrameRef.current.ScrollingDirection;
                local v101 = 0;
                if l_ScrollingDirection_0 == Enum.ScrollingDirection.X then
                    v101 = v72.scrollingFrameRef.current.AbsoluteSize.X;
                elseif l_ScrollingDirection_0 == Enum.ScrollingDirection.Y then
                    v101 = v72.scrollingFrameRef.current.AbsoluteSize.Y;
                else
                    l_mutedError_0((("Direction %* is an unsupported option for feedScroll event"):format(l_ScrollingDirection_0.Name)));
                end;
                local v102 = v72:getGameSortId();
                if not v102 then
                    l_mutedError_0("There must be a non-nil value for gameSetTypeId for a horizontal feedScroll event");
                end;
                v41(v72.props.eventIngest, v72.props.context, l_ScrollingDirection_0, {
                    distance = v97, 
                    screenSizeX = v72.props.screenSize.X, 
                    screenSizeY = v72.props.screenSize.Y, 
                    scrollAreaSize = v101, 
                    scrollDepth = if v101 > 0 then v97 / v101 else nil, 
                    startDepth = if v101 > 0 then v99 / v101 else nil, 
                    startPos = v99, 
                    scrollDuration = v98, 
                    sortPos = v72.props.sortIndexOnPage, 
                    gameSetTypeId = v102, 
                    gameSetTargetId = v72:getGameSetTargetId()
                });
                return ;
            else
                return ;
            end;
        end;
    end;
    if l_GetFFlagLuaAppSortTooltipEnableVR_0() then
        v72.onActivateTooltip = function()
            if not (not v72.isMounted or not v72.props.infoText) then
                v72.props.onActivateTooltip(v72.props.sort.displayName, v72.props.infoText);
            end;
        end;
    end;
end;
if not (not v54() and not l_GetFFlagLuaAppSortTooltipEnableVR_0()) then
    v66.didMount = function(v103)
        v103.isMounted = true;
    end;
end;
if not (not v54() and not l_GetFFlagLuaAppSortTooltipEnableVR_0()) then
    v66.willUnmount = function(v104)
        v104.isMounted = false;
    end;
end;
v66.renderContent = function(v105)
    local l_sort_4 = v105.props.sort;
    local l_gameSortContents_2 = v105.props.gameSortContents;
    local l_context_0 = v105.props.context;
    local v109 = not not l_gameSortContents_2 and l_gameSortContents_2.entries or {};
    local v110 = l_GetFFlagTenFootUiGameCarousel_0() and v105.props.gridCarouselSeeAllTilesEnabled;
    local v111 = UDim.new(1, 60);
    local l_Default_0 = l_LayoutConfig_0.Kind.Experiences.Default;
    if not v105.props.useGridTiles then
        if not v44() then
            v111 = if not v50() then UDim.new(1, 82) else if v110 then if l_GetUIBloxEnableFontNameMapping_0() then UDim.new(1, 98) else UDim.new(1, 96) else UDim.new(1, 82);
        else
            l_Default_0 = l_LayoutConfig_0.Kind.Experiences.WithFooter;
        end;
    else
        l_Default_0 = if v105.props.gameTileLayoutType == "Event" then l_LayoutConfig_0.Kind.Experiences.EventTile else if v105.props.gameTileLayoutType == "Wide" then l_LayoutConfig_0.Kind.Experiences.GridTile else l_LayoutConfig_0.Kind.Experiences.WithFooter;
        v111 = nil;
    end;
    local v113 = "gameGridRowImpression_" .. tostring(v105.props.sortName);
    return l_withLocalization_0({
        learnMore = if not v63 then nil else "Feature.GameDetails.Label.LearnMore", 
        seeAll = "Feature.Home.ActionSeeAll", 
        sponsoredDisclosure = "CoreScripts.Ads.Label.SponsoredAdsDisclosureStatic"
    })(function(v114)
        local v115 = nil;
        if not v52() then
            if not v110 or not l_GetFFlagTenFootUiSeeAll_0() then
                v115 = not v109 and 0 or #v109;
            else
                v115 = math.min(not v109 and 0 or #v109, v105.props.scrollableMaxTilesPerRow);
                if v105.props.gridColumns < v115 then
                    v115 = v115 + 1;
                end;
            end;
        else
            v115 = v105.getTileCount();
        end;
        local v116 = nil;
        local v117 = nil;
        if v105.props.infoText and v105.props.infoText ~= "" then
            v116 = true;
            v117 = v105.props.infoText;
        else
            local v118;
            if l_sort_4 then
                v118 = true;
                if not (l_sort_4.topicId ~= v39.GameGridTopicIds.Sponsored) then
                    goto label1;
                end;
            end;
            v118 = false;
            ::label1::;
            v116 = v118;
            v117 = if not l_GetFFlagLuaAppSortSubtitlesEnabled_0() then v114.sponsoredDisclosure else if v116 then v114.sponsoredDisclosure else nil;
        end;
        local v119;
        if not l_GetFFlagLuaAppSortSubtitlesEnabled_0() then
            v119 = nil;
        else
            if not (not l_sort_4 or not l_sort_4.subtitle) then
                v119 = true;
                if not (l_sort_4.subtitle == "") then
                    goto label0;
                end;
            end;
            v119 = false;
        end;
        ::label0::;
        local v120 = if not v62() then not v55() or v105.showSeeAll else v105.getShowSeeAll();
        local v121 = nil;
        local v122 = nil;
        if not v63 or not v120 then
            v121 = v114.seeAll;
        elseif not v105.props.linkPath then
            v122 = v105.onSeeAll;
            v121 = v114.seeAll;
        else
            v122 = v105.navigateToLink;
            v121 = v114.learnMore;
        end;
        local v125 = {
            scrollable = v110, 
            clipsDescendants = false, 
            headerText = if not v110 then ((v116 or v119) or v63 and v105.props.linkPath) and function(v123)
                return v2.createElement(v35, {
                    layoutOrder = 1, 
                    headerMargin = v123.margin, 
                    headerWidth = 0, 
                    onSeeAll = if not v63 then if v120 then v105.onSeeAll else nil else v122, 
                    title = not not l_sort_4 and l_sort_4.displayName or "", 
                    subtitleText = if ((not not l_GetFFlagLuaAppSortSubtitlesEnabled_0() and v53) and v105.props.endTimestamp) and v105.props.countdownString then v2.createElement(l_CountdownSubtitleText_0, {
                        endTimestamp = v105.props.endTimestamp, 
                        defaultString = not not l_sort_4 and l_sort_4.subtitle or "", 
                        formatStringHoursMinutes = v105.props.countdownString
                    }) else if l_GetFFlagLuaAppSortSubtitlesEnabled_0() then l_sort_4 and l_sort_4.subtitle or "" else nil, 
                    buttonText = if not v63 then v114.seeAll else v121, 
                    tooltipHoverText = v117, 
                    onActivateTooltip = if not not l_GetFFlagLuaAppSortTooltipEnableVR_0() and l_IsVRAppBuild_0() then v105.onActivateTooltip else nil, 
                    supportVR = not not l_GetFFlagLuaAppSortTooltipEnableVR_0() or nil, 
                    onActivateTitle = if not not v63 and v105.props.linkPath then v105.navigateToLink else nil
                });
            end or (l_sort_4 and l_sort_4.displayName or "") else function(v124)
                return v1.createElement(l_TenFootUiGridCarouselHeader_0, {
                    text = not not l_sort_4 and l_sort_4.displayName or "", 
                    margin = v124.margin, 
                    tooltipHoverText = if not not l_GetFFlagTenFootUiSupportSortHeaderTooltip_0() and v116 then v117 else nil, 
                    subtitleText = if not not l_GetFFlagTenFootUiSupportSortSubtitle_0() and v119 then l_sort_4.subtitle else nil, 
                    subtitleHeight = if not not l_GetFFlagTenFootUiSupportSortSubtitle_0() and v119 then v105.props.subtitleHeight else nil
                });
            end, 
            buttonText = if not v110 and v120 then v114.seeAll else nil, 
            onButtonClick = if not v110 then if v63 then v122 else v105.onSeeAll else nil
        };
        if not v119 then
            if l_GetFFlagGridCarouselHeaderHeightFix_0() then
                v125 = v5.Dictionary.join(v125, {
                    headerHeight = (v105.props.headerHeight or 0) + (v105.props.headerPadding or 0), 
                    headerPadding = 0
                });
            end;
        else
            local v126 = v105.props.headerHeight or 0;
            v126 = 50;
            if v53 then
                v126 = v126 + 8;
            end;
            if not (not l_GetFFlagTenFootUiSupportSortSubtitle_0() or not v110) then
                v126 = (((v105.props.headerHeight or 0) + (v105.props.headerPadding or 0)) + (v105.props.subtitleHeight or 0)) + (v105.props.subtitlePadding or 0);
            end;
            v125 = v5.Dictionary.join(v125, {
                headerHeight = v126
            });
        end;
        return v1.createElement(v12.FitFrameVertical, {
            width = UDim.new(1, 0), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            [v1.Ref] = v105.containerRef, 
            [v1.Event.SelectionChanged] = v105.onSelectionChanged
        }, {
            GameSortImpressionsDetector = v1.createElement(v34, {
                parentRef = v105.containerRef, 
                pageContext = l_context_0, 
                impressionsTag = v113, 
                scrollViewPositionChangedSignal = v105.props.scrollViewPositionChangedSignal, 
                sendGameImpressions = v105.sendGameImpressions, 
                dataUpdatedTimestamp = not not l_gameSortContents_2 and l_gameSortContents_2.updatedTimestamp or nil
            }), 
            ScrollDetector = if not not v54() and v110 then v1.createElement(v40, {
                scrollingFrameRef = v105.scrollingFrameRef, 
                sendScrollEvent = v105.sendScrollEvent
            }) else nil, 
            UIPadding = if not v110 then nil else v1.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, v105.props.horizontalMargin), 
                PaddingRight = UDim.new(0, v105.props.horizontalMargin)
            }), 
            GridCarousel = v1.createElement(l_ResponsiveCarousel_0, v5.Dictionary.join(v125, {
                layoutOrder = v105.props.sortIndexOnPage, 
                kind = l_Default_0, 
                relativeHeight = if not v44() then v111 else nil, 
                data = v109, 
                getItemCount = function(_, v128)
                    if not v110 then
                        return (math.min(v115, v128.columns));
                    else
                        return v115;
                    end;
                end, 
                getItem = function(v129, v130, _)
                    if v130 <= v115 then
                        local v132;
                        if (not v110 or not l_GetFFlagTenFootUiSeeAll_0()) or not v120 then
                            v132 = false;
                        else
                            v132 = false;
                            if v130 == v115 then
                                v132 = v105.props.gridColumns < v130;
                            end;
                        end;
                        if not v132 then
                            if v129[v130] then
                                return v6.assign({
                                    index = v130, 
                                    count = #v129
                                }, v129[v130]);
                            end;
                        else
                            return {
                                isSeeAllTile = true
                            };
                        end;
                    end;
                    return nil;
                end, 
                renderItem = function(v133)
                    local l_sortIndexOnPage_1 = v105.props.sortIndexOnPage;
                    if not v133.isSeeAllTile then
                        return v1.createElement(l_AppGameTile_0, {
                            entry = v133, 
                            index = v133.index, 
                            layoutOrder = l_sortIndexOnPage_1, 
                            reportGameDetailOpened = v105.reportGameDetailOpened, 
                            friendFooterEnabled = true, 
                            hideGameStats = false, 
                            showFriendActivity = v105.props.context == l_AppPage_0.Home, 
                            impressionsTag = v113, 
                            useHoverTile = not v110, 
                            reportExperienceLaunched = v105.reportExperienceLaunched, 
                            launchExperienceEventContext = v32.AnalyticsContext.ExperienceTile, 
                            useGridTile = v105.props.useGridTiles, 
                            playerCountStyle = v105.props.playerCountStyle, 
                            isSponsoredFooterAllowed = v105.props.isSponsoredFooterAllowed, 
                            gameTileLayoutType = v105.props.gameTileLayoutType, 
                            topicId = if not not v105.props.isOmni and l_sort_4 then l_sort_4.topicId else nil, 
                            navigateToGameDetails = if not l_FFlagLuaAppRefactorOpenGameDetail_0 then nil else v105.navigateToGameDetails, 
                            playButtonStyle = if not l_FFlagLuaAppPlayButtonStyle_0 then nil else v105.props.playButtonStyle
                        });
                    else
                        return v1.createElement(v33, {
                            title = v114.seeAll, 
                            onSeeAll = v105.onSeeAll
                        });
                    end;
                end, 
                scrollingFrameRef = if not v54() then nil else v105.scrollingFrameRef
            }))
        });
    end);
end;
v66.render = function(v135)
    if not (not v52() or not (l_GetFFlagTenFootUiGameCarousel_0() and v135.props.gridCarouselSeeAllTilesEnabled)) and v135.props.gridColumns < v135.getTileCount() then
        return v2.createElement(v38.OnSeeAllControllerBarNavigateWrapper, {
            onSeeAll = v135.onSeeAll
        }, v135:renderContent());
    else
        return v135:renderContent();
    end;
end;
v66 = v3.connect(function(v136, v137)
    local v138 = nil;
    local v139 = not not v136.Personalization.TopicContents and v136.Personalization.TopicContents[v137.sortName] or nil;
    if not v137.isOmni then
        v138 = v136.GameSorts[v137.sortName];
    elseif v136.OmniRecommendationsSorts[v137.omniRecommendationsPageType] then
        v138 = v136.OmniRecommendationsSorts[v137.omniRecommendationsPageType][v137.sortIndex];
    end;
    return {
        sort = if not not l_GetFFlagApolloClientFetchExperiences_0() and v137.sort then v137.sort else v138, 
        gameSortContents = if not not l_GetFFlagApolloClientFetchExperiences_0() and v137.gameSortContents then v137.gameSortContents else v139, 
        currentPageName = if v51() then nil else v37(v136), 
        screenSize = if not v54() then nil else v136.ScreenSize
    };
end, function(v140)
    return {
        navigateToSort = function(v141, v142, v143)
            v140(l_NavigateDown_0({
                name = l_AppPage_0.GamesList, 
                detail = v141, 
                extraProps = {
                    sortPageId = v142, 
                    pageContext = v143
                }
            }));
        end, 
        navigateToOmniSort = function(v144, v145, v146, v147)
            v140(l_NavigateDown_0({
                name = l_AppPage_0.GamesList, 
                detail = v146, 
                extraProps = {
                    sortPageId = v144, 
                    sortIndex = v145, 
                    isOmni = true, 
                    pageContext = v147
                }
            }));
        end, 
        openGameDetails = if not l_FFlagLuaAppRefactorOpenGameDetail_0 then nil else function(v148, v149, v150)
            v140(l_OpenGameDetails_0(v148, v150, v149));
        end
    };
end)(v66);
if l_GetFFlagTenFootUiGameCarousel_0() then
    v66 = l_RoactAppPolicy_0.connect(function(v151, _)
        return {
            gridCarouselSeeAllTilesEnabled = v151.getGridCarouselSeeAllTilesEnabled()
        };
    end)(v66);
end;
if not (not l_GetFFlagTenFootUiGameCarousel_0() and not l_GetFFlagLuaAppSortTooltipEnableVR_0()) then
    local l_v66_0 = v66;
    v66 = function(v154)
        local l_v154_0 = v154;
        if l_GetFFlagLuaAppSortTooltipEnableVR_0() then
            local v156 = l_useDispatch_0();
            local l_v156_0 = v156 --[[ copy: 2 -> 4 ]];
            local function v158()
                return l_v156_0(l_CloseCentralOverlay_0());
            end;
            local l_v158_0 = v158 --[[ copy: 3 -> 5 ]];
            l_v154_0 = v5.Dictionary.join(l_v154_0, {
                onActivateTooltip = v2.useCallback(function(v160, v161)
                    l_v156_0(v42(v160, v161, l_v158_0));
                end, {
                    v158
                })
            });
        end;
        if v63 then
            l_v154_0 = v5.Dictionary.join(l_v154_0, {
                navigateToSortLinkWebView = v43()
            });
        end;
        if l_GetFFlagTenFootUiGameCarousel_0() then
            local v162 = l_useDesignTokens_0();
            l_v154_0 = v5.Dictionary.join(l_v154_0, {
                horizontalMargin = v162.Global.Space_800
            });
            if l_GetFFlagGridCarouselHeaderHeightFix_0() then
                l_v154_0 = v5.Dictionary.join(l_v154_0, {
                    headerHeight = v162.Global.Size_350, 
                    headerPadding = v162.Global.Space_100, 
                    subtitleHeight = if not l_GetFFlagTenFootUiSupportSortSubtitle_0() then nil else v162.Global.Size_200, 
                    subtitlePadding = if not l_GetFFlagTenFootUiSupportSortSubtitle_0() then nil else v162.Global.Space_50
                });
            end;
            if l_GetFFlagTenFootUiSeeAll_0() then
                local v163 = l_useResponsiveLayout_0("columns", l_LayoutConfig_0.Kind.Experiences.Default) or 1;
                l_v154_0 = v5.Dictionary.join(l_v154_0, {
                    gridColumns = v163, 
                    scrollableMaxTilesPerRow = l_useResponsiveLayout_0("scrollableMaxTilesPerRow", l_LayoutConfig_0.Kind.Experiences.Default) or v163
                });
            end;
        end;
        return v1.createElement(l_v66_0, l_v154_0);
    end;
end;
if not (not v51() and not l_FFlagLuaAppRefactorOpenGameDetail_0) then
    v66 = l_withNavigation_0(v66);
end;
return l_RoactServices_0.connect({
    networking = l_RoactNetworking_0, 
    eventIngest = l_AppEventIngestService_0, 
    appAnalytics = l_RoactAnalytics_0
})(v66);
