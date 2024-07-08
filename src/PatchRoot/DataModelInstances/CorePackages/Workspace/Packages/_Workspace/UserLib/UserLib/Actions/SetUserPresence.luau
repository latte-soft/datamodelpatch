return require(script:FindFirstAncestor("UserLib").Parent.Rodux).makeActionCreator(script.Name, function(v0, v1, v2)
    return {
        userId = tostring(v0), 
        presence = v1, 
        lastLocation = v2
    };
end);
