return require(game:GetService("CorePackages").Rodux).makeActionCreator(script.Name, function(v0, v1)
    return {
        userId = tostring(v0), 
        inviteStatus = v1
    };
end);
