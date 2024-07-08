return require(script:FindFirstAncestor("Profile").dependencies).Rodux.makeActionCreator(script.Name, function(v0)
    return {
        state = v0
    };
end);
