return require(script:FindFirstAncestor("RoduxAliases").Parent.Rodux).makeActionCreator(require(script.Parent.ActionDomain) .. script.Name, function(v0)
    return {
        payload = {
            showUserAlias = v0
        }
    };
end);
