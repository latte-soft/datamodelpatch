return require(game:GetService("CorePackages").Rodux).makeActionCreator("Catalog-" .. script.Name, function(v0, v1, v2, v3)
    return {
        selectedTopics = v0, 
        initialItems = v1, 
        searchKeyword = v2, 
        newTopics = v3
    };
end);
