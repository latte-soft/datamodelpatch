local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Rodux);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v5 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetCreatorFilter);
local v6 = require(l_Modules_0.AvatarExperience.Catalog.Actions.ResetSortAndFilters);
local v7 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetSortAndFilters);
local v8 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
return (v3.createReducer(v8.DefaultFilters.CreatorFilter, {
    [v5.name] = function(_, v10)
        return v10.creatorFilter;
    end, 
    [v6.name] = function(_, _)
        return v8.DefaultFilters.CreatorFilter;
    end, 
    [v7.name] = function(v13, v14)
        return v14.CreatorFilter or v13;
    end
}));
