return require(script:FindFirstAncestor("RoduxUsers").Parent.Rodux).makeActionCreator(script.Name, function(v0)
    return {
        payload = {
            id = v0
        }
    };
end);
