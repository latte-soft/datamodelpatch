return require(script:FindFirstAncestor("RoduxUsers").Parent.Rodux).makeActionCreator(script.Name, function(v0)
    return {
        payload = v0
    };
end);
