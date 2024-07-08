return require(script:FindFirstAncestor("SocialModalsCommon").Parent.Rodux).makeActionCreator(script.Name, function(v0)
    assert(type(v0) == "table", string.format("UpdateIsDiscoverabilityUnset action expects params to be a table, was %s", (type(v0))));
    return v0;
end);
