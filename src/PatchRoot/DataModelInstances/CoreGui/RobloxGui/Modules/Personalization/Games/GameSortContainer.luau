local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_HttpService_0 = game:GetService("HttpService");
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.RoactRodux);
local v5 = require(l_CorePackages_0.Packages.t);
local l_memoize_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).memoize;
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local _ = require(l_CorePackages_0.Workspace.Packages.GameTile);
local v9 = require(l_Modules_0.LuaApp.Constants);
local v10 = require(l_Modules_0.LuaApp.AppPage);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local l_RoactAnalyticsCommonGameEvents_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).RoactAnalyticsCommonGameEvents;
local v13 = require(l_Modules_0.LuaApp.Components.Games.GameCarousel);
local v14 = require(l_Modules_0.Personalization.Games.GameSortGridRow);
local v15 = require(l_Modules_0.LuaApp.Enum.RetrievalStatus);
local v16 = require(l_Modules_0.LuaApp.Thunks.Games.ApiFetchGamesInSort);
local v17 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v18 = require(l_Modules_0.LuaApp.Actions.Games.SetNextTokenRefreshTime);
local v19 = require(l_Modules_0.LuaApp.Actions.Games.SetGameSortStatus);
local l_GetFFlagApolloClientFetchExperiences_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagApolloClientFetchExperiences;
local l_FFlagLuaAppPlayButtonStyle_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppPlayButtonStyle;
local v22 = require(l_Modules_0.Personalization.Flags.GetFFlagLuaAppSortHideSeeAll);
local l_GetFFlagLuaAppUseTooltipsFromSort_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagLuaAppUseTooltipsFromSort;
local v24 = require(l_Modules_0.Personalization.Flags.FFlagLuaAppLinkSortTitle);
local v25 = require(l_Modules_0.Personalization.Flags.FFlagLuaAppCountdownSubtitle);
local v26 = v3.PureComponent:extend("GameSortContainer");
v26.validateProps = v5.strictInterface({
    gameSortId = v5.string, 
    analyticsIndexOnPage = v5.number, 
    itemRowData = v5.optional(v5.table), 
    pageContext = v5.string, 
    sideMargin = v5.number, 
    scrollViewPositionChangedSignal = v5.optional(v5.any), 
    tileHasFriendFooter = v5.optional(v5.boolean), 
    useGridTiles = v5.optional(v5.boolean), 
    playerCountStyle = v5.optional(v5.string), 
    isSponsoredFooterAllowed = v5.optional(v5.boolean), 
    componentType = v5.optional(v5.string), 
    linkPath = if not v24 then nil else v5.optional(v5.string), 
    hideSeeAll = if not v22() then nil else v5.optional(v5.boolean), 
    gameTileLayoutType = v5.string, 
    infoText = if not l_GetFFlagLuaAppUseTooltipsFromSort_0() then nil else v5.optional(v5.string), 
    endTimestamp = if not v25 then nil else v5.optional(v5.number), 
    countdownString = if not v25 then nil else v5.optional(v5.string), 
    playButtonStyle = if not l_FFlagLuaAppPlayButtonStyle_0 then nil else v5.optional(v5.string), 
    gridSupportAllowed = v5.optional(v5.boolean), 
    gameSortContents = if not l_GetFFlagApolloClientFetchExperiences_0() then nil else v5.optional(v5.table), 
    sort = if not l_GetFFlagApolloClientFetchExperiences_0() then nil else v5.optional(v5.table), 
    sortIndex = v5.optional(v5.number), 
    omniRecommendationsPageType = v5.optional(v5.string), 
    isOmni = v5.optional(v5.boolean), 
    gameSortDataFound = v5.optional(v5.boolean), 
    gamesApiSortData = v5.optional(v5.table), 
    dispatchFetchGamesInSort = v5.callback, 
    dispatchSetNextTokenRefreshTime = v5.callback, 
    dispatchSetGameSortStatus = v5.callback, 
    useGridPageLayout = v5.optional(v5.boolean), 
    analytics = v5.any, 
    networking = v5.callback
});
v26.init = function(v27)
    v27.state = {
        gamesApiSortFetchRetries = 0
    };
    v27.fetchGamesInSort = function()
        local l_gameSortDataFound_0 = v27.props.gameSortDataFound;
        local l_gamesApiSortData_0 = v27.props.gamesApiSortData;
        if (l_gameSortDataFound_0 and l_gamesApiSortData_0 ~= nil) and l_gamesApiSortData_0.gameSortFetchingStatus == v15.NotStarted then
            v27.props.dispatchFetchGamesInSort(v27.props.networking, l_gamesApiSortData_0.gameSort):catch(function(v30)
                if v27.state.gamesApiSortFetchRetries > 2 then
                    return ;
                else
                    if not (not v30 or not v30.Body) then
                        local l_status_0, l_result_0 = pcall(function()
                            return l_HttpService_0:JSONDecode(v30.Body);
                        end);
                        if not ((not l_status_0 or not l_result_0) or not l_result_0.errors) then
                            for _, v34 in ipairs(l_result_0.errors) do
                                if v34.code == 400 and v34.field == "sortToken" then
                                    v27.props.dispatchSetGameSortStatus(l_gamesApiSortData_0.gameSort.name, v15.NotStarted);
                                    v27.props.dispatchSetNextTokenRefreshTime(0);
                                    v27:setState({
                                        gamesApiSortFetchRetries = v27.state.gamesApiSortFetchRetries + 1
                                    });
                                end;
                            end;
                        end;
                    end;
                    return ;
                end;
            end);
        end;
    end;
    v27.fetchGamesInSort();
end;
v26.render = function(v35)
    local l_gameSortDataFound_1 = v35.props.gameSortDataFound;
    local l_analyticsIndexOnPage_0 = v35.props.analyticsIndexOnPage;
    local v38 = not not v35.props.gamesApiSortData and v35.props.gamesApiSortData.gameSortPageId or nil;
    if l_gameSortDataFound_1 then
        if not v35.props.gridSupportAllowed or not v35.props.useGridPageLayout then
            return v3.createElement(v13, {
                sortName = v35.props.gameSortId, 
                sortIndex = v35.props.sortIndex, 
                LayoutOrder = l_analyticsIndexOnPage_0, 
                sortIndexOnPage = l_analyticsIndexOnPage_0, 
                itemRowData = v35.props.itemRowData, 
                omniRecommendationsPageType = v35.props.omniRecommendationsPageType, 
                analytics = v35.props.analytics, 
                friendFooterEnabled = v35.props.tileHasFriendFooter, 
                scrollViewPositionChangedSignal = v35.props.scrollViewPositionChangedSignal, 
                context = v35.props.pageContext, 
                sideMargin = v35.props.sideMargin, 
                sortPageId = v38, 
                isOmni = v35.props.isOmni, 
                gameSortContents = if not l_GetFFlagApolloClientFetchExperiences_0() then nil else v35.props.gameSortContents, 
                sort = if not l_GetFFlagApolloClientFetchExperiences_0() then nil else v35.props.sort, 
                useGridTiles = v35.props.useGridTiles, 
                playerCountStyle = v35.props.playerCountStyle, 
                isSponsoredFooterAllowed = v35.props.isSponsoredFooterAllowed, 
                linkPath = if not v24 then nil else v35.props.linkPath, 
                componentType = v35.props.componentType, 
                hideSeeAll = if not v22() then nil else v35.props.hideSeeAll, 
                gameTileLayoutType = v35.props.gameTileLayoutType, 
                infoText = if not l_GetFFlagLuaAppUseTooltipsFromSort_0() then nil else v35.props.infoText, 
                endTimestamp = if not v25 then nil else v35.props.endTimestamp, 
                countdownString = if not v25 then nil else v35.props.countdownString, 
                playButtonStyle = if not l_FFlagLuaAppPlayButtonStyle_0 then nil else v35.props.playButtonStyle
            });
        else
            return v3.createElement(v14, {
                sortName = v35.props.gameSortId, 
                sortIndex = v35.props.sortIndex, 
                sortIndexOnPage = l_analyticsIndexOnPage_0, 
                itemRowData = v35.props.itemRowData, 
                omniRecommendationsPageType = v35.props.omniRecommendationsPageType, 
                gameAnalytics = v35.props.analytics, 
                context = v35.props.pageContext, 
                sortPageId = v38, 
                isOmni = v35.props.isOmni, 
                scrollViewPositionChangedSignal = v35.props.scrollViewPositionChangedSignal, 
                gameSortContents = if not l_GetFFlagApolloClientFetchExperiences_0() then nil else v35.props.gameSortContents, 
                sort = if not l_GetFFlagApolloClientFetchExperiences_0() then nil else v35.props.sort, 
                useGridTiles = v35.props.useGridTiles, 
                playerCountStyle = v35.props.playerCountStyle, 
                isSponsoredFooterAllowed = v35.props.isSponsoredFooterAllowed, 
                linkPath = if not v24 then nil else v35.props.linkPath, 
                componentType = v35.props.componentType, 
                hideSeeAll = if not v22() then nil else v35.props.hideSeeAll, 
                gameTileLayoutType = v35.props.gameTileLayoutType, 
                infoText = if not l_GetFFlagLuaAppUseTooltipsFromSort_0() then nil else v35.props.infoText, 
                endTimestamp = if not v25 then nil else v35.props.endTimestamp, 
                countdownString = if not v25 then nil else v35.props.countdownString, 
                playButtonStyle = if not l_FFlagLuaAppPlayButtonStyle_0 then nil else v35.props.playButtonStyle
            });
        end;
    else
        return nil;
    end;
end;
v26.didUpdate = function(v39)
    v39.fetchGamesInSort();
end;
local v44 = l_memoize_0(function(v40)
    local v41 = {};
    if not (not v40 or not v40.sorts) then
        for v42, v43 in ipairs(v40.sorts) do
            if v43.topicId then
                v41[tostring(v43.topicId)] = v42;
            end;
        end;
    end;
    return v41;
end);
return (l_RoactServices_0.connect({
    analytics = l_RoactAnalyticsCommonGameEvents_0, 
    networking = v17
})((l_RoactAppPolicy_0.connect(function(v45, _)
    return {
        useGridPageLayout = v45.useGridPageLayout()
    };
end)((v4.connect(function(v47, v48)
    local l_gameSortId_0 = v48.gameSortId;
    local l_pageContext_0 = v48.pageContext;
    local v51 = false;
    local v52 = nil;
    local v53 = nil;
    local v54 = nil;
    local v55 = v47.GameSorts[l_gameSortId_0];
    local v56 = nil;
    if v55 ~= nil then
        v51 = true;
        local v57 = nil;
        if l_pageContext_0 == v10.Games then
            v57 = v9.GameSortGroups.Games;
        elseif l_pageContext_0 == v10.Home then
            v57 = v9.GameSortGroups.HomeGames;
        end;
        v56 = {
            gameSort = v55, 
            gameSortFetchingStatus = v47.RequestsStatus.GameSortsStatus[l_gameSortId_0] or v15.NotStarted, 
            gameSortPageId = if not v57 then nil else v47.GameSortGroups[v57].pageId
        };
    else
        if l_pageContext_0 == v10.Home then
            local l_PAGE_TYPE_HOME_0 = v9.OmniRecommendationsPageType.PAGE_TYPE_HOME;
            local v59 = v44(v47.OmniRecommendations[l_PAGE_TYPE_HOME_0])[l_gameSortId_0];
            if v59 then
                v51 = true;
                v52 = true;
                v53 = v59;
                v54 = l_PAGE_TYPE_HOME_0;
            end;
        end;
        v56 = nil;
    end;
    return {
        sortIndex = v53, 
        omniRecommendationsPageType = v54, 
        isOmni = v52, 
        gameSortDataFound = v51, 
        gamesApiSortData = v56
    };
end, function(v60)
    return {
        dispatchFetchGamesInSort = function(v61, v62)
            return v60(v16(v61, v62, false, nil));
        end, 
        dispatchSetNextTokenRefreshTime = function(v63)
            return v60(v18(v9.GameSortGroups.Games, v63));
        end, 
        dispatchSetGameSortStatus = function(v64, v65)
            return v60(v19(v64, v65));
        end
    };
end)(v26))))));
