return require(script:FindFirstAncestor("RoduxSquads").Parent.Rodux).makeActionCreator(script.Name, function(v0)
    return {
        payload = {
            experienceInvite = v0
        }
    };
end);
