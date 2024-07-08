local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Players_0 = game:GetService("Players");
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.RoactRodux);
local v5 = require(l_CorePackages_0.UIBlox);
local l_LoadingStateContainer_0 = v5.App.Container.LoadingStateContainer;
local l_RetrievalStatus_0 = v5.App.Loading.Enum.RetrievalStatus;
local v8 = require(l_CorePackages_0.RoactNavigation);
local v9 = require(l_CorePackages_0.Packages.t);
local v10 = require(l_CorePackages_0.tutils);
local v11 = require(l_CorePackages_0.Cryo);
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local v13 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local l_AppStartupSequenceTag_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppStartupSequenceTag;
local l_AppSessionService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppSessionService;
local l_AppLogging_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppLogging;
local l_AppPrefetch_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppPrefetch;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v19 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local l_AppOmniRecommendationsRequest_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppOmniRecommendationsRequest;
local v21 = require(l_Modules_0.LuaApp.Services.AppEventIngestService);
local v22 = require(l_Modules_0.LuaApp.AppPage);
local v23 = require(l_Modules_0.LuaApp.Components.Games.TokenRefreshComponent);
local v24 = require(l_Modules_0.LuaApp.Components.Games.OmniRecommendationsRefreshComponent);
local v25 = require(l_Modules_0.LuaApp.Constants);
local v26 = require(l_Modules_0.LuaApp.Promise);
local v27 = require(l_Modules_0.LuaApp.Thunks.SetNetworkingErrorToast);
local v28 = require(l_Modules_0.LuaApp.Thunks.FetchHomePageData);
local v29 = require(l_Modules_0.LuaApp.Enum.RetrievalStatus);
local v30 = require(l_Modules_0.LuaApp.Thunks.Omni.ApiFetchOmniRecommendations);
local v31 = require(l_Modules_0.LuaApp.Thunks.RefreshGameSorts);
local v32 = require(l_Modules_0.LuaApp.Actions.RefreshSiteAlertInfo);
local v33 = require(l_Modules_0.Personalization.OmniFeed.DataStore.AddLocalOmniItems);
local v34 = require(l_Modules_0.Personalization.OmniFeed.OmniFeedConstants);
local v35 = require(l_Modules_0.Personalization.OmniFeed.OmniFeedTypes);
local v36 = require(l_Modules_0.Personalization.Sessions.PageSessionManager);
local v37 = require(l_Modules_0.Personalization.Sessions.setHomePageSessionInfo);
local _ = require(l_Modules_0.Personalization.DataStoreTypes);
local v39 = require(l_Modules_0.Personalization.OmniFeed.FeedViews.OmniFeedViewSelector);
local v40 = require(l_Modules_0.Personalization.OmniFeed.FeedViews.OmniFeedViewLoadMore);
local v41 = require(l_Modules_0.Personalization.Analytics.ScrollingPerfTracker);
local v42 = require(l_Modules_0.Personalization.Analytics.feedScroll);
local v43 = require(l_Modules_0.LuaApp.Components.Banner.useBannerContainer);
local v44 = require(l_Modules_0.LuaApp.Enum.OptionalContactMethodUpsellTypes);
local v45 = require(l_Modules_0.Personalization.OmniFeed.DataStore.SetOmniFeedItemsRowData);
local v46 = require(l_Modules_0.Personalization.OmniFeed.DataStore.ClearOmniFeedItemsRowData);
local v47 = game:DefineFastInt("LuaAppHomeFeedProfilePosition", 1);
local v48 = game:DefineFastInt("LuaAppHomeFeedFriendsPosition", 1);
local v49 = game:DefineFastInt("LuaAppHomeFeedUpsellCardPosition", 1);
local v50 = require(l_Modules_0.Personalization.Flags.FFlagLuaAppConsoleSupportRFY);
local v51 = require(l_Modules_0.Personalization.Flags.FFlagOmniItemsRowDataEnabled);
local v52 = require(l_Modules_0.LuaApp.Flags.GetFFlagUseHomeOmniFeedDataLoader);
local v53 = require(l_Modules_0.LuaApp.Flags.GetFFlagFixFetchNextOmniWithoutPageToken);
local v54 = require(l_Modules_0.Personalization.Flags.GetFFlagUseUpsellCardOmniFeedItem);
local v55 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableHomePageUpsellCard);
local v56 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableHomePageEmailUpsellCard);
local l_IsPrefetchOneCopyEnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).IsPrefetchOneCopyEnabled;
local l_Home_0 = v22.Home;
local v59 = v3.PureComponent:extend("HomeOmniFeed");
v59.validateProps = v9.strictInterface({
    hasNextPage = v9.optional(v9.boolean), 
    homeOmniFetchStatus = if not v53() then nil else v9.optional(v9.string), 
    localUserId = v9.string, 
    homePageDataStatus = v9.string, 
    omniFeedItems = v9.optional(v9.table), 
    hasLocalOmniItems = v9.optional(v9.boolean), 
    recommendationsRequestId = v9.optional(v9.string), 
    omniSessionId = v9.optional(v9.string), 
    omniItemsGlobalLayoutData = v9.optional(v9.table), 
    screenSize = v9.Vector2, 
    upsellCardVariation = v9.optional(v9.table), 
    addLocalFeedItems = v9.callback, 
    refresh = v9.callback, 
    loadNext = v9.optional(v9.callback), 
    fetchHomePageData = v9.callback, 
    setOmniFeedItemsRowData = if not v51 then nil else v9.callback, 
    clearOmniFeedItemsRowData = if not v51 then nil else v9.callback, 
    isOmni = v9.optional(v9.boolean), 
    appAnalytics = v9.any, 
    networking = v9.any, 
    loggingProtocol = v9.optional(v9.any), 
    prefetchProtocol = v9.optional(v9.any), 
    sessionService = v9.optional(v9.any), 
    appStartupSequence = v9.any, 
    eventIngest = v9.any, 
    omniRecommendationsRequest = if not l_IsPrefetchOneCopyEnabled_0() then nil else v9.any, 
    navigation = v9.any, 
    header = v9.optional(v9.any), 
    headerHeight = v9.number
});
local function _(v60)
    local v61 = false;
    if v60 ~= v29.NotStarted then
        v61 = v60 ~= v29.Fetching;
    end;
    return v61;
end;
local function _(v63)
    local v64 = true;
    if v63 ~= v44.ContactMethodPhoneNumber then
        v64 = true;
        if v63 ~= v44.ContactMethodPhoneNumberVoiceOptIn then
            v64 = true;
            if v63 ~= v44.ContactMethodPhoneNumberEmailVerticalLayout then
                v64 = true;
                if v63 ~= v44.ContactMethodPhoneNumberEmailHorizontalLayout then
                    v64 = v56() and v63 == v44.ContactMethodEmail;
                end;
            end;
        end;
    end;
    return v64;
end;
v59.init = function(v66)
    v66.props.loggingProtocol:logEventOnce("home_page_container_init");
    v66.isMounted = false;
    v66.loadNext = function()
        local l_hasNextPage_0 = v66.props.hasNextPage;
        local l_loadNext_0 = v66.props.loadNext;
        if not v53() then
            if not (not l_hasNextPage_0 or not l_loadNext_0) then
                return l_loadNext_0(v66.props.networking, v66.props.omniRecommendationsRequest);
            end;
        else
            local l_homeOmniFetchStatus_0 = v66.props.homeOmniFetchStatus;
            if not (not l_hasNextPage_0 or not l_loadNext_0) and l_homeOmniFetchStatus_0 ~= v29.Fetching then
                return l_loadNext_0(v66.props.networking, v66.props.omniRecommendationsRequest);
            end;
        end;
        return v26.resolve();
    end;
    v66.fetchHomePageData = function()
        return v66.props.fetchHomePageData(v66.props.networking, v66.props.omniRecommendationsRequest, v66.props.appAnalytics, v66.props.localUserId, v66.props.isOmni, v66.props.loggingProtocol, v66.props.prefetchProtocol);
    end;
    v66.scrollingFrameRef = v3.createRef();
    v66.sendScrollEvent = function(v70, v71, v72)
        local l_Y_0 = Enum.ScrollingDirection.Y;
        if l_Y_0 then
            local v74 = 0;
            if v66.scrollingFrameRef.current then
                v74 = v66.scrollingFrameRef.current.AbsoluteSize.Y;
            end;
            v42(v66.props.eventIngest, l_Home_0, l_Y_0, {
                distance = v70, 
                screenSizeX = v66.props.screenSize.X, 
                screenSizeY = v66.props.screenSize.Y, 
                scrollAreaSize = v74, 
                scrollDepth = if v74 > 0 then v70 / v74 else nil, 
                startDepth = if v74 > 0 then v72 / v74 else nil, 
                startPos = v72, 
                scrollDuration = v71
            });
        end;
    end;
    v66.logHomePageInteractive = function(v75)
        if v66.isMounted then
            if v75 then
                if not v66.props.appStartupSequence.isInteractive then
                    if v75.AbsoluteSize.X > 1 and v75.AbsoluteSize.Y > 1 then
                        v66.props.loggingProtocol:logEventOnce("home_page_interactive_legacy");
                        task.defer(function()
                            v66.props.loggingProtocol:logEventOnce("home_page_interactive");
                        end);
                        v66.props.appStartupSequence:setInteractive();
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
    v66.setHomePageSessionInfoFunc = function()
        v37(v66.props.sessionService, v66.props.recommendationsRequestId, v66.props.omniSessionId);
    end;
    v66.insertLocalFeedItem = function(v76, v77, v78, v79, v80)
        table.insert(v76, {
            orderIndex = v77, 
            treatmentType = v78, 
            treatmentProps = v79, 
            numberOfRows = if not v51 then nil else v80
        });
    end;
    v66.createLocalFeedItems = function()
        local l_homePageDataStatus_0 = v66.props.homePageDataStatus;
        local v82 = false;
        if l_homePageDataStatus_0 ~= v29.NotStarted then
            v82 = l_homePageDataStatus_0 ~= v29.Fetching;
        end;
        if v82 then
            v82 = {};
            if v47 > 0 then
                v66.insertLocalFeedItem(v82, v47, v35.UserInfo, {}, if not v51 then nil else 0);
            end;
            if v54() then
                l_homePageDataStatus_0 = v55();
                if l_homePageDataStatus_0 then
                    l_homePageDataStatus_0 = v66.props.upsellCardVariation;
                    if l_homePageDataStatus_0 then
                        local l_upsellCardType_0 = v66.props.upsellCardVariation.upsellCardType;
                        l_homePageDataStatus_0 = true;
                        if l_upsellCardType_0 ~= v44.ContactMethodPhoneNumber then
                            l_homePageDataStatus_0 = true;
                            if l_upsellCardType_0 ~= v44.ContactMethodPhoneNumberVoiceOptIn then
                                l_homePageDataStatus_0 = true;
                                if l_upsellCardType_0 ~= v44.ContactMethodPhoneNumberEmailVerticalLayout then
                                    l_homePageDataStatus_0 = true;
                                    if l_upsellCardType_0 ~= v44.ContactMethodPhoneNumberEmailHorizontalLayout then
                                        l_homePageDataStatus_0 = v56() and l_upsellCardType_0 == v44.ContactMethodEmail;
                                    end;
                                end;
                            end;
                        end;
                        if l_homePageDataStatus_0 then
                            l_homePageDataStatus_0 = v49 > 0;
                        end;
                    end;
                end;
                if l_homePageDataStatus_0 then
                    v66.insertLocalFeedItem(v82, v49, v35.UpsellCard, {});
                end;
            end;
            l_homePageDataStatus_0 = v66.props.omniItemsGlobalLayoutData;
            local l_l_homePageDataStatus_0_0 = l_homePageDataStatus_0;
            if l_l_homePageDataStatus_0_0 then
                l_l_homePageDataStatus_0_0 = true;
                if l_homePageDataStatus_0[v34.GlobalLayoutDataKeys.JYFRefresh] ~= "true" then
                    l_l_homePageDataStatus_0_0 = l_homePageDataStatus_0[v34.GlobalLayoutDataKeys.JYFRefresh] == true;
                end;
            end;
            if not l_l_homePageDataStatus_0_0 and v48 > 0 then
                v66.insertLocalFeedItem(v82, v48, v35.FriendCarousel, {});
            end;
            v66.props.addLocalFeedItems(v82);
            return ;
        else
            return ;
        end;
    end;
    v66.fetchDataIfNeeded = function()
        if v66.props.homePageDataStatus == v29.NotStarted then
            v66.fetchHomePageData();
        end;
    end;
    v66._willFocusListener = v66.props.navigation.addListener(v8.Events.WillFocus, function()
        v66.fetchDataIfNeeded();
    end);
    v66.fetchDataIfNeeded();
    v66.createLocalFeedItems();
end;
v59.render = function(v85)
    local l_homePageDataStatus_1 = v85.props.homePageDataStatus;
    local l_isOmni_0 = v85.props.isOmni;
    local l_l_homePageDataStatus_1_0 = l_homePageDataStatus_1;
    local l_l_l_homePageDataStatus_1_0_0 = l_l_homePageDataStatus_1_0;
    local v90 = false;
    if l_l_l_homePageDataStatus_1_0_0 ~= v29.NotStarted then
        v90 = l_l_l_homePageDataStatus_1_0_0 ~= v29.Fetching;
    end;
    if not (not v90 or v85.props.hasLocalOmniItems) then
        l_l_homePageDataStatus_1_0 = v29.Fetching;
    end;
    return v3.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0
    }, {
        TokenRefreshComponent = not not l_isOmni_0 and v3.createElement(v24, {
            pageType = v25.OmniRecommendationsPageType.PAGE_TYPE_HOME
        }) or v3.createElement(v23, {
            sortToRefresh = v25.GameSortGroups.HomeGames
        }), 
        PageSessionManager = v3.createElement(v36, {
            appPage = l_Home_0, 
            setPageSession = v85.setHomePageSessionInfoFunc
        }), 
        LoadingStateContainer = v3.createElement(l_LoadingStateContainer_0, {
            dataStatus = l_RetrievalStatus_0.fromRawValue(l_l_homePageDataStatus_1_0), 
            onRetry = v85.fetchHomePageData, 
            renderOnLoaded = function()
                return v3.createElement(if not v50 then v39 else v40, {
                    pageContext = l_Home_0, 
                    refresh = function(v91)
                        return v85.props.refresh(v85.props.networking, v85.props.omniRecommendationsRequest, v85.props.isOmni, v91);
                    end, 
                    omniFeedItems = v85.props.omniFeedItems, 
                    impressionsTag = "FEEDITEM_IMPRESSIONS", 
                    onAbsoluteSizeChanged = v85.logHomePageInteractive, 
                    hasNextPage = v85.props.hasNextPage, 
                    loadNext = v85.loadNext, 
                    scrollingFrameRef = v85.scrollingFrameRef, 
                    analyticsContext = v34.EventContext, 
                    header = v85.props.header, 
                    headerHeight = v85.props.headerHeight, 
                    sendScrollEvent = v85.sendScrollEvent
                });
            end
        })
    });
end;
v59.didUpdate = function(v92, v93, _)
    if not ((v92.props.hasLocalOmniItems and v93.omniItemsGlobalLayoutData == v92.props.omniItemsGlobalLayoutData) and v93.homePageDataStatus == v92.props.homePageDataStatus) or v93.upsellCardVariation ~= v92.props.upsellCardVariation then
        v92.createLocalFeedItems();
    end;
    if v92.scrollingPerf then
        v92.scrollingPerf:setScrollingFrame(v92.scrollingFrameRef.current);
    end;
    if not (not v51 or v10.shallowEqual(v92.props.omniFeedItems, v93.omniFeedItems)) then
        v92.props.setOmniFeedItemsRowData(v92.props.omniFeedItems);
    end;
end;
v59.didMount = function(v95)
    v95.isMounted = true;
    v95.logHomePageInteractive(v95.scrollingFrameRef.current);
    if v41 then
        v95.scrollingPerf = v41.new("HomeOmniFeed", {
            loggingProtocol = v95.props.loggingProtocol, 
            analyticsService = v95.props.appAnalytics
        });
        v95.scrollingPerf:setScrollingFrame(v95.scrollingFrameRef.current);
    end;
    if v51 then
        v95.props.setOmniFeedItemsRowData(v95.props.omniFeedItems);
    end;
end;
v59.willUnmount = function(v96)
    if v96.scrollingPerf then
        v96.scrollingPerf:clean();
        v96.scrollingPerf = nil;
    end;
    v96.isMounted = false;
    if v96._willFocusListener ~= nil then
        v96._willFocusListener.remove();
        v96._willFocusListener = nil;
    end;
    if v51 then
        v96.props.clearOmniFeedItemsRowData();
    end;
end;
local v128 = v4.connect(function(v97, v98)
    local v99 = nil;
    local v100 = nil;
    local v101 = nil;
    local v102 = nil;
    local v103 = nil;
    local l_LocalUserId_0 = v97.LocalUserId;
    local v105 = nil;
    local v106 = nil;
    if not l_LocalUserId_0 or l_LocalUserId_0 == "" then
        l_LocalUserId_0 = not not l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.UserId or 0;
    end;
    local v107 = if not not v53() and v98.isOmni then v97.RequestsStatus.OmniRecommendationsRetrievalStatus[v25.OmniRecommendationsPageType.PAGE_TYPE_HOME] else nil;
    if not v52() then
        if v98.isOmni then
            local v108 = v97.OmniRecommendations[v25.OmniRecommendationsPageType.PAGE_TYPE_HOME];
            if v108 then
                v99 = v108.recommendationsId;
                v100 = v108.omniSessionId;
                v101 = v108.nextPageToken;
            end;
        end;
        local v109 = false;
        if v101 ~= nil then
            v109 = false;
            if v101 ~= "" then
                v109 = v98.isOmni;
            end;
        end;
        v103 = v109;
        v109 = v97.Personalization.OrderedOmniItems[l_Home_0];
        v102 = not not v109 and v109.allItems or {};
        v105 = not not v109 and (v109.hasLocalItems or false);
        v106 = v97.Personalization.OmniItemsGlobalLayoutData;
    end;
    return {
        localUserId = tostring(l_LocalUserId_0), 
        homePageDataStatus = v97.Startup.HomePageDataStatus, 
        homeOmniFetchStatus = if not v53() then nil else v107, 
        screenSize = v97.ScreenSize, 
        upsellCardVariation = if not v54() then nil else v97.HomePageUpsellCardVariation, 
        hasNextPage = if not v52() then v103 else nil, 
        recommendationsRequestId = if not v52() then v99 else nil, 
        omniSessionId = if not v52() then v100 else nil, 
        omniFeedItems = if not v52() then v102 else nil, 
        hasLocalOmniItems = if not v52() then v105 else nil, 
        omniItemsGlobalLayoutData = if not v52() then v106 else nil
    };
end, function(v110)
    return {
        addLocalFeedItems = not v52() and function(v111)
            v110(v33(v111, l_Home_0));
        end or nil, 
        loadNext = function(v112, v113)
            return v110(v30(v112, v113, v25.OmniRecommendationsPageType.PAGE_TYPE_HOME, true, nil, v34.OmniRecommendationsRequestIntent.LoadMore));
        end, 
        refresh = function(v114, v115, v116, v117)
            v110(v32());
            return v26.all({
                v110(if not v116 then v31(v114, {
                    v25.GameSortGroups.HomeGames
                }, nil, nil, nil) else v30(v114, v115, v25.OmniRecommendationsPageType.PAGE_TYPE_HOME, nil, nil, v117))
            }):andThen(function(v118)
                return v26.resolve(v118);
            end, function(v119)
                v110(v27(v119));
                return v26.reject(v119);
            end);
        end, 
        fetchHomePageData = function(v120, v121, v122, v123, v124, v125, v126)
            return v110(v28(v120, v121, v122, v123, v124, v125, v126, v34.OmniRecommendationsRequestIntent.LogIn));
        end, 
        setOmniFeedItemsRowData = if not v51 then nil else function(v127)
            return v110(v45(l_Home_0, v127));
        end, 
        clearOmniFeedItemsRowData = if not v51 then nil else function()
            return v110(v46(l_Home_0));
        end
    };
end)(v59);
v59 = function(v129)
    local v130, v131 = v43();
    return v3.createElement(v128, v11.Dictionary.join(v129, {
        header = v130, 
        headerHeight = v131
    }));
end;
if not v52() then
    return (l_RoactServices_0.connect({
        appAnalytics = v13, 
        networking = v19, 
        loggingProtocol = l_AppLogging_0, 
        prefetchProtocol = l_AppPrefetch_0, 
        sessionService = l_AppSessionService_0, 
        appStartupSequence = l_AppStartupSequenceTag_0, 
        eventIngest = v21, 
        omniRecommendationsRequest = if not l_IsPrefetchOneCopyEnabled_0() then nil else l_AppOmniRecommendationsRequest_0
    })((v8.withNavigation((l_RoactAppPolicy_0.connect(function(v132, _)
        return {
            isOmni = v132.getUseOmniRecommendation()
        };
    end)(v59))))));
else
    return v59;
end;
