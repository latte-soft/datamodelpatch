return require(script:FindFirstAncestor("AuthenticationStatus").Parent.Rodux).makeActionCreator(script.Name, function(v0)
    return {
        status = v0
    };
end);
