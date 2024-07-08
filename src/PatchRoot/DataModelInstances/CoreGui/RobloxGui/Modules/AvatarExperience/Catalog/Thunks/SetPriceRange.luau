local v0 = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Catalog.Actions.SetPriceRange);
return function(v1, v2, v3)
    return function(v4)
        v4:dispatch(v0(v1, v2));
        v3.applyPriceFilter(v1, v2);
    end;
end;
