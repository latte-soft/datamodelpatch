return require(script:FindFirstAncestor("RoduxFriends").Parent.Rodux).makeActionCreator(script.Name, function(v0, v1)
    return {
        payload = {
            userId1 = v0, 
            userId2 = v1
        }
    };
end);
