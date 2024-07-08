local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Experiment.AppUserLayers);
local v2 = require(l_Modules_0.AvatarExperience.Common.Util.IXPUtils);
game:DefineFastFlag("AXTileSizeIXPEnabled", false);
game:DefineFastString("AXTileSizeIXPLayer", v1.AvatarExperienceUAMarketplaceView);
return v2.defineIXPTest({
    name = "Avatar.ItemTileSize.Catalog.LearningTest.1", 
    layer = game:GetFastString("AXTileSizeIXPLayer"), 
    getDependentFlagsEnabled = function()
        return true;
    end, 
    getEnabledFlag = function()
        return game:GetFastFlag("AXTileSizeIXPEnabled");
    end, 
    getEnabledForAllFlag = function()
        return false;
    end, 
    variables = {
        IsLargeCatalogItemTileForUser = function(v3, _)
            return v3.isLargeCatalogItemTile == true;
        end, 
        IsSmallCatalogItemTileForUser = function(v5, _)
            return v5.isSmallCatalogItemTile == true;
        end
    }
});
