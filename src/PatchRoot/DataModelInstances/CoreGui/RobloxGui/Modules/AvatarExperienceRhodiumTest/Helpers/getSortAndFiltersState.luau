local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local _ = require(l_Modules_0.AvatarExperience.Catalog.Reducers.SortAndFilters);
local function _()
    return {
        minPrice = v1.MinPriceFilter, 
        maxPrice = v1.MaxPriceFilter
    };
end;
return function(v4)
    local v5 = v4 or {};
    v5.PriceRange = v5.PriceRange or {
        minPrice = v1.MinPriceFilter, 
        maxPrice = v1.MaxPriceFilter
    };
    return {
        AvatarExperience = {
            Catalog = {
                SortAndFilters = v5
            }
        }
    };
end;
