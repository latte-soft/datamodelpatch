local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Experiment.AppUserLayers);
local v2 = require(l_Modules_0.AvatarExperience.Common.Util.IXPUtils);
local v3 = game:DefineFastString("LuaTopicsIXPLayer", v1.AvatarMarketplaceGuidedFeaturesLayer);
game:DefineFastFlag("TopicsIXPEnabled7", false);
game:DefineFastFlag("TopicsEnabledForAllInSearch", false);
game:DefineFastFlag("TopicsEnabledForAllInCategories", false);
local function _(v4)
    return v4.topicsVariant or 0;
end;
return v2.defineIXPTest({
    name = "Topics", 
    layer = v3, 
    recordExposure = false, 
    getDependentFlagsEnabled = function()
        return true;
    end, 
    getEnabledFlag = function()
        return game:GetFastFlag("TopicsIXPEnabled7");
    end, 
    getEnabledForAllFlag = function()
        return false;
    end, 
    variables = {
        ShowInCategories = function(v6, _)
            local v8 = v6.topicsVariant or 0;
            local v9 = true;
            if v8 ~= 1 then
                v9 = true;
                if v8 ~= 3 then
                    v9 = game:GetFastFlag("TopicsEnabledForAllInCategories");
                end;
            end;
            return v9;
        end, 
        ShowInSearch = function(v10, _)
            local v12 = v10.topicsVariant or 0;
            local v13 = true;
            if v12 ~= 2 then
                v13 = true;
                if v12 ~= 3 then
                    v13 = game:GetFastFlag("TopicsEnabledForAllInSearch");
                end;
            end;
            return v13;
        end
    }
});
