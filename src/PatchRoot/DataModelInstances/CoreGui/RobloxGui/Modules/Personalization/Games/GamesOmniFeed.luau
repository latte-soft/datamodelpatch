local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.useNavigation;
local l_AppSessionService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppSessionService;
local v6 = require(l_CorePackages_0.UIBlox);
local l_LoadingStateContainer_0 = v6.App.Container.LoadingStateContainer;
local l_RetrievalStatus_0 = v6.App.Loading.Enum.RetrievalStatus;
local l_EmptyState_0 = v6.App.Indicator.EmptyState;
local v10 = require(l_CorePackages_0.RoactNavigation);
local l_useUserExperiment_0 = require(l_CorePackages_0.Packages.RoactAppExperiment).useUserExperiment;
local v12 = require(l_CorePackages_0.Promise);
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v14 = require(l_Modules_0.LuaApp.Components.Games.TokenRefreshComponent);
local v15 = require(l_Modules_0.LuaApp.Constants);
local v16 = require(l_Modules_0.Personalization.Sessions.PageSessionManager);
local l_SessionType_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppSessionization).SessionType;
local v18 = require(l_Modules_0.LuaApp.AppPage);
local v19 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local v20 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v21 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local v22 = require(l_Modules_0.LuaApp.Services.AppEventIngestService);
local v23 = require(l_Modules_0.LuaApp.Hooks.useLocalization);
local v24 = require(l_Modules_0.LuaApp.Thunks.FetchGamesPageData);
local v25 = require(l_Modules_0.LuaApp.Enum.RetrievalStatus);
local v26 = require(l_Modules_0.LuaApp.Experiment.AppUserLayers);
local v27 = require(l_Modules_0.Personalization.OmniFeed.DataStore.AddLocalOmniItems);
local v28 = require(l_Modules_0.Personalization.OmniFeed.FeedViews.OmniFeedViewSelector);
local v29 = require(l_Modules_0.LuaApp.Actions.RefreshSiteAlertInfo);
local v30 = require(l_Modules_0.LuaApp.Thunks.FetchDataWithErrorToasts);
local v31 = require(l_Modules_0.LuaApp.Thunks.RefreshGameSorts);
local v32 = require(l_Modules_0.Personalization.Sessions.DiscoverPageSession);
local v33 = require(l_Modules_0.Personalization.Analytics.feedScroll);
local v34 = require(l_Modules_0.Personalization.Flags.getFIntLuaAppInitialGameSortsFetchCount);
local v35 = require(l_Modules_0.Personalization.Flags.GetFFlagExploreApiSortsEnabledIXP);
local v36 = require(l_Modules_0.Personalization.Flags.GetFFlagExploreApiSortsEnabledByDefault);
local v37 = require(l_Modules_0.Personalization.Flags.GetFFlagExploreApiSortsEnabled);
local v38 = require(l_Modules_0.Personalization.Flags.GetFFlagLuaAppExploreSortsConfigurableIXPLayer);
local v39 = require(l_Modules_0.Personalization.Flags.FStringLuaAppExploreApiSortsMigrationLayer);
local l_Games_0 = v18.Games;
return function(_)
    local v42 = v19(l_AppSessionService_0);
    local v43 = v19(v20);
    local v44 = v19(v21);
    local v45 = v19(v22);
    local v46 = l_useNavigation_0();
    local v47 = v1.useRef(nil);
    local v49 = l_useSelector_0(function(v48)
        return v48.Startup.GamesPageDataStatus;
    end);
    local v51 = l_useSelector_0(function(v50)
        return v50.Personalization.OrderedOmniItems[l_Games_0];
    end);
    local v52 = l_useDispatch_0();
    local v54 = l_useSelector_0(function(v53)
        return v53.ScreenSize;
    end);
    local v55 = nil;
    if v35() then
        local v56 = if not v38() then v26.DiscoverPageAccessLayer else v39;
        local l_v56_0 = v56 --[[ copy: 12 -> 26 ]];
        v55 = l_useUserExperiment_0({
            v56
        }, function(v58)
            return (v58[l_v56_0] or {}).IsExploreApiSortsEnabled;
        end);
    end;
    local v59 = v36() or v55;
    local v61 = if not v37() then nil else l_useSelector_0(function(v60)
        return v60.Personalization.DiscoveryNextPageId;
    end);
    local v62 = if not v37() then nil else v1.useRef(nil);
    local function v64(v63)
        if v59 then
            if v63 and v62.current == v63 then
                return v12.reject("Already fetching");
            else
                v62.current = v63;
            end;
        end;
        return (v52(v24(v43, v44, v34(), v63, v55)));
    end;
    local function v65()
        if not (not (v49 ~= v25.Fetching) or not v61) and v61 ~= "" then
            return v64(v61);
        else
            return v12.reject("Cannot load page");
        end;
    end;
    local function v67(v66)
        v52(v27(v66, l_Games_0));
    end;
    local function v68()
        v52(v29());
        if not v59 then
            return v52(v30(v31(v43, {
                v15.GameSortGroups.Games
            }, nil, nil, v55)));
        else
            return v64();
        end;
    end;
    local function v74(v69, v70, v71)
        local l_Y_0 = Enum.ScrollingDirection.Y;
        if l_Y_0 then
            local v73 = 0;
            if v47.current then
                v73 = v47.current.AbsoluteSize.Y;
            end;
            v33(v45, l_Games_0, l_Y_0, {
                distance = v69, 
                screenSizeX = v54.X, 
                screenSizeY = v54.Y, 
                scrollAreaSize = v73, 
                scrollDepth = if v73 > 0 then v69 / v73 else nil, 
                startDepth = if v73 > 0 then v71 / v73 else nil, 
                startPos = v71, 
                scrollDuration = v70
            });
        end;
    end;
    local v75 = not not v51 and v51.allItems or {};
    local v76 = not not v51 and (v51.hasLocalItems or false);
    v1.useEffect(function()
        if not v76 then
            v52(v27({}, l_Games_0));
        end;
    end, {
        v76, 
        v67
    });
    local v77 = nil;
    local v78 = nil;
    if v37() then
        local v79, v80 = v1.useState(v49);
        v77 = v79;
        v78 = v80;
    end;
    v1.useEffect(function()
        if v49 == v25.NotStarted then
            if v59 then
                v62.current = nil;
            end;
            local _ = v52(v24(v43, v44, v34(), nil, v55));
        end;
        local v83 = v46.addListener(v10.Events.WillFocus, function()
            if v49 == v25.NotStarted then
                if v59 then
                    v62.current = nil;
                end;
                local _ = v52(v24(v43, v44, v34(), nil, v55));
            end;
        end);
        if v59 and v77 ~= v25.Done then
            v78(v49);
        end;
        return function()
            if v83 ~= nil then
                v83.remove();
            end;
        end;
    end, {
        v46, 
        v49, 
        if not v37() then nil else v77
    });
    return v1.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0
    }, {
        TokenRefreshComponent = if v59 then nil else v1.createElement(v14, {
            sortToRefresh = v15.GameSortGroups.Games
        }), 
        PageSessionManager = v1.createElement(v16, {
            appPage = l_Games_0, 
            setPageSession = function()
                if v42 ~= nil then
                    v42:SetSession(l_SessionType_0.StructuralIdentifier.Level1, l_SessionType_0.StructuralIdentifier.DiscoverPageSessionInfo, l_SessionType_0.StructuralIdentifier.DiscoverPageSessionInfo);
                    if v59 then
                        v42:SetMetadata(l_SessionType_0.StructuralIdentifier.DiscoverPageSessionInfo, l_SessionType_0.Metadata.DiscoverPage.DiscoverSessionId, v32:Get());
                    end;
                end;
            end
        }), 
        LoadingStateContainer = v1.createElement(l_LoadingStateContainer_0, {
            dataStatus = l_RetrievalStatus_0.fromRawValue(if not v59 then v49 else v77), 
            onRetry = v64, 
            renderOnLoaded = function()
                return v1.createElement(v28, {
                    pageContext = l_Games_0, 
                    refresh = v68, 
                    omniFeedItems = v75, 
                    impressionsTag = "GAMESFEEDITEM_IMPRESSIONS", 
                    scrollingFrameRef = v47, 
                    analyticsContext = "GamesOmniFeed", 
                    hasNextPage = (v59 and v61) and v61 ~= "", 
                    loadNext = not not v59 and v65 or nil, 
                    sendScrollEvent = v74
                });
            end, 
            renderOnFailed = function()
                return function(_)
                    return v1.createElement(l_EmptyState_0, {
                        onActivated = v64, 
                        text = v23({
                            failedMessage = "Feature.EmptyStatePage.Message.NoInternet"
                        }).failedMessage
                    });
                end;
            end
        })
    });
end;
