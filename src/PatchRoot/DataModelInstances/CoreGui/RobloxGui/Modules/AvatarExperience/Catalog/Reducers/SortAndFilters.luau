local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
return require(game:GetService("CorePackages").Rodux).combineReducers({
    CatalogSort = require(l_Modules_0.AvatarExperience.Catalog.Reducers.CatalogSort), 
    CatalogSortAggregation = require(l_Modules_0.AvatarExperience.Catalog.Reducers.CatalogSortAggregation), 
    PriceRange = require(l_Modules_0.AvatarExperience.Catalog.Reducers.PriceRange), 
    SalesTypeFilter = require(l_Modules_0.AvatarExperience.Catalog.Reducers.SalesTypeFilter), 
    CreatorFilter = require(l_Modules_0.AvatarExperience.Catalog.Reducers.CreatorFilter), 
    UnavailableItemFilter = require(l_Modules_0.AvatarExperience.Catalog.Reducers.UnavailableItemFilter), 
    SelectedTopics = require(l_Modules_0.AvatarExperience.Catalog.Reducers.SelectedTopics)
});
