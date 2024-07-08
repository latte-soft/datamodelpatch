return require(script.Parent.Parent.dependencies).Rodux.makeActionCreator(script.Name, function(v0)
    assert(type(v0) == "table", string.format("SetIsPhoneVerified action expects params to be a table, was %s", (type(v0))));
    return v0;
end);
