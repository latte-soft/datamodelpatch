local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Cryo);
local v3 = require(l_Modules_0.LuaApp.Actions.Games.AddGames);
local v4 = require(l_Modules_0.LuaApp.Actions.SetSearchInGames);
local v5 = require(l_Modules_0.LuaApp.Actions.AppendSearchInGames);
local v6 = require(l_Modules_0.LuaApp.Actions.SetSearchInGamesStatus);
local v7 = require(l_Modules_0.LuaApp.Http.Requests.SearchGetOmniSearch);
local l_ReportToDiagByCountryCode_0 = require(l_CorePackages_0.Workspace.Packages.Analytics).ReportToDiagByCountryCode;
local v9 = require(l_Modules_0.LuaApp.Enum.SearchRetrievalStatus);
local l_ApiFetchBigGameIcons_0 = require(l_CorePackages_0.Workspace.Packages.GameIconRodux).BigGameIcons.ApiFetchBigGameIcons;
local l_ApiFetchGameIcons_0 = require(l_CorePackages_0.Workspace.Packages.GameIconRodux).GameIcons.ApiFetchGameIcons;
local v12 = require(l_Modules_0.LuaApp.Models.GamesApi.Game);
local v13 = require(l_Modules_0.LuaApp.Models.GamesApi.GameSearchEntry);
local v14 = require(l_Modules_0.LuaApp.Models.SearchInGames);
local v15 = require(l_Modules_0.LuaApp.Promise);
local v16 = require(l_CorePackages_0.tutils);
local v17 = require(l_Modules_0.Personalization.OmniFeed.DataStore.AddSearchResultsOmniFeed);
local v18 = require(l_CorePackages_0.Workspace.Packages.GameIconRodux);
local l_GameIconReducer_0 = v18.GameIcons.GameIconReducer;
local l_BigGameIconReducer_0 = v18.BigGameIcons.BigGameIconReducer;
local l_FFlagRefactorOmniSearchFetch_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagRefactorOmniSearchFetch;
local v22 = require(l_Modules_0.LuaApp.Thunks.Search.HandleGameSearchResults);
local v23 = tonumber(settings():GetFVariable("PercentReportingGamesListRTT"));
return function(v24, v25)
    return function(v26)
        local l_searchKeyword_0 = v25.searchKeyword;
        local l_searchUuid_0 = v25.searchUuid;
        if l_searchUuid_0 then
            if l_searchKeyword_0 then
                local l_SearchesInGamesStatus_0 = v26:getState().RequestsStatus.SearchesInGamesStatus;
                local v30 = l_SearchesInGamesStatus_0[l_searchUuid_0];
                if v30 == v9.Fetching then
                    return v15.resolve("Search with Uuid " .. l_searchUuid_0 .. " has been debounced");
                else
                    local v31 = {
                        SearchQuery = l_searchKeyword_0, 
                        SessionId = l_searchUuid_0, 
                        PageType = "all"
                    };
                    if v25.isAppend then
                        local v32 = v26:getState().Search.SearchesInGames[l_searchUuid_0];
                        assert(v32);
                        v31.PageToken = v32.nextPageToken;
                    end;
                    v26:dispatch(v6(l_searchUuid_0, v9.Fetching));
                    return v7(v24, v31):andThen(function(v33)
                        if not l_FFlagRefactorOmniSearchFetch_0 then
                            local v34 = {};
                            local v35 = {};
                            local v36 = {};
                            local l_Games_0 = v26:getState().Games;
                            local v38 = v26:getState()[l_GameIconReducer_0.key];
                            local v39 = v26:getState()[l_BigGameIconReducer_0.key];
                            local l_responseBody_0 = v33.responseBody;
                            l_SearchesInGamesStatus_0 = v26:getState().RequestsStatus.SearchesInGamesStatus;
                            v30 = l_SearchesInGamesStatus_0[l_searchUuid_0];
                            if v30 == v9.Removed then
                                return v15.resolve("Search with Uuid " .. l_searchUuid_0 .. " has been terminated");
                            else
                                local v41 = nil;
                                local v42 = false;
                                for v43, v44 in pairs(l_responseBody_0.searchResults) do
                                    local v45 = v44.contents[1];
                                    local l_topicId_0 = v44.topicId;
                                    local v47 = nil;
                                    v47 = tostring(v45.rootPlaceId);
                                    local v48 = tostring(v45.universeId);
                                    if l_Games_0[v48] then
                                        local l_placeId_0 = l_Games_0[v48].placeId;
                                        if l_placeId_0 and l_placeId_0 ~= v47 then
                                            v47 = l_placeId_0;
                                            warn("The placeId does not match the placeId already stored ");
                                        end;
                                    end;
                                    local v50 = v2.Dictionary.join(v45, {
                                        placeId = v47, 
                                        creatorId = "none", 
                                        topicId = l_topicId_0
                                    });
                                    local v51 = v44.contentGroupType == "Game";
                                    v13.fromJsonData(v50, v51):match(function(v52)
                                        v34[v43] = v52;
                                        v26:dispatch(v17(l_searchUuid_0, l_topicId_0, v44.contentGroupType));
                                        if not v51 then
                                            return ;
                                        else
                                            return v12.fromJsonData(v50):match(function(v53)
                                                local l_universeId_0 = v53.universeId;
                                                if not (not (v43 == 1) or not v50.emphasis) then
                                                    v41 = l_universeId_0;
                                                    v42 = true;
                                                end;
                                                if not v16.shallowEqual(v53, l_Games_0[l_universeId_0]) then
                                                    v35[l_universeId_0] = v53;
                                                end;
                                                if l_universeId_0 ~= v41 and v38[l_universeId_0] == nil then
                                                    table.insert(v36, l_universeId_0);
                                                end;
                                            end);
                                        end;
                                    end):matchError(function(v55)
                                        warn(v55);
                                    end);
                                end;
                                if next(v35) then
                                    v26:dispatch(v3(v35));
                                end;
                                local v56 = v14.fromOmniSearch(l_searchKeyword_0, v34, v42, l_responseBody_0.nextPageToken);
                                if not v25.isAppend then
                                    v26:dispatch(v4(l_searchUuid_0, v56));
                                else
                                    v26:dispatch(v5(l_searchUuid_0, v56));
                                end;
                                v26:dispatch(v6(l_searchUuid_0, v9.Done));
                                l_ReportToDiagByCountryCode_0("GamesList", "RoundTripTime", v33.responseTimeMs, v23);
                                if v41 and v39[v41] == nil then
                                    v26:dispatch(l_ApiFetchBigGameIcons_0(v24, {
                                        v41
                                    }));
                                end;
                                if #v36 > 0 then
                                    v26:dispatch(l_ApiFetchGameIcons_0(v24, v36));
                                end;
                                return v15.resolve();
                            end;
                        else
                            local v57 = v26:dispatch(v22(v24, v25, v33));
                            l_ReportToDiagByCountryCode_0("GamesList", "RoundTripTime", v33.responseTimeMs, v23);
                            return v57;
                        end;
                    end, function(v58)
                        v26:dispatch(v6(l_searchUuid_0, v9.Failed));
                        return v15.reject(v58);
                    end);
                end;
            else
                return v15.reject("Must have a searchKeyword to search with.");
            end;
        else
            return v15.reject("Must have a searchUuid.");
        end;
    end;
end;
