return require(game:GetService("CorePackages").Rodux).makeActionCreator("Catalog-" .. script.Name, function(v0)
    return {
        selectedTopics = v0
    };
end);
