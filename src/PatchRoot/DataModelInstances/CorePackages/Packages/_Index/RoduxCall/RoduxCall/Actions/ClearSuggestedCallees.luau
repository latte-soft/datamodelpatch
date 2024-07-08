return require(script:FindFirstAncestor("RoduxCall").Parent.Rodux).makeActionCreator(script.Name, function()
    return {
        payload = {}
    };
end);
