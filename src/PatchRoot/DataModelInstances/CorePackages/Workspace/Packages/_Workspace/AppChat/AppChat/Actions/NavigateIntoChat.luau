return require(script:FindFirstAncestor("AppChat").Parent.Rodux).makeActionCreator(script.Name, function(v0)
    return {
        screen = v0.screen, 
        params = v0.params
    };
end);
