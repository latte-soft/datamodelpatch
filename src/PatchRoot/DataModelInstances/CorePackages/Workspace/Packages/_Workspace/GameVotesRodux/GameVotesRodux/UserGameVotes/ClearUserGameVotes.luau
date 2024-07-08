return require(script:FindFirstAncestor("GameVotesRodux").Parent.Rodux).makeActionCreator(script.Name, function(v0)
    assert(type(v0) == "string", "ClearUserGameVotes: universeId must be a string");
    return {
        universeId = v0
    };
end);
