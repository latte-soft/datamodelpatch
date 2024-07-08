local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Experiment.AppUserLayers);
local v2 = require(l_Modules_0.AvatarExperience.Common.Util.IXPUtils);
game:DefineFastFlag("AXCatalogRefreshEnabled", false);
game:DefineFastString("AXCatalogRefreshIXPLayer", v1.AvatarExperienceUAMarketplaceView);
game:DefineFastFlag("AXCatalogRefreshEnabledForAll", false);
return v2.defineIXPTest({
    name = "AvatarMarketplace.Catalog.CatalogRefresh", 
    layer = game:GetFastString("AXCatalogRefreshIXPLayer"), 
    getDependentFlagsEnabled = function()
        return true;
    end, 
    getEnabledFlag = function()
        return game:GetFastFlag("AXCatalogRefreshEnabled");
    end, 
    getEnabledForAllFlag = function()
        return game:GetFastFlag("AXCatalogRefreshEnabledForAll");
    end, 
    variables = {
        EnabledForUser = function(v3, v4)
            local l_enableCatalogRefreshEverywhere_0 = v3.enableCatalogRefreshEverywhere;
            local l_v4_0 = v4;
            if not l_v4_0 then
                l_v4_0 = true;
                if l_enableCatalogRefreshEverywhere_0 ~= true then
                    l_v4_0 = false;
                end;
            end;
            return l_v4_0;
        end
    }
});
