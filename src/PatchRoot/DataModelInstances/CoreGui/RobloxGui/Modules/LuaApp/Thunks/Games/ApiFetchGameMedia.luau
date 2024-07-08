local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_PerformFetch_0 = require(game:GetService("CorePackages").Workspace.Packages.Http).PerformFetch;
local v2 = require(l_Modules_0.LuaApp.Http.Requests.GamesApi.GamesGetMedia);
local v3 = require(l_Modules_0.LuaApp.Models.GamesApi.GameMediaEntry);
local v4 = require(l_Modules_0.LuaApp.Actions.Games.UpdateGameMedia);
return {
    KeyMapper = function(v5)
        return "luaapp.gamesapi.gamemedia." .. v5;
    end, 
    Fetch = function(v6, v7)
        assert(typeof(v7) == "string");
        assert(#v7 > 0);
        return l_PerformFetch_0.Single("luaapp.gamesapi.gamemedia." .. v7, function(v8)
            return v2(v6, v7):andThen(function(v9)
                assert(typeof(v9.responseBody.data) == "table", "Malformed response from server, missing 'data' object");
                local v10 = {};
                for _, v12 in ipairs(v9.responseBody.data) do
                    table.insert(v10, (v3.fromJsonData(v12)));
                end;
                if #v10 > 0 then
                    v8:dispatch(v4(v7, v10));
                end;
                return v10;
            end);
        end);
    end, 
    GetFetchingStatus = function(v13, v14)
        return l_PerformFetch_0.GetStatus(v13, "luaapp.gamesapi.gamemedia." .. v14);
    end
};
