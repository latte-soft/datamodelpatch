return require(script:FindFirstAncestor("Http").Parent.Rodux).makeActionCreator(script.Name, function(v0, v1)
    return {
        key = v0, 
        status = v1
    };
end);
