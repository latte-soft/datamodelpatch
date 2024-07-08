game:DefineFastFlag("SortCurrentlyWearingItemsIXPSetupEnabled", false);
game:DefineFastFlag("SortCurrentlyWearingItemsIXPEnabled", false);
local l_AppUserLayers_0 = require(script:FindFirstAncestor("Profile").dependencies).AppUserLayers;
local v1 = {
    Default = "default", 
    FavoriteCount = "favoriteCount", 
    PriceDecreasing = "priceDecreasing", 
    PriceIncreasing = "priceIncreasing"
};
local function v2()
    return game:GetFastFlag("SortCurrentlyWearingItemsIXPSetupEnabled");
end;
local function _()
    return game:GetFastFlag("SortCurrentlyWearingItemsIXPEnabled");
end;
return {
    FFlagIsSetupEnabled = v2, 
    getExperimentVariant = function(v4)
        if game:GetFastFlag("SortCurrentlyWearingItemsIXPEnabled") then
            return ((v4 or {})[l_AppUserLayers_0.SocialProfilePeekViewLayer] or {}).sortCurrentlyWearingVariant or v1.Default;
        else
            return nil;
        end;
    end, 
    Variants = v1
};
