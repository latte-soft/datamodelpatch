local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.AvatarExperience.Common.Enum.CatalogCategories);
local v2 = require(l_Modules_0.AvatarExperience.Catalog.GetCatalogCategories);
local v3 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXItemCardTallEnabled);
local v4 = require(l_Modules_0.AvatarExperience.Common.Util.IXPUtils);
local v5 = require(l_Modules_0.AvatarExperience.Flags.ItemTileTallIXPTest);
useTallTileIXPEnabled = function(v6)
    local v7 = v4.useTestVariables(v5.IsTallCatalogItemTileForUser);
    if v3() and v7 == true then
        local v8 = v2()[v6];
        local v9 = v8 and v8.NavigationKey;
        local v10 = true;
        if v9 ~= v1.AllAnimations then
            v10 = v9 == v1.Characters;
        end;
        return v10;
    else
        return false;
    end;
end;
return useTallTileIXPEnabled;
