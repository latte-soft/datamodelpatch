local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Experiment.AppUserLayers);
local v2 = require(l_Modules_0.AvatarExperience.Common.Util.IXPUtils);
game:DefineFastFlag("EnableAEInfiniteScrollRecommendationsIXP3", false);
game:DefineFastFlag("EnableAEInfiniteScrollRecommendationsForAll", false);
return v2.defineIXPTest({
    name = "AEInfiniteScrollRecommendations", 
    layer = game:DefineFastString("AEInfiniteScrollRecommendationsLayer", v1.AvatarMarketplaceEditor), 
    getDependentFlagsEnabled = function()
        return true;
    end, 
    getEnabledFlag = function()
        return game:GetFastFlag("EnableAEInfiniteScrollRecommendationsIXP3");
    end, 
    getEnabledForAllFlag = function()
        return game:GetFastFlag("EnableAEInfiniteScrollRecommendationsForAll");
    end, 
    cacheVariables = true, 
    variables = {
        EnabledForUser = function(v3, v4)
            return (v4 or v3.InfiniteScroll) or false;
        end
    }
});
