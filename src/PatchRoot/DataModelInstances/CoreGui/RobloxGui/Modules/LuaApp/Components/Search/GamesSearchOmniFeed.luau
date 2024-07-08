local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local v5 = require(l_Modules_0.LuaApp.AppPage);
local v6 = require(l_Modules_0.LuaApp.Constants);
local v7 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local v8 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v9 = require(l_Modules_0.LuaApp.Services.AppEventIngestService);
local v10 = require(l_Modules_0.LuaApp.Thunks.FetchDataWithErrorToasts);
local v11 = require(l_Modules_0.LuaApp.Thunks.Search.ApiFetchGameSearchResults);
local v12 = require(l_Modules_0.Personalization.OmniFeed.FeedViews.OmniFeedViewLoadMore);
local v13 = require(l_Modules_0.Personalization.OmniFeed.OmniFeedTypes);
local _ = require(l_CorePackages_0.Workspace.Packages.AppCommonLib);
local v15 = require(l_Modules_0.LuaApp.Enum.SearchRetrievalStatus);
local v16 = require(l_Modules_0.Personalization.Analytics.feedScroll);
local l_mutedError_0 = require(l_CorePackages_0.Workspace.Packages.Loggers).mutedError;
return function(v18)
    local l_SearchPage_0 = v5.SearchPage;
    local v20 = v2.useRef(nil);
    local l_searchUuid_0 = v18.searchUuid;
    local v22 = v7(v8);
    local v23 = v7(v9);
    local v25 = l_useSelector_0(function(v24)
        return v24.Search.SearchesInGames[l_searchUuid_0];
    end);
    local v27 = l_useSelector_0(function(v26)
        if not l_searchUuid_0 or not v26.SearchesParameters[l_searchUuid_0] then
            return nil;
        else
            return v26.SearchesParameters[l_searchUuid_0].searchKeyword;
        end;
    end);
    local v29 = l_useSelector_0(function(v28)
        return v28.RequestsStatus.SearchesInGamesStatus[l_searchUuid_0];
    end);
    local v31 = l_useSelector_0(function(v30)
        return not not v30.Personalization.OrderedOmniItems[l_SearchPage_0] and v30.Personalization.OrderedOmniItems[l_SearchPage_0][l_searchUuid_0] or nil;
    end);
    local v32 = not not v31 and v31.allItems or {};
    local v34 = l_useSelector_0(function(v33)
        return v33.ScreenSize;
    end);
    local v35 = l_useDispatch_0();
    return v2.createElement(v12, {
        pageContext = l_SearchPage_0, 
        refresh = function()
            return v35(v10(v11(v22, {
                searchKeyword = v27, 
                searchUuid = l_searchUuid_0, 
                isAppend = false
            })));
        end, 
        omniFeedItems = v32, 
        impressionsTag = "SEARCHRESULTS_FEEDITEM_IMPRESSIONS", 
        scrollingFrameRef = v20, 
        analyticsContext = v6.AnalyticsContext.SearchExperienceTile, 
        loadNext = (not not v25.hasMoreRows and v29 ~= v15.Fetching) and function()
            return v35(v10(v11(v22, {
                searchKeyword = v27, 
                searchUuid = v18.searchUuid, 
                isAppend = true
            })));
        end or nil, 
        createEndOfScrollElement = v18.createEndOfScrollElement, 
        onScrollDirectionChanged = v18.onScrollDirectionChanged, 
        topPadding = (not not v32[1] and v32[1].treatmentType == v13.SearchGameGrid) and 26 or 0, 
        sendScrollEvent = function(v36, v37, v38)
            local v39 = if not v20.current then nil else v20.current.ScrollingDirection;
            if v39 then
                local v40 = 0;
                if v20.current then
                    if v39 == Enum.ScrollingDirection.X then
                        v40 = v20.current.AbsoluteSize.X;
                    elseif v39 == Enum.ScrollingDirection.Y then
                        v40 = v20.current.AbsoluteSize.Y;
                    else
                        l_mutedError_0((("Direction %* is an unsupported option for feedScroll event"):format(v39.Name)));
                    end;
                end;
                v16(v23, l_SearchPage_0, v39, {
                    distance = v36, 
                    screenSizeX = v34.X, 
                    screenSizeY = v34.Y, 
                    scrollAreaSize = v40, 
                    scrollDepth = if v40 > 0 then v36 / v40 else nil, 
                    startDepth = if v40 > 0 then v38 / v40 else nil, 
                    startPos = v38, 
                    scrollDuration = v37
                });
            end;
        end
    });
end;
