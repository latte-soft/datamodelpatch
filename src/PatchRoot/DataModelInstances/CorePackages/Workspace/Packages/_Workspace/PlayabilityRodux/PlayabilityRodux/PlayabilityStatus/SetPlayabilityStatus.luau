return require(script:FindFirstAncestor("PlayabilityRodux").Parent.Rodux).makeActionCreator(script.Name, function(v0)
    assert(type(v0) == "table", "SetPlayabilityStatus action expects playabilityStatus to be a table");
    return {
        playabilityStatus = v0
    };
end);
