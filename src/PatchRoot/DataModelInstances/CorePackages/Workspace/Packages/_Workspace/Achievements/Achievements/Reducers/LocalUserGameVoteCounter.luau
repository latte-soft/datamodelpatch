local l_Parent_0 = script:FindFirstAncestor("Achievements").Parent;
local v1 = require(l_Parent_0.Cryo);
local v10 = require(l_Parent_0.Rodux).createReducer({
    gameVoteStatus = {}, 
    voteCountSinceAppStart = 0, 
    lastUniverseId = -1
}, {
    SetUserGameVotes = function(v2, v3)
        local l_universeId_0 = v3.universeId;
        local l_userVote_0 = v3.userVote;
        local l_canVote_0 = v3.canVote;
        local l_gameVoteStatus_0 = v2.gameVoteStatus;
        local l_voteCountSinceAppStart_0 = v2.voteCountSinceAppStart;
        local l_lastUniverseId_0 = v2.lastUniverseId;
        if (not (not l_canVote_0 or not l_gameVoteStatus_0[l_universeId_0]) and l_gameVoteStatus_0[l_universeId_0] ~= l_userVote_0) and l_userVote_0 ~= "NotVoted" then
            l_voteCountSinceAppStart_0 = l_voteCountSinceAppStart_0 + 1;
            l_lastUniverseId_0 = l_universeId_0;
        end;
        return v1.Dictionary.join(v2, {
            gameVoteStatus = v1.Dictionary.join(l_gameVoteStatus_0, {
                [l_universeId_0] = l_userVote_0
            }), 
            voteCountSinceAppStart = l_voteCountSinceAppStart_0, 
            lastUniverseId = l_lastUniverseId_0
        });
    end
});
return function(v11, v12)
    return v10(v11, v12);
end;
