return require(script:FindFirstAncestor("Profile").dependencies).Rodux.makeActionCreator("Profile." .. script.Name, function(v0, v1)
    assert(type(v0) == "string", "SetNextDataExpirationTime action expects key to be a string");
    local v2 = false;
    if type(v1) == "number" then
        v2 = v1 > 0;
    end;
    assert(v2, "SetNextDataExpirationTime: nextDataExpirationTime must be a positive number");
    return {
        key = v0, 
        nextDataExpirationTime = v1
    };
end);
