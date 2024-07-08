local l_HttpService_0 = game:GetService("HttpService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameVotesRodux");
local l_Url_0 = require(l_script_FirstAncestor_0.Parent.Http).Url;
local v3 = require(l_script_FirstAncestor_0.Enums.VoteStatus);
local v4 = {
    [v3.VotedUp] = true, 
    [v3.VotedDown] = false, 
    [v3.NotVoted] = "null"
};
return function(v5, v6, v7)
    assert(type(v6) == "string", "GamesPatchUserVotes request expects universeId to be a string");
    local v8 = v4[v7];
    assert(v8 ~= nil, "GamesPatchUserVotes request expects a valid vote");
    return v5(string.format("%sv1/games/%s/user-votes", l_Url_0.GAME_URL, v6), "PATCH", {
        postBody = l_HttpService_0:JSONEncode({
            vote = v8
        })
    });
end;
