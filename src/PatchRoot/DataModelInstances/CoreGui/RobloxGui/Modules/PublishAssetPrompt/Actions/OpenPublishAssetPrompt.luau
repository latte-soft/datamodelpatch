return require(game:GetService("CorePackages").Rodux).makeActionCreator(script.Name, function(v0, v1, v2, v3, v4)
    return {
        promptInfo = {
            promptType = v0, 
            assetInstance = v1, 
            assetType = v2, 
            guid = v3, 
            scopes = v4
        }
    };
end);
