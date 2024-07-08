local l_Url_0 = require(script:FindFirstAncestor("GameProductInfoRodux").Parent.Http).Url;
return function(v1, v2)
    assert(type(v2) == "table", "GamesGetProductInfo request expects universeIds to be a table");
    assert(#v2 > 0, "GamesGetProductInfo request expects universeIds count to be greater than 0");
    assert(#v2 <= 100, "GamesGetProductInfo request expects universeIds count to not exceed " .. 100);
    return v1(string.format("%sv1/games/games-product-info?universeIds=%s", l_Url_0.GAME_URL, (table.concat(v2, ","))), "GET");
end;
