local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local _ = require(l_Modules_0.AvatarExperience.Common.Enum.SalesTypeFilter);
local _ = require(l_Modules_0.AvatarExperience.Common.Enum.UnavailableItemFilter);
local v5 = require(l_Modules_0.AvatarExperience.Common.Enum.SortType);
local _ = require(l_Modules_0.AvatarExperience.Common.Enum.SortAggregation);
local _ = require(l_Modules_0.AvatarExperience.Catalog.Reducers.SortAndFilters);
local l_memoize_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).memoize;
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v19 = {
    mapHeightToSize = function(v10)
        return UDim2.new(1, 0, 0, v10);
    end, 
    selectCatalogSort = function(v11)
        return v11.AvatarExperience.Catalog.SortAndFilters.CatalogSort;
    end, 
    selectCatalogSortAggregation = function(v12)
        return v12.AvatarExperience.Catalog.SortAndFilters.CatalogSortAggregation;
    end, 
    selectSalesTypeFilter = function(v13)
        return v13.AvatarExperience.Catalog.SortAndFilters.SalesTypeFilter;
    end, 
    selectCreatorFilter = function(v14)
        return v14.AvatarExperience.Catalog.SortAndFilters.CreatorFilter;
    end, 
    selectUnavailableItemFilter = function(v15)
        return v15.AvatarExperience.Catalog.SortAndFilters.UnavailableItemFilter;
    end, 
    selectMinPrice = function(v16)
        return v16.AvatarExperience.Catalog.SortAndFilters.PriceRange.minPrice;
    end, 
    selectMaxPrice = function(v17)
        return v17.AvatarExperience.Catalog.SortAndFilters.PriceRange.maxPrice;
    end, 
    selectSortAndFilters = function(v18)
        return v18.AvatarExperience.Catalog.SortAndFilters;
    end
};
local v28 = l_memoize_0(function(v20, v21, v22, v23, v24, v25, v26)
    local v27 = true;
    if v20 ~= v5.MostFavorited then
        v27 = v20 == v5.Bestselling;
    end;
    return v20 .. "," .. (not v27 and "" or v21) .. "," .. v22.minPrice .. "," .. v22.maxPrice .. "," .. v23 .. "," .. v24 .. "," .. v25 .. "," .. table.concat(v26, "-");
end);
v19.selectSortAndFiltersKey = function(v29)
    local l_SortAndFilters_0 = v29.AvatarExperience.Catalog.SortAndFilters;
    return v28(l_SortAndFilters_0.CatalogSort, l_SortAndFilters_0.CatalogSortAggregation, l_SortAndFilters_0.PriceRange, l_SortAndFilters_0.SalesTypeFilter, l_SortAndFilters_0.CreatorFilter, l_SortAndFilters_0.UnavailableItemFilter, l_SortAndFilters_0.SelectedTopics);
end;
return v19;
