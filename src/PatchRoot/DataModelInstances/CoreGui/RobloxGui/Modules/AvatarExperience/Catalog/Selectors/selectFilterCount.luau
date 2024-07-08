local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local l_DefaultFilters_0 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants).DefaultFilters;
return function(v3)
    local l_SortAndFilters_0 = v3.AvatarExperience.Catalog.SortAndFilters;
    local v5 = 0;
    if not (l_SortAndFilters_0.PriceRange.minPrice == l_DefaultFilters_0.PriceRange.minPrice) or l_SortAndFilters_0.PriceRange.maxPrice ~= l_DefaultFilters_0.PriceRange.maxPrice then
        v5 = v5 + 1;
    end;
    if l_SortAndFilters_0.SalesTypeFilter ~= l_DefaultFilters_0.SalesTypeFilter then
        v5 = v5 + 1;
    end;
    if l_SortAndFilters_0.CreatorFilter ~= l_DefaultFilters_0.CreatorFilter then
        v5 = v5 + 1;
    end;
    if l_SortAndFilters_0.UnavailableItemFilter ~= l_DefaultFilters_0.UnavailableItemFilter then
        v5 = v5 + 1;
    end;
    if l_SortAndFilters_0.CatalogSort ~= l_DefaultFilters_0.CatalogSort then
        v5 = v5 + 1;
    end;
    return v5;
end;
