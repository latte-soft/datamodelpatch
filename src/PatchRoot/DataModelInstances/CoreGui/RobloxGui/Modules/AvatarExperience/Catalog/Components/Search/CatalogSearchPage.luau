local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local v4 = require(l_Modules_0.AvatarExperience.Catalog.Components.Search.CatalogSearch);
return (require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withMappedNavigationParams)((require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withStackVisibilityWrapper)((v3.connect(function(v5, v6)
    return {
        searchParameters = v5.SearchesParameters[v6.detail]
    };
end)(function(v7)
    return v2.createElement(v4, {
        searchUuid = v7.detail, 
        searchParameters = v7.searchParameters
    });
end))))));
