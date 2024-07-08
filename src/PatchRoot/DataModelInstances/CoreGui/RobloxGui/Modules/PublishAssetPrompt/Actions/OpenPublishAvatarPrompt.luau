return require(game:GetService("CorePackages").Rodux).makeActionCreator(script.Name, function(v0, v1, v2, v3)
    return {
        promptInfo = {
            promptType = v0, 
            humanoidModel = v1, 
            guid = v2, 
            scopes = v3
        }
    };
end);
