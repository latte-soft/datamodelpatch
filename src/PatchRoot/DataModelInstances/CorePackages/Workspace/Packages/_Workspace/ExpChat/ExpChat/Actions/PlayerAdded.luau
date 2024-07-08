return require(script:FindFirstAncestor("ExpChat").Parent.Rodux).makeActionCreator(script.Name, function(v0, v1, v2, v3)
    return {
        userId = tostring(v0), 
        username = v1, 
        displayName = v2, 
        hasVerifiedBadge = v3
    };
end);
