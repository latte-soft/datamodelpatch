return require(script:FindFirstAncestor("Http").Parent.Rodux).makeActionCreator(script.Name, function(v0, v1)
    return {
        fetchingStatuses = v0, 
        shouldImmediatelyDispatch = v1 or false
    };
end);
