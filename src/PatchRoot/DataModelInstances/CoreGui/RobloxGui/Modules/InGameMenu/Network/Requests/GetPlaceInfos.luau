local v0 = require(script.Parent.Parent.Parent.Network.Url);
return function(v1, v2)
    for v3, v4 in ipairs(v2) do
        v2[v3] = tostring(v4);
    end;
    return v1(string.format("%s/v1/games/multiget-place-details?%s", v0.GAME_URL, (v0:makeQueryString({
        placeIds = v2
    }))), "GET");
end;
