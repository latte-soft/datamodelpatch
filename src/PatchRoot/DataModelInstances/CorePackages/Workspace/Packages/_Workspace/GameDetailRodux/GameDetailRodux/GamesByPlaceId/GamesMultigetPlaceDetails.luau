local l_Url_0 = require(script:FindFirstAncestor("GameDetailRodux").Parent.Http).Url;
return function(v1, v2)
    return v1(string.format("%s/v1/games/multiget-place-details?%s", l_Url_0.GAME_URL, (l_Url_0:makeQueryString({
        placeIds = v2
    }))), "GET");
end;
