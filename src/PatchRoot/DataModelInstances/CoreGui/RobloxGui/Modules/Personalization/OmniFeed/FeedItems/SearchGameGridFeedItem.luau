local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local v4 = require(l_Modules_0.LuaApp.Components.Games.GameGridSelector);
local v5 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local l_RoactAnalyticsCommonGameEvents_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).RoactAnalyticsCommonGameEvents;
local v7 = require(l_Modules_0.LuaApp.getCurrentPage);
local v8 = require(l_Modules_0.LuaApp.Constants);
local _ = require(l_CorePackages_0.Workspace.Packages.AppCommonLib);
local v10 = require(l_Modules_0.Personalization.OmniFeed.OmniFeedProps);
local v11 = require(l_Modules_0.LuaApp.AppPage);
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local v13 = require(l_Modules_0.LuaApp.Actions.RemoveSearchInGames);
local v14 = require(l_Modules_0.LuaApp.Actions.SetSearchInGamesStatus);
local v15 = require(l_Modules_0.LuaApp.Enum.SearchRetrievalStatus);
local v16 = require(l_Modules_0.LuaApp.Analytics.Events.Games.gamePlayIntent);
local v17 = require(l_Modules_0.LuaApp.Services.AppEventIngestService);
local v18 = require(l_Modules_0.Personalization.Games.GameSortImpressionsDetector);
local v19 = require(l_Modules_0.Personalization.Games.SendGameImpressions);
local v20 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
return function(v21)
    local l_searchUuid_0 = v21.searchUuid;
    local l_feedItemPosition_0 = v21[v10.key].feedItemPosition;
    local v24 = l_useDispatch_0();
    local v25 = v5(l_RoactAnalyticsCommonGameEvents_0);
    local v26 = v5(v20);
    local v27 = v5(v17);
    local v28 = v2.useRef(nil);
    local v29 = "SearchResults" .. tostring(l_searchUuid_0);
    local v31 = l_useSelector_0(function(v30)
        return v30.Search.SearchesInGames[l_searchUuid_0];
    end);
    local v33 = l_useSelector_0(function(v32)
        return v7(v32);
    end);
    local v35 = l_useSelector_0(function(v34)
        return v34.ScreenSize;
    end);
    v2.useEffect(function()
        return function()
            local function _(v36)
                v24(v13(v36));
                v24(v14(v36, v15.Removed));
            end;
            local l_l_searchUuid_0_0 = l_searchUuid_0;
            v24(v13(l_l_searchUuid_0_0));
            v24(v14(l_l_searchUuid_0_0, v15.Removed));
        end;
    end, {});
    local v39 = v8.GetPageSideMargin(v35.X);
    local v40, v41 = v2.useState(v35);
    local v42, v43 = v2.useState(Vector2.new(v35.X - 2 * v39, v35.Y));
    local function v48(v44)
        local v45 = {};
        for _, v47 in ipairs(v44) do
            if v47.topicId == v21.topicId then
                table.insert(v45, v47);
            end;
        end;
        return v45;
    end;
    local v49, v50 = v2.useState(not not v31 and v48(v31.entries) or {});
    v2.useEffect(function()
        v50((v48(v31.entries)));
    end, {
        v31
    });
    local function v53(v51)
        local v52 = v49[v51];
        if v52 ~= nil then
            v25.reportOpenGameDetailFromSearch(v52.placeId, v51, #v49, v52.isSponsored, v52.universeId, v33, l_feedItemPosition_0, v21.topicId);
        end;
    end;
    local function v56(v54)
        if v54 then
            local l_AbsoluteContentSize_0 = v54.AbsoluteContentSize;
            if v42.X == l_AbsoluteContentSize_0.X and v42.Y == l_AbsoluteContentSize_0.Y then
                return ;
            elseif l_AbsoluteContentSize_0.X > 0 and l_AbsoluteContentSize_0.Y > 0 then
                v43(l_AbsoluteContentSize_0);
            end;
        end;
    end;
    local function v58(v57)
        if v57 then
            v41(v57.AbsoluteSize);
        end;
    end;
    local v59 = v40.X and v8.GetPageSideMargin(v40.X);
    return v2.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 0), 
        Position = UDim2.new(0, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        [v2.Change.AbsoluteSize] = v58, 
        ref = v28
    }, {
        Layout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 12), 
            [v2.Change.AbsoluteContentSize] = v56
        }), 
        Padding = v2.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, v59), 
            PaddingRight = UDim.new(0, v59)
        }), 
        v2.createElement(v4, {
            LayoutOrder = 2, 
            entries = v49, 
            source = "SearchResults", 
            reportGameDetailOpened = v53, 
            horizontalAlignment = Enum.HorizontalAlignment.Left, 
            windowSize = Vector2.new(v42.X, v40.Y), 
            screenSize = v35, 
            searchResultGrid = true, 
            gameEmphasis = v31 and v31.emphasis, 
            currentSidePadding = v59, 
            scrollViewPositionChangedSignal = v21[v10.key].scrollViewPositionChangedSignal, 
            impressionsTag = v29, 
            reportExperienceLaunched = function(v60)
                v16(v27, v8.AnalyticsContext.SearchExperienceTile, {
                    placeId = v60.placeId, 
                    rootPlaceId = tonumber(v60.placeId), 
                    sortEntryIndex = tostring(v60.index), 
                    sortIndex = l_feedItemPosition_0, 
                    gameSetTypeId = v21.topicId
                });
            end, 
            launchExperienceEventContext = v8.AnalyticsContext.SearchExperienceTile
        }), 
        GameSortImpressionsDetector = v2.createElement(v18, {
            parentRef = v28, 
            pageContext = v11.SearchPage, 
            impressionsTag = v29, 
            scrollViewPositionChangedSignal = v21[v10.key].scrollViewPositionChangedSignal, 
            sendGameImpressions = function(v61)
                if v31 then
                    v19.sendFromSearch(v27, v26, v61, v49, v11.SearchPage, {
                        searchUuid = l_searchUuid_0, 
                        emphasisFlag = not v31.emphasis and 0 or 1, 
                        seeAllFlag = 1, 
                        sortPos = l_feedItemPosition_0, 
                        gameSetTypeId = v21.topicId
                    });
                    return ;
                else
                    return ;
                end;
            end
        })
    });
end;
