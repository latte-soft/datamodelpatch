local l_HttpService_0 = game:GetService("HttpService");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.UIBlox);
local l_LoadingStateContainer_0 = v2.App.Container.LoadingStateContainer;
local l_RetrievalStatus_0 = v2.App.Loading.Enum.RetrievalStatus;
local v5 = require(l_CorePackages_0.Packages.t);
local l_Signal_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Signal;
local v7 = require(l_CorePackages_0.Roact);
local v8 = require(l_CorePackages_0.RoactRodux);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v10 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags);
local l_RoactNetworking_0 = v10.RoactNetworking;
local l_RoactAnalytics_0 = v10.RoactAnalytics;
local l_AppEventIngestService_0 = v10.AppEventIngestService;
local l_AppGameTile_0 = require(l_CorePackages_0.Workspace.Packages.GameTile).AppGameTile;
local l_gameDetailReferral_0 = require(l_CorePackages_0.Workspace.Packages.ExperienceAnalytics).Events.gameDetailReferral;
local l_AppPage_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).AppPage;
local l_withNavigation_0 = require(l_CorePackages_0.RoactNavigation).withNavigation;
local l_OpenGameDetails_0 = require(l_CorePackages_0.Workspace.Packages.GameDetail).OpenGameDetails;
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v20 = require(l_Modules_0.LuaApp.Constants);
local v21 = require(l_Modules_0.LuaApp.getGameCardSize);
local v22 = require(l_Modules_0.LuaApp.withTheme_DEPRECATED);
local v23 = require(l_Modules_0.LuaApp.Components.Games.GameCard);
local v24 = require(l_Modules_0.LuaApp.Components.SectionHeader);
local v25 = require(l_Modules_0.LuaApp.Components.ShimmerPanel);
local v26 = require(l_Modules_0.LuaApp.Thunks.Games.RecommendedGames);
local v27 = require(l_Modules_0.Personalization.Games.GameSortImpressionsDetector);
local v28 = require(l_Modules_0.Personalization.Games.SendGameImpressions);
local l_FFlagLuaAppRefactorOpenGameDetail_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppRefactorOpenGameDetail;
local l_FFlagLuaAppGameTileProps_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppGameTileProps;
local l_MAX_RECOMMENDED_GAMES_FETCH_COUNT_0 = v20.MAX_RECOMMENDED_GAMES_FETCH_COUNT;
local l_GAME_CAROUSEL_PADDING_0 = v20.GAME_CAROUSEL_PADDING;
local l_GAME_CAROUSEL_CHILD_PADDING_0 = v20.GAME_CAROUSEL_CHILD_PADDING;
local v34 = v7.PureComponent:extend("RecommendedGameCarousel");
v34.validateProps = v5.strictInterface({
    universeId = v5.string, 
    gameDetailsViewWidth = v5.optional(v5.number), 
    withNewThemeProvider = v5.optional(v5.boolean), 
    appTheme = v5.optional(v5.table), 
    LayoutOrder = v5.optional(v5.number), 
    onPeekViewClosed = v5.optional(v5.callback), 
    gameCardSize = v5.Vector2, 
    recommendedGameEntries = v5.optional(v5.table), 
    recommendedGamesFetchingStatus = v5.string, 
    useSidewaysNavigation = v5.optional(v5.boolean), 
    dispatchGetRecommendedGames = v5.callback, 
    openGameDetails = if not l_FFlagLuaAppRefactorOpenGameDetail_0 then nil else v5.callback, 
    navigation = if not l_FFlagLuaAppRefactorOpenGameDetail_0 then nil else v5.any, 
    networking = v5.callback, 
    eventIngest = v5.table, 
    appAnalytics = v5.table
});
v34.init = function(v35)
    v35.scrollingFrameRef = v7.createRef();
    v35.carouselViewChangedSignal = l_Signal_0.new();
    v35.impressionsTagGuid = l_HttpService_0:GenerateGUID();
    v35.loadRecommendedGames = function()
        return v35.props.dispatchGetRecommendedGames(v35.props.networking, v35.props.universeId);
    end;
    if l_FFlagLuaAppRefactorOpenGameDetail_0 then
        v35.navigateToGameDetails = function(v36, v37)
            v35.props.openGameDetails(v36, v37, v35.props.navigation);
        end;
    end;
    v35.reportGameDetailOpened = function(v38)
        local l_recommendedGameEntries_0 = v35.props.recommendedGameEntries;
        if not (v35.isMounted and l_recommendedGameEntries_0 ~= nil) or v35.props.eventIngest == nil then
            return ;
        else
            local l_universeId_0 = v35.props.universeId;
            local v41 = #l_recommendedGameEntries_0;
            local v42 = l_recommendedGameEntries_0[v38];
            l_gameDetailReferral_0(v35.props.eventIngest, "gameDetails", {
                pg = "gameDetails", 
                pos = v38, 
                tis = v41, 
                sortPos = 0, 
                refId = l_universeId_0, 
                pid = v42.placeId, 
                ad = not v42.isSponsored and "no" or "yes", 
                src = "recommended", 
                universeId = v42.universeId
            });
            return ;
        end;
    end;
    v35.sendGameImpressions = function(v43)
        local l_recommendedGameEntries_1 = v35.props.recommendedGameEntries;
        if not v35.isMounted or l_recommendedGameEntries_1 == nil then
            return ;
        else
            v28.sendFromGameDetails(v35.props.eventIngest, v35.props.appAnalytics, v43, l_recommendedGameEntries_1, v35.props.universeId);
            return ;
        end;
    end;
    v35.updateImpressionsTracker = function()
        if v35.isMounted then
            v35.carouselViewChangedSignal:fire();
            return ;
        else
            return ;
        end;
    end;
end;
v34.didMount = function(v45)
    v45.isMounted = true;
end;
v34.willUnmount = function(v46)
    v46.isMounted = false;
end;
v34.renderShimmerCards = function(v47)
    local l_gameCardSize_0 = v47.props.gameCardSize;
    local v49 = {
        Layout = v7.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            Padding = UDim.new(0, l_GAME_CAROUSEL_CHILD_PADDING_0)
        })
    };
    for v50 = 1, 6 do
        v49["Card" .. tostring(v50)] = v7.createElement(v25, {
            LayoutOrder = v50, 
            Size = UDim2.new(0, l_gameCardSize_0.X, 0, l_gameCardSize_0.Y)
        });
    end;
    return v7.createElement("Frame", {
        LayoutOrder = 2, 
        Size = UDim2.new(1, l_GAME_CAROUSEL_PADDING_0, 0, l_gameCardSize_0.Y), 
        BackgroundTransparency = 1
    }, v49);
end;
v34.renderGameCards = function(v51)
    local l_appTheme_0 = v51.props.appTheme;
    local l_recommendedGameEntries_2 = v51.props.recommendedGameEntries;
    local l_gameCardSize_1 = v51.props.gameCardSize;
    local v55 = math.max(0, #l_recommendedGameEntries_2 * (l_GAME_CAROUSEL_CHILD_PADDING_0 + l_gameCardSize_1.X));
    local l_useSidewaysNavigation_0 = v51.props.useSidewaysNavigation;
    local l_withNewThemeProvider_0 = v51.props.withNewThemeProvider;
    local v58 = "GameDetails_" .. tostring(v51.props.universeId) .. tostring(v51.impressionsTagGuid);
    local v59 = {
        Layout = v7.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            Padding = UDim.new(0, l_GAME_CAROUSEL_CHILD_PADDING_0)
        }), 
        GameSortImpressionsDetector = v7.createElement(v27, {
            parentRef = v51.scrollingFrameRef, 
            pageContext = l_AppPage_0.GameDetail, 
            impressionsTag = v58, 
            scrollViewPositionChangedSignal = v51.carouselViewChangedSignal, 
            sendGameImpressions = v51.sendGameImpressions
        })
    };
    if not l_withNewThemeProvider_0 then
        for v60, v61 in ipairs(l_recommendedGameEntries_2) do
            v59[v60] = v7.createElement(v23, {
                entry = v61, 
                layoutOrder = v60, 
                size = l_gameCardSize_1, 
                reportGameDetailOpened = v51.reportGameDetailOpened, 
                index = v60, 
                useSidewaysNavigation = l_useSidewaysNavigation_0, 
                gameCardTheme = l_appTheme_0.GameDetails.GameCard, 
                impressionsTag = v58
            });
        end;
    else
        for v62, v63 in ipairs(l_recommendedGameEntries_2) do
            v59[v62] = v7.createElement(l_AppGameTile_0, {
                entry = v63, 
                layoutOrder = v62, 
                size = if l_FFlagLuaAppGameTileProps_0 then nil else l_gameCardSize_1, 
                Size = if not l_FFlagLuaAppGameTileProps_0 then nil else UDim2.new(0, l_gameCardSize_1.X, 0, l_gameCardSize_1.Y), 
                reportGameDetailOpened = v51.reportGameDetailOpened, 
                index = v62, 
                onPeekViewClosed = v51.props.onPeekViewClosed, 
                showFriendActivity = false, 
                impressionsTag = v58, 
                navigateToGameDetails = if not l_FFlagLuaAppRefactorOpenGameDetail_0 then nil else v51.navigateToGameDetails
            });
        end;
    end;
    return v7.createElement("ScrollingFrame", {
        LayoutOrder = 2, 
        Size = UDim2.new(1, l_GAME_CAROUSEL_PADDING_0, 0, l_gameCardSize_1.Y), 
        ScrollBarThickness = 0, 
        BackgroundTransparency = 1, 
        ClipsDescendants = false, 
        CanvasSize = UDim2.new(0, v55, 0, l_gameCardSize_1.Y), 
        ScrollingDirection = Enum.ScrollingDirection.X, 
        ElasticBehavior = Enum.ElasticBehavior.Always, 
        [v7.Change.AbsolutePosition] = v51.updateImpressionsTracker, 
        [v7.Change.CanvasPosition] = v51.updateImpressionsTracker, 
        [v7.Ref] = v51.scrollingFrameRef
    }, v59);
end;
v34.render = function(v64)
    local l_appTheme_1 = v64.props.appTheme;
    local l_LayoutOrder_0 = v64.props.LayoutOrder;
    local l_gameCardSize_2 = v64.props.gameCardSize;
    local l_recommendedGamesFetchingStatus_0 = v64.props.recommendedGamesFetchingStatus;
    local l_withNewThemeProvider_1 = v64.props.withNewThemeProvider;
    return v7.createElement("Frame", {
        LayoutOrder = l_LayoutOrder_0, 
        Size = UDim2.new(1, 0, 0, 0), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        AutomaticSize = Enum.AutomaticSize.Y
    }, {
        Layout = v7.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Vertical, 
            Padding = UDim.new(0, 10)
        }), 
        Title = v7.createElement(v24, {
            LayoutOrder = 1, 
            TextColor3 = not l_withNewThemeProvider_1 and l_appTheme_1.GameDetails.Carousel.Text.Color, 
            Font = not l_withNewThemeProvider_1 and l_appTheme_1.GameDetails.Text.BoldFont, 
            text = "Feature.GameDetails.Heading.Recommended", 
            useLocalizedText = true
        }), 
        Content = v7.createElement("Frame", {
            LayoutOrder = 2, 
            Size = UDim2.new(1, 0, 0, l_gameCardSize_2.Y), 
            BackgroundTransparency = 1
        }, {
            LoadingStateContainer = v7.createElement(l_LoadingStateContainer_0, {
                dataStatus = l_RetrievalStatus_0.fromRawValue(l_recommendedGamesFetchingStatus_0), 
                onRetry = v64.loadRecommendedGames, 
                renderOnLoading = function()
                    return v64:renderShimmerCards();
                end, 
                renderOnLoaded = function()
                    return v64:renderGameCards();
                end
            })
        })
    });
end;
v34 = v8.connect(function(v70, v71)
    local v72 = v21(v71.gameDetailsViewWidth - l_GAME_CAROUSEL_PADDING_0, l_GAME_CAROUSEL_PADDING_0, l_GAME_CAROUSEL_CHILD_PADDING_0, 0.25);
    local v73 = nil;
    local v74 = v70.Navigation.history[#v70.Navigation.history];
    local l_name_0 = v74[#v74].name;
    local v76 = v74[#v74 - 1];
    if v76 then
        v73 = v76.name == l_name_0;
    end;
    return {
        gameCardSize = v72, 
        recommendedGameEntries = v70.RecommendedGameEntries[v71.universeId], 
        recommendedGamesFetchingStatus = v26.GetFetchingStatus(v70, v71.universeId), 
        useSidewaysNavigation = v73
    };
end, function(v77)
    return {
        dispatchGetRecommendedGames = function(v78, v79)
            return v77(v26.Fetch(v78, v79, false, {
                maxRows = l_MAX_RECOMMENDED_GAMES_FETCH_COUNT_0
            }));
        end, 
        openGameDetails = if not l_FFlagLuaAppRefactorOpenGameDetail_0 then nil else function(v80, v81, v82)
            v77(l_OpenGameDetails_0(v80, v82, v81));
        end
    };
end)((v22(v34)));
if l_FFlagLuaAppRefactorOpenGameDetail_0 then
    v34 = l_withNavigation_0(v34);
end;
return l_RoactServices_0.connect({
    networking = l_RoactNetworking_0, 
    eventIngest = l_AppEventIngestService_0, 
    appAnalytics = l_RoactAnalytics_0
})(v34);
