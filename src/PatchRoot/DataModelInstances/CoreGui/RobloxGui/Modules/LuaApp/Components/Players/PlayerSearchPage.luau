local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_HttpService_0 = game:GetService("HttpService");
local v3 = require(l_CorePackages_0.Packages.t);
local v4 = require(l_Modules_0.Common.Roact);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v6 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local v8 = require(l_Modules_0.LuaApp.Promise);
local v9 = require(l_CorePackages_0.UIBlox);
local l_withStyle_0 = v9.Style.withStyle;
local l_RetrievalStatus_0 = v9.App.Loading.Enum.RetrievalStatus;
local l_LoadingStateContainer_0 = v9.App.Container.LoadingStateContainer;
local l_EmptyState_0 = v9.App.Indicator.EmptyState;
local l_RetrievalStatus_1 = require(l_CorePackages_0.Workspace.Packages.Http).Enum.RetrievalStatus;
local l_Signal_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Signal;
local l_ScreenSizeImpressionsDetector_0 = require(l_CorePackages_0.Workspace.Packages.Impressions).ScreenSizeImpressionsDetector;
local v17 = require(l_Modules_0.LuaApp.Constants);
local v18 = require(l_Modules_0.LuaApp.Util.debounce);
local v19 = require(l_Modules_0.LuaApp.Components.RefreshScrollingFrameWithLoadMore);
local v20 = require(l_Modules_0.LuaApp.Components.Players.PlayerGrid);
local v21 = require(l_Modules_0.LuaApp.Components.Players.PlayerGridWithProfileInsights);
local v22 = require(script.Parent.EmptyPlayerSearchPage);
local v23 = require(l_Modules_0.LuaApp.Components.UserSearch.api);
local l_EventNames_0 = v23.Analytics.EventNames;
local l_Analytics_0 = v23.Analytics.Analytics;
local l_Timers_0 = require(l_CorePackages_0.Workspace.Packages.SocialLuaAnalytics).Analytics.Timing.Timers;
local l_GetFFlagTenFootUiSearch_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagTenFootUiSearch;
local l_GetFFlagTenFootUiPlayerSearchBackground_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagTenFootUiPlayerSearchBackground;
local l_getFFlagPlayerSearchNewEmptyPageEnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).getFFlagPlayerSearchNewEmptyPageEnabled;
local l_FFlagUserSearchUseNewEndpointIXP_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagUserSearchUseNewEndpointIXP;
local l_FFlagOmniSearchAutoTabIXP_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagOmniSearchAutoTabIXP;
local function _(v32)
    return v17.PLAYER_SEARCH_MIN_KEYWORD_UTF8_LEN <= utf8.len(v32);
end;
local v34 = v4.PureComponent:extend("PlayerSearchPage");
v34.validateProps = v3.strictInterface({
    searchUuid = v3.optional(v3.string), 
    backgroundTransparency = if not l_GetFFlagTenFootUiSearch_0() then nil else v3.optional(v3.number), 
    searchParameters = v3.table, 
    onScrollDirectionChanged = v3.optional(v3.callback), 
    shouldShowUserSearchLandingPage = v3.optional(v3.boolean), 
    isRoutedFromAutoSearch = if not l_FFlagOmniSearchAutoTabIXP_0 then nil else v3.optional(v3.boolean), 
    screenSize = v3.Vector2, 
    usersSearchResult = v3.optional(v3.table), 
    searchWordLengthNotSupported = v3.boolean, 
    playerSearchStatus = v3.string, 
    wideMode = v3.optional(v3.boolean), 
    fetchPlayerSearch = v3.callback, 
    networking = v3.callback, 
    eventIngest = v3.optional(v3.table), 
    enableRecommendationsSearchContext = v3.optional(v3.boolean), 
    enableNewEmptySearchUI = v3.optional(v3.boolean), 
    shouldUseOmniSearchEndpoint = if not l_FFlagUserSearchUseNewEndpointIXP_0 then nil else v3.optional(v3.boolean)
});
v34.init = function(v35)
    local l_screenSize_0 = v35.props.screenSize;
    local v37 = v17.GetPageSideMargin(l_screenSize_0.X);
    v35.userSearchSessionId = if not l_FFlagOmniSearchAutoTabIXP_0 then l_HttpService_0:GenerateGUID(false) else v35.props.searchUuid or l_HttpService_0:GenerateGUID(false);
    v35.Analytics = l_Analytics_0({
        infoForAllEvents = {
            userSearchSessionId = v35.userSearchSessionId
        }
    });
    v35.state = {
        loaded = false, 
        impressionsToSend = nil, 
        contentSize = Vector2.new(l_screenSize_0.X - 2 * v37, l_screenSize_0.Y)
    };
    v35.onRequestImpressionsSignal = l_Signal_0.new();
    v35.onImpressionsDetected = function(v38)
        if not v38 or #v38 == 0 then
            return ;
        else
            v35:setState({
                impressionsToSend = v38
            });
            return ;
        end;
    end;
    v35.sendPlayerTileImpressions = function(v39)
        if v35.Analytics then
            if not v39 or #v39 == 0 then
                return ;
            else
                local l_usersSearchResult_0 = v35.props.usersSearchResult;
                local v41 = if not l_usersSearchResult_0 then nil else l_usersSearchResult_0.entries;
                if v41 then
                    local v42 = {};
                    local v43 = {};
                    local v44 = {};
                    for v45 = 1, #v39 do
                        local v46 = v39[v45];
                        table.insert(v42, v46);
                        if v46 > 0 and v46 <= #v41 then
                            local v47 = v41[v46];
                            if v47 then
                                table.insert(v43, v47.id);
                                table.insert(v44, v47.name);
                            end;
                        end;
                    end;
                    v35.Analytics.fireAnalyticsEvent(l_EventNames_0.PlayerTileImpressions, {
                        tilePos = v42, 
                        playerId = v43, 
                        playerName = v44
                    });
                    return ;
                else
                    return ;
                end;
            end;
        else
            return ;
        end;
    end;
    v35.onAbsoluteContentSizeChanged = function(v48)
        if not (not v35.isMounted or not v48) then
            local l_AbsoluteContentSize_0 = v48.AbsoluteContentSize;
            if v35.state.contentSize == l_AbsoluteContentSize_0 then
                return ;
            elseif l_AbsoluteContentSize_0.X > 0 and l_AbsoluteContentSize_0.Y > 0 then
                v35:setState({
                    contentSize = l_AbsoluteContentSize_0
                });
            end;
        end;
    end;
    v35.loadingTimers = l_Timers_0();
    v35.reportLoadingTimeForPromise = function(v50, v51)
        local v52 = v35.loadingTimers.start();
        local function v54(v53)
            v35.Analytics.fireAnalyticsEvent(l_EventNames_0.UserSearchLoadingTime, {
                status = v53, 
                loadingTime = v35.loadingTimers.stop(v52), 
                nextPage = not not v51 and v51.nextPage
            });
        end;
        return v50():andThen(function()
            v54(l_RetrievalStatus_0.Done.rawValue());
        end):catch(function()
            v54(l_RetrievalStatus_0.Failed.rawValue());
        end);
    end;
    v35.onLoadMore = function()
        local l_networking_0 = v35.props.networking;
        local l_searchKeyword_0 = v35.props.searchParameters.searchKeyword;
        local l_fetchPlayerSearch_0 = v35.props.fetchPlayerSearch;
        return v35.reportLoadingTimeForPromise(function()
            return l_fetchPlayerSearch_0(l_networking_0, {
                keyword = l_searchKeyword_0, 
                userSearchSessionId = v35.userSearchSessionId, 
                isNewSearchInitiated = false, 
                shouldUseOmniSearchEndpoint = if not l_FFlagUserSearchUseNewEndpointIXP_0 then nil else v35.props.shouldUseOmniSearchEndpoint
            });
        end, {
            nextPage = true
        });
    end;
    v35.dispatchInitialSearch = function()
        if not l_FFlagOmniSearchAutoTabIXP_0 or not v35.props.isRoutedFromAutoSearch then
            local l_networking_1 = v35.props.networking;
            local l_fetchPlayerSearch_1 = v35.props.fetchPlayerSearch;
            local l_searchKeyword_1 = v35.props.searchParameters.searchKeyword;
            if not l_searchKeyword_1 or not (v17.PLAYER_SEARCH_MIN_KEYWORD_UTF8_LEN <= utf8.len(l_searchKeyword_1)) then
                return ;
            else
                return v35.reportLoadingTimeForPromise(function()
                    return l_fetchPlayerSearch_1(l_networking_1, {
                        keyword = l_searchKeyword_1, 
                        userSearchSessionId = v35.userSearchSessionId, 
                        isNewSearchInitiated = true, 
                        shouldUseOmniSearchEndpoint = if not l_FFlagUserSearchUseNewEndpointIXP_0 then nil else v35.props.shouldUseOmniSearchEndpoint
                    });
                end);
            end;
        else
            return v8.resolve();
        end;
    end;
end;
v34.didMount = function(v61)
    v61.isMounted = true;
    v61.dispatchInitialSearch();
end;
v34.willUnmount = function(v62)
    v62.isMounted = false;
end;
v34.renderOnLoaded = function(v63)
    local l_screenSize_1 = v63.props.screenSize;
    local l_contentSize_0 = v63.state.contentSize;
    local v66 = v17.GetPageSideMargin(l_screenSize_1.X);
    local l_searchWordLengthNotSupported_0 = v63.props.searchWordLengthNotSupported;
    local v68 = false;
    local v69 = {};
    local l_usersSearchResult_1 = v63.props.usersSearchResult;
    if l_usersSearchResult_1 then
        v68 = not not l_usersSearchResult_1.nextPageCursor or false;
        v69 = l_usersSearchResult_1.entries;
    end;
    local v71 = true;
    if #v69 ~= 0 then
        v71 = l_searchWordLengthNotSupported_0;
    end;
    if not v71 then
        return l_withStyle_0(function(_)
            return l_withLocalization_0({
                noResultsText = "Feature.PlayerSearchResults.Label.NoResultsFound", 
                keywordTooShortText = "Feature.PlayerSearchResults.Label.KeywordTooShort", 
                landingText = if not v63.props.addFriendsPageSearchbarEnabled then nil else "Feature.AddFriends.Label.SearchForFriendsPrompt"
            })(function(_)
                return v4.createElement("Frame", {
                    Size = UDim2.new(1, 0, 1, 0), 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0
                }, {
                    Content = v4.createElement(v19, {
                        Size = UDim2.new(1, 0, 1, 0), 
                        Position = UDim2.new(0, 0, 0, 0), 
                        CanvasSize = UDim2.new(1, 0, 1, 0), 
                        refresh = v63.refresh, 
                        BackgroundTransparency = if not l_GetFFlagTenFootUiPlayerSearchBackground_0() then nil else v63.props.backgroundTransparency, 
                        onLoadMore = not not v68 and v63.onLoadMore or nil, 
                        onScrollDirectionChanged = v63.props.onScrollDirectionChanged, 
                        onCanvasPositionChangedCallback = v18(function()
                            v63.onRequestImpressionsSignal:fire();
                        end, 0.2)
                    }, {
                        Layout = v4.createElement("UIListLayout", {
                            FillDirection = Enum.FillDirection.Vertical, 
                            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                            SortOrder = Enum.SortOrder.LayoutOrder, 
                            Padding = UDim.new(0, 12), 
                            [v4.Change.AbsoluteContentSize] = v63.onAbsoluteContentSizeChanged
                        }), 
                        Padding = v4.createElement("UIPadding", {
                            PaddingLeft = UDim.new(0, v66), 
                            PaddingRight = UDim.new(0, v66), 
                            PaddingTop = UDim.new(0, v17.GAME_GRID_PADDING), 
                            PaddingBottom = UDim.new(0, v17.GAME_GRID_PADDING)
                        }), 
                        PlayerGrid = if not v63.props.enableRecommendationsSearchContext then v4.createElement(v20, {
                            LayoutOrder = 1, 
                            entries = v69, 
                            searchParameters = v63.props.searchParameters, 
                            horizontalAlignment = Enum.HorizontalAlignment.Left, 
                            windowSize = Vector2.new(l_contentSize_0.X, l_screenSize_1.Y), 
                            impressionsTag = "PLAYER_TILE_IMPRESSIONS", 
                            Analytics = v63.Analytics
                        }) else v4.createElement(v21, {
                            LayoutOrder = 1, 
                            entries = v69, 
                            searchParameters = v63.props.searchParameters, 
                            horizontalAlignment = Enum.HorizontalAlignment.Left, 
                            windowSize = Vector2.new(l_contentSize_0.X, l_screenSize_1.Y), 
                            impressionsTag = "PLAYER_TILE_IMPRESSIONS", 
                            Analytics = v63.Analytics
                        })
                    }), 
                    ScreenSizeImpressionsDetector = v4.createElement(l_ScreenSizeImpressionsDetector_0, {
                        onRequestImpressionsSignal = v63.onRequestImpressionsSignal, 
                        onImpressionsDetected = v63.onImpressionsDetected, 
                        impressionsTag = "PLAYER_TILE_IMPRESSIONS"
                    })
                });
            end);
        end);
    else
        return v4.createElement(v22, {
            wideMode = v63.props.wideMode, 
            screenSize = v63.props.screenSize, 
            backgroundTransparency = if not l_GetFFlagTenFootUiPlayerSearchBackground_0() then nil else v63.props.backgroundTransparency, 
            searchWordLengthNotSupported = l_searchWordLengthNotSupported_0, 
            shouldShowUserSearchLandingPage = v63.props.shouldShowUserSearchLandingPage, 
            newEmptyPageUI = if not l_getFFlagPlayerSearchNewEmptyPageEnabled_0() then nil else v63.props.enableNewEmptySearchUI, 
            fireAnalyticsEvent = v63.Analytics.fireAnalyticsEvent
        });
    end;
end;
v34.renderOnFailed = function(v74, v75)
    return v4.createElement(l_EmptyState_0, {
        onActivated = v74.dispatchInitialSearch, 
        text = v75.failedMessage
    });
end;
v34.render = function(v76)
    local l_playerSearchStatus_0 = v76.props.playerSearchStatus;
    return l_withLocalization_0({
        failedMessage = "Feature.EmptyStatePage.Message.NoInternet"
    })(function(v78)
        return v4.createElement(l_LoadingStateContainer_0, {
            dataStatus = l_RetrievalStatus_0.fromRawValue(l_playerSearchStatus_0), 
            renderOnLoading = not not v76.state.loaded and function()
                return v76:renderOnLoaded();
            end or nil, 
            renderOnFailed = function()
                return v76:renderOnFailed(v78);
            end, 
            renderOnLoaded = function()
                return v76:renderOnLoaded();
            end
        });
    end);
end;
v34.didUpdate = function(v79, v80, v81)
    local l_playerSearchStatus_1 = v79.props.playerSearchStatus;
    if l_playerSearchStatus_1 ~= v80.playerSearchStatus then
        if l_playerSearchStatus_1 == l_RetrievalStatus_1.Done then
            if v79.state.loaded == false then
                v79:setState({
                    loaded = true
                });
            end;
            v79.onRequestImpressionsSignal:fire();
        elseif (not (l_playerSearchStatus_1 ~= l_RetrievalStatus_1.NotStarted) or l_playerSearchStatus_1 == l_RetrievalStatus_1.Failed) and v79.state.loaded == true then
            v79:setState({
                loaded = false
            });
        end;
    end;
    local l_impressionsToSend_0 = v79.state.impressionsToSend;
    if l_impressionsToSend_0 ~= nil and l_impressionsToSend_0 ~= v81.impressionsToSend then
        v79.sendPlayerTileImpressions(l_impressionsToSend_0);
        v79:setState({
            impressionsToSend = nil
        });
    end;
end;
return l_RoactServices_0.connect({
    networking = v6
})(v34);
