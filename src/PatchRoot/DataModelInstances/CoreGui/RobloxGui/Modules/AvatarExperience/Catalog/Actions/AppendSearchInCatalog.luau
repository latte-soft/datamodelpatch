return require(game:GetService("CorePackages").Rodux).makeActionCreator(script.Name, function(v0, v1)
    return {
        searchUuid = v0, 
        searchInCatalog = v1
    };
end);
