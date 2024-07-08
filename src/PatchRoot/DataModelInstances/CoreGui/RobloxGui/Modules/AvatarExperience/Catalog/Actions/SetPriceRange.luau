local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Rodux);
local v2 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
return v1.makeActionCreator(script.Name, function(v3, v4)
    v2.isType(v3, "number", "SetPriceRange expects minPrice");
    v2.isType(v4, "number", "SetPriceRange expects maxPrice");
    return {
        priceRange = {
            minPrice = v3, 
            maxPrice = v4
        }
    };
end);
