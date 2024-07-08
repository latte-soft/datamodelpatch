local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Experiment.AppUserLayers);
local v2 = require(l_Modules_0.AvatarExperience.Common.Util.IXPUtils);
game:DefineFastFlag("AXPersistentCatalogFiltersIXPEnabled2", false);
game:DefineFastString("AXPersistentCatalogFiltersIXPLayer2", v1.AvatarExperienceUAFilterAndSortView);
game:DefineFastFlag("AXPersistentCatalogFiltersIXPEnabledForAll2", false);
return v2.defineIXPTest({
    name = "AvatarMarketplace.Catalog.PersistentCatalogFilters", 
    layer = game:GetFastString("AXPersistentCatalogFiltersIXPLayer2"), 
    getDependentFlagsEnabled = function()
        return true;
    end, 
    getEnabledFlag = function()
        return game:GetFastFlag("AXPersistentCatalogFiltersIXPEnabled2");
    end, 
    getEnabledForAllFlag = function()
        return game:GetFastFlag("AXPersistentCatalogFiltersIXPEnabledForAll2");
    end, 
    variables = {
        EnablePersistentCatalogFilters = function(v3, v4)
            local l_enablePersistentCatalogFilters_0 = v3.enablePersistentCatalogFilters;
            local l_v4_0 = v4;
            if not l_v4_0 then
                l_v4_0 = true;
                if l_enablePersistentCatalogFilters_0 ~= true then
                    l_v4_0 = false;
                end;
            end;
            return l_v4_0;
        end
    }
});
