local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Experiment.AppUserLayers);
local v2 = require(l_Modules_0.AvatarExperience.Common.Util.IXPUtils);
game:DefineFastFlag("AXRemovePriceFiltersIXPEnabled", false);
game:DefineFastFlag("AXRemovePriceRangeQueryIXPEnabledForAll", false);
game:DefineFastFlag("AXRemovePriceSortIXPEnabledForAll", false);
game:DefineFastString("AXRemovePriceFiltersIXPLayer", v1.AvatarExperienceUAFilterAndSortView);
return v2.defineIXPTest({
    name = "AXRemovePriceFilters", 
    layer = game:GetFastString("AXRemovePriceFiltersIXPLayer"), 
    getDependentFlagsEnabled = function()
        return true;
    end, 
    getEnabledFlag = function()
        return game:GetFastFlag("AXRemovePriceFiltersIXPEnabled");
    end, 
    getEnabledForAllFlag = function()
        return false;
    end, 
    variables = {
        RemovePriceRangeQueryForUser = function(v3, _)
            local l_removePriceRangeQuery_0 = v3.removePriceRangeQuery;
            local l_AXRemovePriceRangeQueryIXPEnabledForAll_0 = game:GetFastFlag("AXRemovePriceRangeQueryIXPEnabledForAll");
            if not l_AXRemovePriceRangeQueryIXPEnabledForAll_0 then
                l_AXRemovePriceRangeQueryIXPEnabledForAll_0 = true;
                if l_removePriceRangeQuery_0 ~= true then
                    l_AXRemovePriceRangeQueryIXPEnabledForAll_0 = false;
                end;
            end;
            return l_AXRemovePriceRangeQueryIXPEnabledForAll_0;
        end, 
        RemovePriceSortForUser = function(v7, _)
            local l_removePriceSort_0 = v7.removePriceSort;
            local l_AXRemovePriceSortIXPEnabledForAll_0 = game:GetFastFlag("AXRemovePriceSortIXPEnabledForAll");
            if not l_AXRemovePriceSortIXPEnabledForAll_0 then
                l_AXRemovePriceSortIXPEnabledForAll_0 = true;
                if l_removePriceSort_0 ~= true then
                    l_AXRemovePriceSortIXPEnabledForAll_0 = false;
                end;
            end;
            return l_AXRemovePriceSortIXPEnabledForAll_0;
        end
    }
});
