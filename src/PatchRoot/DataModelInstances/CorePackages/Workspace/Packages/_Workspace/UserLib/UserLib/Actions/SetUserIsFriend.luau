return require(script:FindFirstAncestor("UserLib").Parent.Rodux).makeActionCreator(script.Name, function(v0, v1)
    return {
        userId = v0, 
        isFriend = v1
    };
end);
