local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Promise);
local v2 = require(l_Modules_0.LuaApp.Enum.RetrievalStatus);
local v3 = require(l_Modules_0.LuaApp.Constants);
local v4 = require(l_Modules_0.LuaApp.Thunks.Games.ApiFetchSortTokens);
local v5 = require(l_Modules_0.LuaApp.Actions.SetGamesPageDataStatus);
local v6 = require(l_Modules_0.LuaApp.Thunks.Games.ApiFetchGamesData);
local v7 = require(l_Modules_0.Personalization.Flags.GetFFlagExploreApiSortsEnabledByDefault);
local l_FVariable_0 = settings():GetFVariable("LuaAppsDiagPageLoadTimeGames");
return function(v9, v10, v11, v12, v13)
    return function(v14)
        if v14:getState().Startup.GamesPageDataStatus == v2.Fetching then
            return v1.resolve("games page data is already fetching");
        else
            local v15 = tick();
            v14:dispatch(v5(v2.Fetching));
            return v14:dispatch(v4(v9, v3.GameSortGroups.Games, v12, v13)):andThen(function()
                v14:dispatch(v5(v2.Done));
                if not v7() and not v13 then
                    return v14:dispatch(v6(v9, v3.GameSortGroups.Games, nil, nil, v11)):andThen(function(_)
                        v10.Diag:reportStats(l_FVariable_0, (tick() - v15) * 1000);
                    end);
                else
                    if not v12 or v12 == "" then
                        v10.Diag:reportStats(l_FVariable_0, (tick() - v15) * 1000);
                    end;
                    return v1.resolve();
                end;
            end, function(v17)
                v14:dispatch(v5(v2.Failed));
                return v1.reject(v17);
            end);
        end;
    end;
end;
