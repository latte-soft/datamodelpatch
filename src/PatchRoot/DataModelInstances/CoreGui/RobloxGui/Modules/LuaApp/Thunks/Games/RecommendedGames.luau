local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.LuaApp.Promise);
local v3 = require(l_CorePackages_0.tutils);
local v4 = require(l_Modules_0.LuaApp.Models.GamesApi.Game);
local v5 = require(l_Modules_0.LuaApp.Models.GamesApi.GameSortEntry_Deprecated);
local v6 = require(l_Modules_0.LuaApp.Actions.Games.AddGames);
local v7 = require(l_Modules_0.LuaApp.Actions.Games.SetRecommendedGameEntries);
local l_ApiFetchGameIcons_0 = require(l_CorePackages_0.Workspace.Packages.GameIconRodux).GameIcons.ApiFetchGameIcons;
local v9 = require(l_Modules_0.LuaApp.Thunks.SetNetworkingErrorToast);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v11 = require(l_Modules_0.LuaApp.Http.Requests.GamesApi.GameGetRecommendedGames);
local v12 = {};
local function v14(v13)
    return "RecommendedGames" .. v13;
end;
v12.Fetch = function(v15, v16, _, v18)
    assert(type(v16) == "string", "RecommendedGames thunk expects universeId to be a string");
    assert(type(v18) == "table", "RecommendedGames thunk expects argTable to be a table");
    return l_PerformFetch_0.Single("RecommendedGames" .. v16, function(v19)
        return v11(v15, v16, v18):andThen(function(v20)
            local v21 = {};
            local v22 = {};
            local v23 = {};
            local l_Games_0 = v19:getState().Games;
            local l_responseBody_0 = v20.responseBody;
            if #l_responseBody_0.games == 0 then
                warn("Found no recommended games related to universe", v16);
            end;
            for v26, v27 in ipairs(l_responseBody_0.games) do
                v5.fromJsonData(v27):match(function(v28)
                    return v4.fromJsonData(v27):match(function(v29)
                        v21[v26] = v28;
                        local l_universeId_0 = v29.universeId;
                        if not v3.shallowEqual(v29, l_Games_0[l_universeId_0]) then
                            v22[l_universeId_0] = v29;
                            table.insert(v23, l_universeId_0);
                        end;
                    end);
                end):matchError(function(v31)
                    warn(v31);
                end);
            end;
            if next(v22) then
                v19:dispatch(v6(v22));
            end;
            v19:dispatch(v7(v16, v21));
            if #v23 > 0 then
                v19:dispatch(l_ApiFetchGameIcons_0(v15, v23));
            end;
            return v2.resolve(v20);
        end, function(v32)
            v19:dispatch(v9(v32));
            return v2.reject(v32);
        end);
    end);
end;
v12.GetFetchingStatus = function(v33, v34)
    return l_PerformFetch_0.GetStatus(v33, "RecommendedGames" .. v34);
end;
v12.KeyMapper = v14;
return v12;
