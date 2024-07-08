return require(game:GetService("CorePackages").Rodux).makeActionCreator(script.Name, function(v0, v1)
    return {
        health = v0, 
        maxHealth = v1
    };
end);
