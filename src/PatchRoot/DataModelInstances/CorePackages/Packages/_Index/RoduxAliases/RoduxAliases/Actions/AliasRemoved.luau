return require(script:FindFirstAncestor("RoduxAliases").Parent.Rodux).makeActionCreator(script.Name, function(v0)
    return {
        payload = {
            userId = v0
        }
    };
end);
