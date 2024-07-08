local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Rodux);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v5 = require(l_Modules_0.AvatarExperience.Catalog.Actions.ClearSelectedTopics);
local v6 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetSelectedTopics);
local v7 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetSortAndFilters);
local v8 = require(l_Modules_0.AvatarExperience.Catalog.Actions.ResetSortAndFilters);
local v9 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
return v3.createReducer(v9.DefaultFilters.SelectedTopics, {
    [v6.name] = function(_, v11)
        return v11.selectedTopics;
    end, 
    [v5.name] = function(_, _)
        return v9.DefaultFilters.SelectedTopics;
    end, 
    [v7.name] = function(v14, v15)
        return v15.SelectedTopics or v14;
    end, 
    [v8.name] = function(_, _)
        return v9.DefaultFilters.SelectedTopics;
    end
});
