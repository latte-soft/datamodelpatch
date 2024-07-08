local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.UIBlox);
local v3 = require(l_CorePackages_0.Packages.t);
local v4 = require(l_CorePackages_0.Roact);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local v6 = require(l_Modules_0.LuaApp.Constants);
local v7 = require(l_Modules_0.LuaApp.Enum.SearchRetrievalStatus);
local l_EmptyState_0 = v2.App.Indicator.EmptyState;
local l_LoadingStateContainer_0 = v2.App.Container.LoadingStateContainer;
local l_RetrievalStatus_0 = v2.App.Loading.Enum.RetrievalStatus;
local v11 = require(l_Modules_0.LuaApp.Components.Search.GamesSearchOmniFeed);
local v12 = require(l_Modules_0.LuaApp.Promise);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v14 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local l_FFlagOmniSearchAutoTabIXP_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagOmniSearchAutoTabIXP;
local v16 = v4.PureComponent:extend("GamesSearchPage");
v16.validateProps = v3.interface({
    searchUuid = v3.string, 
    searchParameters = v3.table, 
    onScrollDirectionChanged = v3.optional(v3.callback), 
    isRoutedFromAutoSearch = if not l_FFlagOmniSearchAutoTabIXP_0 then nil else v3.optional(v3.boolean), 
    searchInGames = v3.optional(v3.table), 
    searchInGamesStatus = v3.string, 
    screenSize = v3.Vector2, 
    dispatchSearch = v3.callback, 
    dispatchRemoveSearch = v3.callback, 
    networking = v3.callback
});
v16.init = function(v17)
    v17.isMounted = false;
    local l_screenSize_0 = v17.props.screenSize;
    v17:setState({
        loaded = false, 
        contentSize = Vector2.new(l_screenSize_0.X - 2 * v6.GetPageSideMargin(l_screenSize_0.X), l_screenSize_0.Y), 
        frameSize = l_screenSize_0
    });
    v17.dispatchInitialSearch = function()
        if not l_FFlagOmniSearchAutoTabIXP_0 or not v17.props.isRoutedFromAutoSearch then
            return v17.props.dispatchSearch(v17.props.networking, v17.props.searchParameters.searchKeyword, v17.props.searchUuid);
        else
            return v12.resolve();
        end;
    end;
end;
v16.renderOnLoaded = function(v19)
    local l_searchInGames_0 = v19.props.searchInGames;
    local v21 = l_searchInGames_0 and l_searchInGames_0.entries;
    local v22 = v6.GetPageSideMargin(v19.state.frameSize.X);
    if not (l_searchInGames_0 ~= nil and v21 ~= nil) or #v21 == 0 then
        return l_withLocalization_0({
            noResultsText = "Feature.GamePage.LabelNoSearchResults"
        })(function(v23)
            return v4.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 1, 0)
            }, {
                Padding = v4.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, v6.GAME_GRID_PADDING), 
                    PaddingLeft = UDim.new(0, v22), 
                    PaddingRight = UDim.new(0, v22)
                }), 
                NoResultsView = v4.createElement(l_EmptyState_0, {
                    text = v23.noResultsText
                })
            });
        end);
    else
        return v4.createElement(v11, {
            searchUuid = v19.props.searchUuid, 
            createEndOfScrollElement = not l_searchInGames_0.hasMoreRows, 
            onScrollDirectionChanged = v19.props.onScrollDirectionChanged
        });
    end;
end;
v16.renderOnFailed = function(v24, v25)
    return v4.createElement(l_EmptyState_0, {
        onActivated = v24.dispatchInitialSearch, 
        text = v25.failedMessage
    });
end;
v16.render = function(v26)
    local l_searchInGamesStatus_0 = v26.props.searchInGamesStatus;
    if l_searchInGamesStatus_0 == v7.Removed then
        l_searchInGamesStatus_0 = v7.NotStarted;
    end;
    return l_withLocalization_0({
        failedMessage = "Feature.EmptyStatePage.Message.NoInternet"
    })(function(v28)
        return v4.createElement(l_LoadingStateContainer_0, {
            dataStatus = l_RetrievalStatus_0.fromRawValue(l_searchInGamesStatus_0), 
            renderOnLoading = not not v26.state.loaded and function()
                return v26:renderOnLoaded();
            end or nil, 
            renderOnFailed = function()
                return v26:renderOnFailed(v28);
            end, 
            renderOnLoaded = function()
                return v26:renderOnLoaded();
            end
        });
    end);
end;
v16.didMount = function(v29)
    v29.isMounted = true;
    v29.dispatchInitialSearch();
end;
v16.willUnmount = function(v30)
    v30.isMounted = false;
    v30.props.dispatchRemoveSearch(v30.props.searchUuid);
end;
v16.didUpdate = function(v31, v32)
    local l_searchInGamesStatus_1 = v31.props.searchInGamesStatus;
    if l_searchInGamesStatus_1 ~= v32.searchInGamesStatus then
        if l_searchInGamesStatus_1 == v7.Done then
            if v31.state.loaded == false then
                v31:setState({
                    loaded = true
                });
                return ;
            end;
        elseif (not (l_searchInGamesStatus_1 ~= v7.NotStarted) or l_searchInGamesStatus_1 == v7.Failed) and v31.state.loaded == true then
            v31:setState({
                loaded = false
            });
        end;
    end;
end;
return l_RoactServices_0.connect({
    networking = v14
})(v16);
