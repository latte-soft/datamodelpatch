return require(script:FindFirstAncestor("GameVotesRodux").Parent.Rodux).makeActionCreator(script.Name, function(v0, v1, v2, v3)
    assert(type(v0) == "string", "SetUserGameVotes: universeId must be a string");
    assert(type(v1) == "boolean", "SetUserGameVotes: canVote must be a boolean");
    assert(type(v2) == "string", "SetUserGameVotes: userVote must be a string");
    assert(type(v3) == "string", "SetUserGameVotes: reasonForNotVoteable must be a string");
    return {
        universeId = v0, 
        canVote = v1, 
        userVote = v2, 
        reasonForNotVoteable = v3
    };
end);
