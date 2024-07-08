local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Experiment.AppUserLayers);
local v2 = require(l_Modules_0.AvatarExperience.Common.Util.IXPUtils);
game:DefineFastFlag("AXAdaptiveScrollingImprovementIXPEnabled", false);
game:DefineFastString("AXAdaptiveScrollingImprovementIXPLayer", v1.AvatarExperienceUAMarketplaceView);
game:DefineFastFlag("AXAdaptiveScrollingImprovementIXPEnabledForAll", false);
return v2.defineIXPTest({
    name = "AvatarMarketplace.Catalog.AdaptiveScrollingImprovement", 
    layer = game:GetFastString("AXAdaptiveScrollingImprovementIXPLayer"), 
    getDependentFlagsEnabled = function()
        return true;
    end, 
    getEnabledFlag = function()
        return game:GetFastFlag("AXAdaptiveScrollingImprovementIXPEnabled");
    end, 
    getEnabledForAllFlag = function()
        return game:GetFastFlag("AXAdaptiveScrollingImprovementIXPEnabledForAll");
    end, 
    variables = {
        EnableMidViewScrolling = function(v3, v4)
            local l_enableMidViewScrolling_0 = v3.enableMidViewScrolling;
            local l_v4_0 = v4;
            if not l_v4_0 then
                l_v4_0 = true;
                if l_enableMidViewScrolling_0 ~= true then
                    l_v4_0 = false;
                end;
            end;
            return l_v4_0;
        end
    }
});
