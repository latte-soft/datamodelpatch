return require(script:FindFirstAncestor("ExpChat").Parent.Rodux).makeActionCreator(script.Name, function(v0, v1)
    return {
        userId = tostring(v0), 
        newState = v1
    };
end);
