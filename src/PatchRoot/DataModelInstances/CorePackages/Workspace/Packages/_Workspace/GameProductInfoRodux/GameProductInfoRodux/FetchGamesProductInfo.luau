local v0 = require(game:GetService("CorePackages").Logging);
local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameProductInfoRodux");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.Promise);
local v4 = require(l_Parent_0.Result);
local l_PerformFetch_0 = require(l_Parent_0.Http).PerformFetch;
local v6 = require(l_script_FirstAncestor_0.SetGamesProductInfo);
local v7 = require(l_script_FirstAncestor_0.GamesGetProductInfo);
local v8 = require(l_script_FirstAncestor_0.GameProductInfo);
local v9 = {};
local function v11(v10)
    return "luaapp.gamesapi.games-product-info." .. v10;
end;
v9.KeyMapper = v11;
v9.Fetch = function(v12, v13)
    assert(type(v13) == "table", "FetchGamesProductInfo thunk expects universeIds to be a table");
    assert(#v13 > 0, "FetchGamesProductInfo thunk expects universeIds count to be greater than 0");
    assert(#v13 <= 100, "FetchGamesProductInfo thunk expects universeIds count to not exceed " .. 100);
    return l_PerformFetch_0.Batch(v13, v11, function(v14, v15)
        return v7(v12, v15):andThen(function(v16)
            local v17 = {};
            for _, v19 in ipairs(v15) do
                v17["luaapp.gamesapi.games-product-info." .. v19] = v4.new(false, nil);
            end;
            local v20 = (v16 and v16.responseBody) and v16.responseBody.data;
            if v20 ~= nil then
                local v21 = {};
                for _, v23 in ipairs(v20) do
                    v8.fromJsonData(v23):match(function(v24)
                        v21[v24.universeId] = v24;
                        v17["luaapp.gamesapi.games-product-info." .. v24.universeId] = v4.new(true, nil);
                    end):matchError(function(v25)
                        v0.warn(v25);
                    end);
                end;
                if next(v21) then
                    v14:dispatch(v6(v21));
                end;
            else
                v0.warn("Response from GamesGetProductInfo is malformed");
            end;
            return v3.resolve(v17);
        end, function(_)
            local v27 = {};
            for _, v29 in ipairs(v15) do
                v27["luaapp.gamesapi.games-product-info." .. v29] = v4.new(false, nil);
            end;
            return v3.resolve(v27);
        end);
    end);
end;
v9.GetFetchingStatus = function(v30, v31)
    return l_PerformFetch_0.GetStatus(v30, "luaapp.gamesapi.games-product-info." .. v31);
end;
return v9;
