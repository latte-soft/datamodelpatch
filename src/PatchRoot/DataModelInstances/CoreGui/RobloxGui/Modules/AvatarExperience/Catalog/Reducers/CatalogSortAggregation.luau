local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Rodux);
local v4 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetCatalogSort);
local v5 = require(l_Modules_0.AvatarExperience.Catalog.Actions.ResetSortAndFilters);
local v6 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetSortAndFilters);
local _ = require(l_Modules_0.AvatarExperience.Common.Enum.SortAggregation);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v9 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
return v3.createReducer(v9.DefaultFilters.CatalogSortAggregation, {
    [v4.name] = function(_, v11)
        return v11.sortAggregation;
    end, 
    [v5.name] = function(_, _)
        return v9.DefaultFilters.CatalogSortAggregation;
    end, 
    [v6.name] = function(v14, v15)
        return v15.CatalogSortAggregation or v14;
    end
});
