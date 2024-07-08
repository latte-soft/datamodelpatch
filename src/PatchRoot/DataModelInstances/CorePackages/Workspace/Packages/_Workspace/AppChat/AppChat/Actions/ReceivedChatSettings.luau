return require(script:FindFirstAncestor("AppChat").Parent.Rodux).makeActionCreator(script.Name, function(v0)
    assert(type(v0) == "table", script.Name .. ": result must be a table");
    return {
        result = v0
    };
end);
