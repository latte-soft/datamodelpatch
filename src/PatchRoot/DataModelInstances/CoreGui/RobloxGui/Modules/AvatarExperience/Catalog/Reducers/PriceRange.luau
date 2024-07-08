local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Rodux);
local v4 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetPriceRange);
local v5 = require(l_Modules_0.AvatarExperience.Catalog.Actions.ResetSortAndFilters);
local v6 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetSortAndFilters);
local v7 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
return v3.createReducer(v7.DefaultFilters.PriceRange, {
    [v4.name] = function(_, v10)
        return v10.priceRange;
    end, 
    [v5.name] = function(_, _)
        return v7.DefaultFilters.PriceRange;
    end, 
    [v6.name] = function(v13, v14)
        return v14.PriceRange or v13;
    end
});
