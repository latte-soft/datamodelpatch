return require(script:FindFirstAncestor("RoduxFriends").Parent.Rodux).makeActionCreator(script.Name, function(v0)
    assert(type(v0) == "number", "Request count must be a number");
    return {
        payload = {
            count = v0
        }
    };
end);
