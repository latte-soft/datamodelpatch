return require(script:FindFirstAncestor("RoduxCall").Parent.Rodux).makeActionCreator(script.Name, function(v0)
    return {
        payload = {
            call = v0
        }
    };
end);
