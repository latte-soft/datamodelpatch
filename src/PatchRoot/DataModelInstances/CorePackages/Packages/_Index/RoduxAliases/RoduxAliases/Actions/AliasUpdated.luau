return require(script:FindFirstAncestor("RoduxAliases").Parent.Rodux).makeActionCreator(script.Name, function(v0, v1)
    return {
        payload = {
            userId = v0, 
            newAlias = v1
        }
    };
end);
