local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Cryo);
local v3 = require(l_Modules_0.LuaApp.Promise);
local v4 = require(l_Modules_0.LuaApp.Models.GamesApi.Game);
local l_ApiFetchBigGameIcons_0 = require(l_CorePackages_0.Workspace.Packages.GameIconRodux).BigGameIcons.ApiFetchBigGameIcons;
local l_ApiFetchGameIcons_0 = require(l_CorePackages_0.Workspace.Packages.GameIconRodux).GameIcons.ApiFetchGameIcons;
local v7 = require(l_Modules_0.LuaApp.Actions.Games.AddGames);
local v8 = require(l_Modules_0.LuaApp.Actions.SetSearchInGames);
local v9 = require(l_Modules_0.LuaApp.Actions.AppendSearchInGames);
local v10 = require(l_Modules_0.LuaApp.Actions.SetSearchInGamesStatus);
local v11 = require(l_Modules_0.LuaApp.Enum.SearchRetrievalStatus);
local v12 = require(l_Modules_0.LuaApp.Models.GamesApi.GameSearchEntry);
local v13 = require(l_Modules_0.Personalization.OmniFeed.DataStore.AddSearchResultsOmniFeed);
local v14 = require(l_CorePackages_0.Workspace.Packages.GameIconRodux);
local l_GameIconReducer_0 = v14.GameIcons.GameIconReducer;
local l_BigGameIconReducer_0 = v14.BigGameIcons.BigGameIconReducer;
local v17 = require(l_CorePackages_0.tutils);
local v18 = require(l_Modules_0.LuaApp.Models.SearchInGames);
return function(v19, v20, v21)
    return function(v22)
        local v23 = {};
        local v24 = {};
        local v25 = {};
        local l_Games_0 = v22:getState().Games;
        local v27 = v22:getState()[l_GameIconReducer_0.key];
        local v28 = v22:getState()[l_BigGameIconReducer_0.key];
        local l_responseBody_0 = v21.responseBody;
        if v22:getState().RequestsStatus.SearchesInGamesStatus[v20.searchUuid] == v11.Removed then
            return v3.resolve("Search with Uuid " .. v20.searchUuid .. " has been terminated");
        else
            local v30 = nil;
            local v31 = false;
            for v32, v33 in pairs(l_responseBody_0.searchResults) do
                local v34 = v33.contents[1];
                local l_topicId_0 = v33.topicId;
                local v36 = tostring(v34.rootPlaceId);
                local v37 = tostring(v34.universeId);
                if l_Games_0[v37] then
                    local l_placeId_0 = l_Games_0[v37].placeId;
                    if l_placeId_0 and l_placeId_0 ~= v36 then
                        v36 = l_placeId_0;
                        warn("The placeId does not match the placeId already stored ");
                    end;
                end;
                local v39 = v2.Dictionary.join(v34, {
                    placeId = v36, 
                    creatorId = "none", 
                    topicId = l_topicId_0
                });
                local v40 = v33.contentGroupType == "Game";
                v12.fromJsonData(v39, v40):match(function(v41)
                    v23[v32] = v41;
                    v22:dispatch(v13(v20.searchUuid, l_topicId_0, v33.contentGroupType));
                    if not v40 then
                        return ;
                    else
                        return v4.fromJsonData(v39):match(function(v42)
                            local l_universeId_0 = v42.universeId;
                            if not (not (v32 == 1) or not v39.emphasis) then
                                v30 = l_universeId_0;
                                v31 = true;
                            end;
                            if not v17.shallowEqual(v42, l_Games_0[l_universeId_0]) then
                                v24[l_universeId_0] = v42;
                            end;
                            if l_universeId_0 ~= v30 and v27[l_universeId_0] == nil then
                                table.insert(v25, l_universeId_0);
                            end;
                        end);
                    end;
                end):matchError(function(v44)
                    warn(v44);
                end);
            end;
            if next(v24) then
                v22:dispatch(v7(v24));
            end;
            local v45 = v18.fromOmniSearch(v20.searchKeyword, v23, v31, l_responseBody_0.nextPageToken);
            if not v20.isAppend then
                v22:dispatch(v8(v20.searchUuid, v45));
            else
                v22:dispatch(v9(v20.searchUuid, v45));
            end;
            v22:dispatch(v10(v20.searchUuid, v11.Done));
            if v30 and v28[v30] == nil then
                v22:dispatch(l_ApiFetchBigGameIcons_0(v19, {
                    v30
                }));
            end;
            if #v25 > 0 then
                v22:dispatch(l_ApiFetchGameIcons_0(v19, v25));
            end;
            return v3.resolve();
        end;
    end;
end;
