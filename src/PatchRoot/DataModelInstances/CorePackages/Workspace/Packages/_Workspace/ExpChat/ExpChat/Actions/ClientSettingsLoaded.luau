return require(script:FindFirstAncestor("ExpChat").Parent.Rodux).makeActionCreator(script.Name, function(v0)
    return {
        value = {
            preferredTransparency = v0.preferredTransparency or 1
        }
    };
end);
