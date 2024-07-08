return require(script:FindFirstAncestor("RoduxSquads").Parent.Rodux).makeActionCreator(script.Name, function(v0)
    return {
        payload = {
            squad = v0
        }
    };
end);
