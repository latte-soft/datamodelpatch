local v0 = require(script.Parent.Parent.Parent.Parent.Network.Url);
return function(v1, v2)
    return v1(string.format("%sv1/games/%d/icon", v0.GAME_URL, v2), "GET");
end;
