return require(script:FindFirstAncestor("UserLib").Parent.Rodux).makeActionCreator(script.Name, function(v0, v1)
    return {
        userId = tostring(v0), 
        displayName = v1
    };
end);
