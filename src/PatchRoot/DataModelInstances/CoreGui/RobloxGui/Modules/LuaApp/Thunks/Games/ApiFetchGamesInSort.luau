local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Cryo);
local v3 = require(l_Modules_0.LuaApp.Http.Requests.GamesApi.GamesGetList);
local v4 = require(l_Modules_0.LuaApp.Http.Requests.ExploreApi.ExploreGetSortContents);
local l_ReportToDiagByCountryCode_0 = require(l_CorePackages_0.Workspace.Packages.Analytics).ReportToDiagByCountryCode;
local v6 = require(l_Modules_0.LuaApp.Actions.Games.AddGames);
local v7 = require(l_Modules_0.LuaApp.Actions.Games.SetGameSortStatus);
local v8 = require(l_Modules_0.LuaApp.Enum.RetrievalStatus);
local l_ApiFetchGameIcons_0 = require(l_CorePackages_0.Workspace.Packages.GameIconRodux).GameIcons.ApiFetchGameIcons;
local v10 = require(l_Modules_0.LuaApp.Models.GamesApi.Game);
local v11 = require(l_Modules_0.LuaApp.Models.DiscoveryApi.DiscoveryGame);
local v12 = require(l_Modules_0.LuaApp.Constants);
local v13 = require(l_Modules_0.LuaApp.Promise);
local v14 = require(l_CorePackages_0.tutils);
local v15 = require(l_Modules_0.Personalization.Games.DataStore.TopicContentsModel);
local v16 = require(l_Modules_0.Personalization.Games.DataStore.TopicContentsEntryModel);
local v17 = require(l_Modules_0.Personalization.Games.DataStore.AddTopicContents);
local l_getAppFeaturePolicies_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).getAppFeaturePolicies;
local v19 = require(script.Parent.updateGamesSortData);
local v20 = require(l_Modules_0.Personalization.Sessions.DiscoverPageSession);
local v21 = tonumber(settings():GetFVariable("PercentReportingGamesListRTT"));
local v22 = require(l_Modules_0.Personalization.Flags.GetFStringLuaAppExploreApiSupportedSortNames);
local v23 = require(l_Modules_0.Personalization.Flags.GetFFlagExploreApiSortsEnabled);
local v24 = string.split(v22(), ",");
return function(v25, v26, v27, v28)
    return function(v29)
        if not (v26 ~= nil) or v26.name == nil then
            return v13.resolve("Invalid sort request");
        elseif v29:getState().RequestsStatus.GameSortsStatus[v26.name] == v8.Fetching then
            return v13.resolve("Request for sort " .. v26.name .. " has been debounced");
        else
            local v30 = false;
            if v24 then
                for _, v32 in v24, nil, nil do
                    if v26.name == v32 then
                        v30 = true;
                        break;
                    end;
                end;
            end;
            local v33 = nil;
            v33 = if not v23() then v30 and l_getAppFeaturePolicies_0().getUseOmniRecommendation() else v30;
            local v34 = v28 or {};
            if not v33 then
                v34.sortToken = v26.token;
                v34.contextUniverseId = v26.contextUniverseId;
                v34.contextCountryRegionId = v26.contextCountryRegionId;
                v34.gameSetTargetId = v26.gameSetTargetId;
                v34.startRows = v34.startRows or 0;
                v34.maxRows = v34.maxRows or v12.DEFAULT_GAME_FETCH_COUNT;
            else
                v34.sortId = v26.name;
                v34.sessionId = if not v23() then v26.token else v20:Get();
            end;
            local v35 = if not v33 then v3 else v4;
            v29:dispatch(v7(v26.name, v8.Fetching));
            return v35(v25, v34):andThen(function(v36)
                if not v23() or not v33 then
                    local v37 = {};
                    local v38 = {};
                    local v39 = {};
                    local l_Games_0 = v29:getState().Games;
                    local l_responseBody_0 = v36.responseBody;
                    if #l_responseBody_0.games == 0 then
                        warn("Found no games in this sort:", v26.displayName);
                    end;
                    for v42, v43 in pairs(l_responseBody_0.games) do
                        (if not v33 then v16.fromGamesApiData(v43) else v16.fromExploreApiData(v43)):match(function(v44)
                            return (if not v33 then v10.fromJsonData(v43) else v11.fromJsonData(v43)):match(function(v45)
                                v37[v42] = v2.Dictionary.join(v45, v44);
                                local l_universeId_0 = v45.universeId;
                                if not v14.shallowEqual(v45, l_Games_0[l_universeId_0]) then
                                    v38[l_universeId_0] = v45;
                                    table.insert(v39, l_universeId_0);
                                end;
                            end);
                        end):matchError(function(v47)
                            warn(v47);
                        end);
                    end;
                    if next(v38) then
                        v29:dispatch(v6(v38));
                    end;
                    local v48 = nil;
                    if not v33 then
                        v48 = {
                            entries = v37, 
                            rowsRequested = v34.startRows + v34.maxRows, 
                            hasMoreRows = l_responseBody_0.hasMoreRows, 
                            nextPageExclusiveStartId = l_responseBody_0.nextPageExclusiveStartId, 
                            nextPageToken = ""
                        };
                    else
                        local v49 = {
                            entries = v37, 
                            rowsRequested = 0
                        };
                        local v50 = false;
                        if l_responseBody_0.nextPageToken ~= nil then
                            v50 = l_responseBody_0.nextPageToken ~= "";
                        end;
                        v49.hasMoreRows = v50;
                        v49.nextPageExclusiveStartId = "";
                        v49.nextPageToken = l_responseBody_0.nextPageToken;
                        v48 = v49;
                    end;
                    if not v27 then
                        v48.updatedTimestamp = tick();
                    end;
                    v29:dispatch(v17(v26.name, v15.fromData(v48), v27));
                    v29:dispatch(v7(v26.name, v8.Done));
                    if #v39 > 0 then
                        v29:dispatch(l_ApiFetchGameIcons_0(v25, v39));
                    end;
                    if not v33 then
                        l_ReportToDiagByCountryCode_0("GamesList", "RoundTripTime", v36.responseTimeMs, v21);
                    end;
                    return ;
                else
                    v19(v25, v29, v36.responseBody, v27);
                    v29:dispatch(v7(v26.name, v8.Done));
                    return ;
                end;
            end, function(v51)
                v29:dispatch(v7(v26.name, v8.Failed));
                return v13.reject(v51);
            end);
        end;
    end;
end;
