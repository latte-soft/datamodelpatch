local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v2 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.ApiFetchCatalogSearch);
local v3 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.FetchSponsoredItems);
return function(v4, v5, v6)
    return function(v7)
        local v8 = not not v6 and v6.categoryInfo or {};
        if not (not v5 or not v8.ShowSponsored) then
            v7:dispatch(v3(v4, v1.SponsoredItemsCategoryRecommended, v1.SponsoredItemsToFetch));
        end;
        return v7:dispatch(v2(v6));
    end;
end;
