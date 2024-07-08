return require(script:FindFirstAncestor("Profile").dependencies).Rodux.makeActionCreator(script.Name, function(v0, v1)
    assert(type(v0) == "string", "SetProfilePageDataStatus action expects userId to be a string");
    assert(type(v1) == "string", "SetProfilePageDataStatus action expects status to be a string: " .. tostring(v1) .. ", type: " .. type(v1));
    return {
        userId = v0, 
        status = v1
    };
end);
