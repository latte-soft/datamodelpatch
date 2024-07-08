local l_Url_0 = require(script:FindFirstAncestor("GameDetailRodux").Parent.Http).Url;
return function(v1, v2)
    assert(type(v2) == "table", "GamesMultigetDetails request expects universeIds to be a table");
    if not (#v2 ~= 0) or #v2 > 100 then
        error("GamesMultigetDetails request expects universeIds count between 1-100");
    end;
    return v1(string.format("%sv1/games?universeIds=%s", l_Url_0.GAME_URL, (table.concat(v2, ","))), "GET");
end;
