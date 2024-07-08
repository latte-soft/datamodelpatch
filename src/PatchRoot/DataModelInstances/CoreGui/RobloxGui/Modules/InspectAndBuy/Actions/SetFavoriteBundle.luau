return require(game:GetService("CorePackages").Rodux).makeActionCreator(script.Name, function(v0, v1)
    return {
        id = v0, 
        isFavorite = v1
    };
end);
