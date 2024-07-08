return require(script:FindFirstAncestor("GameVotesRodux").Parent.Rodux).makeActionCreator(script.Name, function(v0, v1, v2)
    assert(type(v0) == "string", "SetGameVotes: universeId must be a string");
    assert(type(v1) == "number", "SetGameVotes: upVotes must be a number");
    assert(type(v2) == "number", "SetGameVotes: downVotes must be a number");
    return {
        universeId = v0, 
        upVotes = v1, 
        downVotes = v2
    };
end);
