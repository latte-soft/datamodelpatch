local l_Url_0 = require(script:FindFirstAncestor("GameVotesRodux").Parent.Http).Url;
return function(v1, v2)
    assert(type(v2) == "string", "GetGameVotes request expects universeId to be a string");
    return v1(string.format("%sv1/games/%s/votes", l_Url_0.GAME_URL, v2), "GET");
end;
