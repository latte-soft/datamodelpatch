local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.AvatarExperience.Catalog.Components.Filters.FilterUtils);
local v2 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v3 = require(l_Modules_0.AvatarExperience.Common.Enum.SortType);
local v4 = require(l_Modules_0.AvatarExperience.Common.Enum.SalesTypeFilter);
local v5 = require(l_Modules_0.AvatarExperience.Common.Enum.UnavailableItemFilter);
return function(v6)
    return function(v7)
        local v8 = v7:getState();
        local v9 = v1.selectMinPrice(v8);
        if v9 == v2.MinPriceFilter then
            v9 = nil;
        end;
        local v10 = v1.selectMaxPrice(v8);
        if v10 == v2.MaxPriceFilter then
            v10 = nil;
        end;
        local v11 = v1.selectCatalogSort(v8);
        local v12 = if not (v11 ~= v3.MostFavorited) or v11 == v3.Bestselling then v1.selectCatalogSortAggregation(v8) else nil;
        local v13 = v1.selectSalesTypeFilter(v8);
        if v13 == v4.All then
            v13 = nil;
        end;
        local v14 = v1.selectCreatorFilter(v8);
        if v14 == "" then
            v14 = nil;
        end;
        v6.applySortAndFilters({
            minPrice = v9, 
            maxPrice = v10, 
            sortType = v11, 
            sortAggregation = v12, 
            salesTypeFilter = v13, 
            creatorFilter = v14, 
            includeOffSale = v1.selectUnavailableItemFilter(v8) == v5.Show and true or nil
        });
    end;
end;
