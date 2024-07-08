return require(game:GetService("CorePackages").Rodux).makeActionCreator(script.Name, function(v0, v1)
    return {
        respawnEnabled = v0, 
        customCallback = v1
    };
end);
