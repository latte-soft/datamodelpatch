return require(script.Parent.Parent.Parent.Rodux).makeActionCreator(require(script.Parent.ActionDomain) .. script.Name, function(v0)
    return {
        payload = v0
    };
end);
