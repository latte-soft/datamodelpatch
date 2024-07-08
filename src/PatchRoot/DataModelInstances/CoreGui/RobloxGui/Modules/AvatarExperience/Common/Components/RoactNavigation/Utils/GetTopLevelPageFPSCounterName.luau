local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local v2 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v3 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
return function(v5, v6)
    local l_TopLevelFPS_0 = v2.Counter.TopLevelFPS;
    local v8 = v3.isWithinViewContext(v6, v1.CatalogSearch);
    return ({
        [v1.Catalog] = l_TopLevelFPS_0.Catalog, 
        [v1.CatalogSearch] = l_TopLevelFPS_0.Search, 
        [v1.AvatarEditor] = l_TopLevelFPS_0.Editor, 
        [v1.ItemDetails] = not not v8 and l_TopLevelFPS_0.SearchItemDetails or l_TopLevelFPS_0.CatalogItemDetails, 
        [v1.SortAndFilters] = not not v8 and l_TopLevelFPS_0.SearchFilters or l_TopLevelFPS_0.CatalogFilters
    })[v5] or v2.Counter.TopLevelFPS.Unknown;
end;
