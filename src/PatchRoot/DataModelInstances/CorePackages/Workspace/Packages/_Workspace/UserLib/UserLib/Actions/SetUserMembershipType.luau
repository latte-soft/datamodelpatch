return require(script:FindFirstAncestor("UserLib").Parent.Rodux).makeActionCreator(script.Name, function(v0, v1)
    return {
        userId = v0, 
        membershipType = v1
    };
end);
