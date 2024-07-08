local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Experiment.AppUserLayers);
local v2 = require(l_Modules_0.AvatarExperience.Common.Util.IXPUtils);
game:DefineFastFlag("AXSearchResultsCategoriesIXPEnabled1", false);
game:DefineFastString("AXSearchResultsCategoriesIXPLayer1", v1.AvatarExperienceUAMarketplaceView);
game:DefineFastFlag("AXSearchResultsCategoriesIXPEnabledForAll1", false);
return v2.defineIXPTest({
    name = "AvatarMarketplace.Catalog.SearchResultsCategories", 
    layer = game:GetFastString("AXSearchResultsCategoriesIXPLayer1"), 
    getDependentFlagsEnabled = function()
        return true;
    end, 
    getEnabledFlag = function()
        return game:GetFastFlag("AXSearchResultsCategoriesIXPEnabled1");
    end, 
    getEnabledForAllFlag = function()
        return game:GetFastFlag("AXSearchResultsCategoriesIXPEnabledForAll1");
    end, 
    variables = {
        EnableSearchResultsCategories = function(v3, v4)
            local l_enableSearchResultsCategories_0 = v3.enableSearchResultsCategories;
            local l_v4_0 = v4;
            if not l_v4_0 then
                l_v4_0 = true;
                if l_enableSearchResultsCategories_0 ~= true then
                    l_v4_0 = false;
                end;
            end;
            return l_v4_0;
        end
    }
});
