return require(script:FindFirstAncestor("AppChat").Parent.Rodux).makeActionCreator(script.Name, function(v0, v1)
    return {
        id = v0, 
        isLeaving = v1
    };
end);
