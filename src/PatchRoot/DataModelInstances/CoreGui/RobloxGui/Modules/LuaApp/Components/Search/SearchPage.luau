local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v3 = require(l_Modules_0.LuaApp.Services.AppEventIngestService);
local l_AppSessionService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppSessionService;
local v5 = require(l_CorePackages_0.Otter);
local v6 = require(l_CorePackages_0.Cryo);
local v7 = require(l_CorePackages_0.UIBlox);
local l_withStyle_0 = v7.Style.withStyle;
local l_withGridConfig_DEPRECATED_0 = v7.Core.Layout.Grid.withGridConfig_DEPRECATED;
local l_LayoutConfig_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).LayoutConfig;
local v11 = require(l_Modules_0.Common.Roact);
local v12 = require(l_Modules_0.Common.RoactRodux);
local v13 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local v15 = require(l_Modules_0.LuaApp.Promise);
local v16 = require(l_Modules_0.LuaApp.Enum.SearchRetrievalStatus);
local l_EmptyState_0 = v7.App.Indicator.EmptyState;
local v18 = require(l_Modules_0.LuaApp.Enum.OmniSearchVerticalType);
local v19 = require(l_Modules_0.LuaApp.Constants);
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local v21 = require(l_Modules_0.LuaApp.AppPage);
local v22 = require(l_Modules_0.LuaApp.Components.TopBar.TopBar);
local v23 = require(l_Modules_0.AvatarExperience.Catalog.Components.Search.CatalogSearch);
local v24 = require(l_Modules_0.LuaApp.Components.Search.GamesSearch);
local v25 = require(l_Modules_0.LuaApp.Components.Search.ButtonStripSelector);
local v26 = require(l_Modules_0.LuaApp.Thunks.OpenWebview);
local v27 = require(l_Modules_0.LuaApp.Enum.ScrollMovementDirection);
local v28 = require(l_Modules_0.LuaApp.Actions.SetCurrentOmniSearchType);
local v29 = require(l_Modules_0.LuaApp.Actions.SetSearchType);
local v30 = require(l_Modules_0.LuaApp.Actions.SetSearchParameters);
local v31 = require(l_Modules_0.LuaApp.SearchUuid);
local v32 = require(l_Modules_0.LuaApp.Analytics.Events.search);
local v33 = require(l_Modules_0.LuaApp.Analytics.Sessions.OmniSearchSessionUtil);
local v34 = require(l_Modules_0.LuaApp.Components.Players.PlayerSearch);
local l_useNavigationProps_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppNavigation).useNavigationProps;
local v36 = require(l_Modules_0.LuaApp.Thunks.Search.ApiFetchOmniSearchAutoFirstPage);
local v37 = require(l_Modules_0.Personalization.Games.ChartsPageExperimentation);
local v38 = require(l_CorePackages_0.Workspace.Packages.SocialLuaAnalytics);
local l_reportPromiseLoadingTimeWrapper_0 = v38.Analytics.Timing.reportPromiseLoadingTimeWrapper;
local l_createDiagMetricString_0 = v38.Analytics.Formatters.createDiagMetricString;
local l_Diag_0 = v38.Analytics.DefaultAnalyticsService.Diag;
local l_EventStream_0 = v38.Analytics.DefaultAnalyticsService.EventStream;
local l_Enums_0 = v38.Analytics.Enums;
local l_Contexts_0 = l_Enums_0.Contexts;
local l_EventTypes_0 = l_Enums_0.EventTypes;
local l_getDeepValue_0 = require(l_CorePackages_0.Workspace.Packages.LuaSocialLibrariesDeps).SocialLibraries.config({}).Dictionary.getDeepValue;
local l_FFlagUnifyNavigationGraph_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagUnifyNavigationGraph;
local v48 = require(l_Modules_0.LuaApp.Flags.FFlagLuaAppSingleHeaderBar);
local l_FFlagOmniSearchAutoTabIXP_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagOmniSearchAutoTabIXP;
local v50 = game:DefineFastFlag("CleanActiveSelection", false);
local l_FFlagAutoSearchLoadingTimeEvent_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAutoSearchLoadingTimeEvent;
local v52 = game:DefineFastFlag("MoveCurrentSearchTypeToState_v2", false);
local v53 = require(l_Modules_0.Personalization.Flags.FFlagLuaAppChartsPageRename);
local v54 = require(l_Modules_0.Personalization.Flags.FFlagLuaAppChartsPageRenameIXP);
local v55 = {
    frequency = 3, 
    dampeningRatio = 0
};
local v56 = {
    [v19.SearchTypes.Games] = 1, 
    [v19.SearchTypes.Players] = 2
};
if l_FFlagOmniSearchAutoTabIXP_0 then
    v56[v19.SearchTypes.Auto] = 0;
end;
local v57 = {
    [v19.SearchTypes.Games] = v24, 
    [v19.SearchTypes.Players] = v34, 
    [v19.SearchTypes.Catalog] = v23
};
if l_FFlagOmniSearchAutoTabIXP_0 then
    v57[v19.SearchTypes.Auto] = v7.App.Container.LoadingStatePage;
end;
local function v62(v58, v59, v60)
    local v61 = nil;
    v61 = v59.status == v16.Failed and "omniSearch" or if l_getDeepValue_0(v59, "result.responseBody.vertical") == v18.User then l_Contexts_0.PlayerSearch else "gameSearch";
    l_EventStream_0:sendEventDeferred(v61, l_EventTypes_0.LoadingTime, {
        isAutoSearchType = true, 
        status = v59.status, 
        loadingTime = v60
    });
    l_Diag_0:reportStats(l_createDiagMetricString_0(v58, v59) .. "_" .. v61, v60);
end;
local v63 = v11.PureComponent:extend("SearchPage");
v63.defaultProps = {
    searchType = v19.SearchTypes.Games
};
v63.init = function(v64)
    v64.isMounted = false;
    v64.searchTypeSelectorFrameRef = v11.createRef();
    v64.searchPageRef = v11.createRef();
    v64.searchComponents = {};
    local l_searchType_0 = v64.props.searchType;
    v64.searchInfoMap = {};
    v64.searchInfoMap[l_searchType_0] = {
        searchUuid = v64.props.searchUuid, 
        searchParameters = v64.props.searchParameters
    };
    v64.currentSearchType = l_searchType_0;
    v64.state = {
        activeSelection = not v50 and 1 or nil, 
        currentSearchType = if not v52 then nil else l_searchType_0
    };
    v64.useSearchTypeSelector = function()
        return v19.IsSearchTypeInOmniSearch(if not v52 then v64.currentSearchType else v64.state.currentSearchType);
    end;
    v64.useStickySearchTypeSelector = function()
        return v19.IsSearchTypeInOmniSearch(if not v52 then v64.currentSearchType else v64.state.currentSearchType);
    end;
    v64.updateSearchType = function(v66)
        if not v52 then
            if v64.currentSearchType == v66 then
                return ;
            end;
        elseif v64.state.currentSearchType == v66 then
            return ;
        end;
        if v64.props.searchParameters then
            local l_searchKeyword_0 = v64.props.searchParameters.searchKeyword;
            if not v64.searchInfoMap[v66] then
                local v68 = v31();
                local v69 = {
                    searchKeyword = l_searchKeyword_0, 
                    isKeywordSuggestionEnabled = true
                };
                v64.searchInfoMap[v66] = {
                    searchUuid = v68, 
                    searchParameters = v69
                };
                v64.props.setSearchParameters(v68, v69);
                v64.props.setSearchType(v68, v66);
            end;
            v33.updateSearchType(v64.props.sessionService, v66);
            if not l_FFlagOmniSearchAutoTabIXP_0 then
                if not v52 then
                    v32(v64.props.eventIngest, v66, "search", l_searchKeyword_0);
                elseif v64.currentSearchType ~= v66 then
                    v32(v64.props.eventIngest, v66, "search", l_searchKeyword_0);
                end;
            else
                local v70 = nil;
                if not v52 then
                    v32(v64.props.eventIngest, v66, "search", l_searchKeyword_0, v64.currentSearchType == v19.SearchTypes.Auto);
                else
                    v70 = v64.state.currentSearchType == v19.SearchTypes.Auto;
                    if v64.currentSearchType ~= v66 then
                        v32(v64.props.eventIngest, v66, "search", l_searchKeyword_0, v70);
                    end;
                end;
            end;
            v64.props.setCurrentOmniSearchType(v66);
            if v52 then
                v64:setState({
                    currentSearchType = v66
                });
            end;
            v64.currentSearchType = v66;
            return ;
        else
            assert(false, "self.props.searchParameters should not be nil");
            return ;
        end;
    end;
    v64.updatePageNavBack = function()
        local l_currentPage_0 = v64.props.currentPage;
        if (not l_currentPage_0 or not l_currentPage_0.name) or l_currentPage_0.name ~= v21.SearchPage then
            return ;
        else
            local l_sessionService_0 = v64.props.sessionService;
            local v73 = l_currentPage_0.extraProps and l_currentPage_0.extraProps.omniSearchInfo;
            if v73 then
                assert(v73.omniSearchUuid ~= nil);
                assert(v73.searchKeyword ~= nil);
                local l_omniSearchUuid_0 = v73.omniSearchUuid;
                local l_searchKeyword_1 = v73.searchKeyword;
                if not (not (l_omniSearchUuid_0 == v64.props.omniSearchUuid) or not if not v52 then v64.props.currentOmniSearchType ~= v64.currentSearchType else v64.props.currentOmniSearchType ~= v64.state.currentSearchType) then
                    v64.props.setCurrentOmniSearchType(if not v52 then v64.currentSearchType else v64.state.currentSearchType);
                end;
                v33.create(l_sessionService_0, l_omniSearchUuid_0, l_searchKeyword_1, if not v52 then v64.currentSearchType else v64.state.currentSearchType);
            end;
            return ;
        end;
    end;
    v64.onGamesSelected = function()
        if v64.isMounted then
            v64.updateSearchType(v19.SearchTypes.Games);
            if not v50 then
                v64:setState({
                    activeSelection = 1
                });
            end;
            return ;
        else
            return ;
        end;
    end;
    v64.onPlayersSelected = function()
        if v64.isMounted then
            v64.updateSearchType(v19.SearchTypes.Players);
            if not v50 then
                v64:setState({
                    activeSelection = 2
                });
            end;
            return ;
        else
            return ;
        end;
    end;
    v64.selectorVisible = true;
    v64.onScrollDirectionChanged = function(v76)
        local v77 = v76 == v27.Backward;
        if v77 ~= v64.selectorVisible then
            v64.selectorVisible = v77;
            v64.motor:setGoal({
                searchTypeSelectorFramePosition = v5.spring(v64.getSelectorFramePosition(v77), v55), 
                searchPagePosition = v5.spring(v64.getSearchPagePosition(v77), v55), 
                searchPageSizeOffset = v5.spring(v64.getSearchPageSizeOffset(v77), v55)
            });
        end;
    end;
    v64.getSelectorFramePosition = function(v78)
        local v79 = v64.props.gridConfig[l_LayoutConfig_0.Keys.PaddingVertical];
        local v80 = if not v48 then v64.props.topBarHeight - v79 else -v79;
        if not v78 then
            v80 = v80 - 43;
        end;
        return v80;
    end;
    v64.getSearchPagePosition = function(v81)
        return (v64.getSelectorFramePosition(v81) + 43) - 1;
    end;
    v64.getSearchPageSizeOffset = function(v82)
        return -v64.getSearchPagePosition(v82);
    end;
    v64.checkDispatchInitialOmniSearch = if not l_FFlagOmniSearchAutoTabIXP_0 then nil else function()
        if l_searchType_0 == v19.SearchTypes.Auto then
            if not l_FFlagAutoSearchLoadingTimeEvent_0 then
                return v64.props.dispatchOmniSearchAutoFirstPage(v64.props.networking, v64.props.searchParameters.searchKeyword, v64.props.searchUuid);
            else
                return l_reportPromiseLoadingTimeWrapper_0(v64.props.dispatchOmniSearchAutoFirstPage, function()
                    return {
                        fetch = "search_auto"
                    };
                end, {
                    fireEvent = v62
                })(v64.props.networking, v64.props.searchParameters.searchKeyword, v64.props.searchUuid);
            end;
        else
            return v15.resolve();
        end;
    end;
end;
v63.renderWithLocalized = function(v83, v84)
    local v85 = if not v48 then v83.props.topBarHeight else nil;
    local v86 = if not v52 then v83.currentSearchType else v83.state.currentSearchType;
    local l_searchUuid_0 = v83.searchInfoMap[v86].searchUuid;
    local l_searchParameters_0 = v83.searchInfoMap[v86].searchParameters;
    local l_useCreationCenterTitle_0 = v83.props.useCreationCenterTitle;
    local v90 = v83.props.extraProps or {};
    local v91 = true;
    if v86 == v19.SearchTypes.Catalog then
        v91 = false;
        if not v48 then
            v85 = 0;
        end;
    end;
    local v92 = if not v48 then v85 else 0;
    if v83.useSearchTypeSelector() then
        v92 = v92 + 43;
    end;
    local v93 = not not v83.useStickySearchTypeSelector() and v83.getSearchPagePosition(true) or v92;
    local v94 = nil;
    if not v48 then
        if not (v86 == v19.SearchTypes.Games) or not l_useCreationCenterTitle_0 then
            if not (not (v53 and v86 == v19.SearchTypes.Games) or v54 and not v37.getIsChartsPageRenameEnabled()) then
                v94 = v84.chartsTitle;
            end;
        else
            v94 = v84.creationCenter;
        end;
    end;
    return l_withStyle_0(function(v95)
        local l_Transparency_0 = v95.Theme.BackgroundDefault.Transparency;
        if v86 == v19.SearchTypes.Catalog then
            l_Transparency_0 = 1;
        end;
        local v97 = v11.createElement(v57[v86], v6.Dictionary.join({
            searchUuid = l_searchUuid_0, 
            searchParameters = l_searchParameters_0, 
            onScrollDirectionChanged = not not v83.useStickySearchTypeSelector() and v83.onScrollDirectionChanged or nil, 
            isRoutedFromAutoSearch = if not l_FFlagOmniSearchAutoTabIXP_0 then nil else v83.props.searchType == v19.SearchTypes.Auto
        }, v90));
        if (l_FFlagOmniSearchAutoTabIXP_0 and v86 == v19.SearchTypes.Auto) and v83.props.searchInGamesStatus == v16.Failed then
            v97 = v11.createElement(l_EmptyState_0, {
                onActivated = v83.checkDispatchInitialOmniSearch, 
                text = v84.failedMessage
            });
        end;
        v83.searchComponents[v86] = v97;
        local v98 = {};
        for v99, v100 in pairs(v83.searchComponents) do
            v98[v99] = v11.createElement("Frame", {
                BackgroundTransparency = 1, 
                Position = UDim2.new(0, 0, 0, 0), 
                Size = UDim2.new(1, 0, 1, 0), 
                BorderSizePixel = 0, 
                Visible = v99 == v86
            }, {
                SearchComponent = v100
            });
        end;
        return v11.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1
        }, {
            TopBar = if not v48 and v91 then v11.createElement(v22.Container, {
                ZIndex = 3, 
                searchType = v86, 
                searchParameters = l_searchParameters_0, 
                titleText = v94, 
                leftItem = v22.BackButton, 
                rightItems = {
                    v22.SearchButton, 
                    v22.BuyRobuxButton, 
                    v22.NotificationsButton
                }
            }) else nil, 
            SearchTypeSelectorFrame = v83.useSearchTypeSelector() and v11.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 43), 
                Position = UDim2.new(0, 0, 0, v83.getSelectorFramePosition(true)), 
                BackgroundColor3 = v95.Theme.BackgroundDefault.Color, 
                BackgroundTransparency = l_Transparency_0, 
                BorderSizePixel = 0, 
                ZIndex = 2, 
                [v11.Ref] = v83.searchTypeSelectorFrameRef
            }, {
                Layout = v11.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Vertical, 
                    Padding = UDim.new(0, 10)
                }), 
                SearchTypeSelector = v11.createElement(v25, {
                    selections = {
                        {
                            name = "Games", 
                            text = v84.games, 
                            onActivated = v83.onGamesSelected, 
                            image = "LuaApp/icons/GameDetails/play"
                        }, 
                        l_searchParameters_0 and {
                            name = "Players", 
                            text = v84.players, 
                            onActivated = v83.onPlayersSelected, 
                            image = "LuaApp/icons/avatar_profile"
                        }
                    }, 
                    activeSelection = v56[v86], 
                    size = UDim2.new(1, 0, 0, 32), 
                    backgroundColor3 = v95.Theme.BackgroundDefault.Color, 
                    backgroundTransparency = l_Transparency_0, 
                    layoutOrder = 1, 
                    leftRightPadding = v19.GetPageSideMargin(v83.props.screenSize.X)
                }), 
                Divider = v11.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 1), 
                    LayoutOrder = 2, 
                    BorderSizePixel = 0, 
                    BackgroundColor3 = v95.Theme.Divider.Color, 
                    BackgroundTransparency = v95.Theme.Divider.Transparency
                })
            }), 
            SearchPage = v11.createElement("Frame", {
                BackgroundColor3 = v95.Theme.BackgroundDefault.Color, 
                BackgroundTransparency = l_Transparency_0, 
                ZIndex = 1, 
                Position = UDim2.new(0, 0, 0, v93), 
                Size = UDim2.new(1, 0, 1, not not v83.useStickySearchTypeSelector() and v83.getSearchPageSizeOffset(true) or -v92), 
                BorderSizePixel = if not v83.useSearchTypeSelector() then nil else 0, 
                [v11.Ref] = not not v83.useStickySearchTypeSelector() and v83.searchPageRef or nil
            }, v98)
        });
    end);
end;
v63.render = function(v101)
    return l_withLocalization_0({
        creationCenter = "CommonUI.Features.Label.CreationCenter", 
        games = "CommonUI.Features.Label.Game", 
        players = "CommonUI.Features.Label.Players", 
        failedMessage = if not l_FFlagOmniSearchAutoTabIXP_0 then nil else "Feature.EmptyStatePage.Message.NoInternet", 
        chartsTitle = if not v53 then nil else "CommonUI.Features.Label.Charts"
    })(function(v102)
        return (v101:renderWithLocalized(v102));
    end);
end;
v63.didMount = function(v103)
    v103.isMounted = true;
    if v103.useStickySearchTypeSelector() then
        v103.motor = v5.createGroupMotor({
            searchTypeSelectorFramePosition = v103.getSelectorFramePosition(true), 
            searchPagePosition = v103.getSearchPagePosition(true), 
            searchPageSizeOffset = v103.getSearchPageSizeOffset(true)
        });
        v103.motor:onStep(function(v104)
            if v103.searchTypeSelectorFrameRef.current then
                v103.searchTypeSelectorFrameRef.current.Position = UDim2.new(0, 0, 0, v104.searchTypeSelectorFramePosition);
            end;
            local l_searchPagePosition_0 = v104.searchPagePosition;
            local l_searchPageSizeOffset_0 = v104.searchPageSizeOffset;
            v103.searchPageRef.current.Position = UDim2.new(0, 0, 0, l_searchPagePosition_0);
            v103.searchPageRef.current.Size = UDim2.new(1, 0, 1, l_searchPageSizeOffset_0);
        end);
        v103.motor:start();
        if l_FFlagOmniSearchAutoTabIXP_0 then
            v103.checkDispatchInitialOmniSearch();
        end;
        return ;
    else
        return ;
    end;
end;
v63.willUnmount = function(v107)
    v107.isMounted = false;
    if v107.motor then
        v107.motor:destroy();
    end;
end;
v63.didUpdate = function(v108, v109, _)
    if v109.currentPage ~= v108.props.currentPage then
        v108.updatePageNavBack();
    end;
    if l_FFlagOmniSearchAutoTabIXP_0 then
        local v111 = if not v52 then v108.currentSearchType else v108.state.currentSearchType;
        if v108.props.searchType ~= v111 and v111 == v19.SearchTypes.Auto then
            v108.updateSearchType(v108.props.searchType);
        end;
    end;
end;
local v128 = l_RoactAppPolicy_0.connect(function(v112, _)
    return {
        useCreationCenterTitle = v112.getGamesPageCreationCenterTitle()
    };
end)((l_RoactServices_0.connect({
    eventIngest = v3, 
    sessionService = l_AppSessionService_0, 
    networking = if not l_FFlagOmniSearchAutoTabIXP_0 then nil else v13
})((v12.connect(function(v114, v115)
    local v116 = v114.Navigation.history[#v114.Navigation.history];
    return {
        topBarHeight = if not v48 then v114.TopBar.topBarHeight else nil, 
        searchParameters = v114.SearchesParameters[v115.searchUuid], 
        searchType = v114.SearchesTypes[v115.searchUuid], 
        screenSize = v114.ScreenSize, 
        currentPage = v116[#v116], 
        currentOmniSearchType = v114.CurrentOmniSearchType, 
        searchInGamesStatus = if not l_FFlagOmniSearchAutoTabIXP_0 then nil else v114.RequestsStatus.SearchesInGamesStatus[v115.searchUuid] or v16.NotStarted
    };
end, function(v117)
    return {
        openWebview = function(v118, v119)
            return v117(v26(v118, v119));
        end, 
        setCurrentOmniSearchType = function(v120)
            return v117(v28(v120));
        end, 
        setSearchType = function(v121, v122)
            return v117(v29(v121, v122));
        end, 
        setSearchParameters = function(v123, v124)
            return v117(v30(v123, v124));
        end, 
        dispatchOmniSearchAutoFirstPage = if not l_FFlagOmniSearchAutoTabIXP_0 then nil else function(v125, v126, v127)
            return v117(v36(v125, {
                searchKeyword = v126, 
                searchUuid = v127
            }));
        end
    };
end)(v63)))));
return function(v129)
    local v132 = if not l_FFlagUnifyNavigationGraph_0 then {} else l_useNavigationProps_0(function(v130, v131)
        if not v130 then
            return {};
        else
            return {
                searchUuid = v130, 
                omniSearchUuid = v131.omniSearchInfo and v131.omniSearchInfo.omniSearchUuid
            };
        end;
    end);
    return l_withGridConfig_DEPRECATED_0({
        [l_LayoutConfig_0.Keys.PaddingVertical] = 0
    }, l_LayoutConfig_0.Kind)(function(v133)
        return v11.createElement(v128, v6.Dictionary.join(v129, {
            gridConfig = v133
        }, v132));
    end);
end;
