local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Experiment.AppUserLayers);
local v2 = require(l_Modules_0.AvatarExperience.Common.Util.IXPUtils);
game:DefineFastFlag("AXItemCardTallIXPEnabled", false);
game:DefineFastString("AXTallTileIXPLayer", v1.AvatarExperienceUAMarketplaceView);
return v2.defineIXPTest({
    name = "AvatarMarketplace.TallTileSize.Catalog.LearningTest.2", 
    layer = game:GetFastString("AXTallTileIXPLayer"), 
    getDependentFlagsEnabled = function()
        return true;
    end, 
    getEnabledFlag = function()
        return game:GetFastFlag("AXItemCardTallIXPEnabled");
    end, 
    getEnabledForAllFlag = function()
        return false;
    end, 
    variables = {
        IsTallCatalogItemTileForUser = function(v3, _)
            return v3.isTallCatalogItemTile == true;
        end
    }
});
