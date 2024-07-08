local l_Url_0 = require(script:FindFirstAncestor("PlayabilityRodux").Parent.Http).Url;
return function(v1, v2)
    assert(type(v2) == "table", "GamesMultigetPlayabilityStatus request expects universeId to be a table");
    return v1(string.format("%s/v1/games/multiget-playability-status?universeIds=%s", l_Url_0.GAME_URL, (table.concat(v2, ","))), "GET");
end;
