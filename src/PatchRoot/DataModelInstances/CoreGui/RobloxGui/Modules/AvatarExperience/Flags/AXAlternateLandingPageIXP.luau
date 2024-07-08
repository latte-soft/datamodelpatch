local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Experiment.AppUserLayers);
local v2 = require(l_Modules_0.AvatarExperience.Common.Util.IXPUtils);
game:DefineFastFlag("AXDefaultAvatarToShopEnabled3", false);
game:DefineFastFlag("AXDefaultAvatarToShopEnabledForAll3", false);
game:DefineFastString("AXDefaultAvatarToShopLayer3", v1.AvatarMarketplaceUILayer);
game:DefineFastFlag("AXDefaultAvatarToShopWidgetEnabled3", false);
return v2.defineIXPTest({
    name = "AXDefaultAvatarToShop", 
    layer = game:GetFastString("AXDefaultAvatarToShopLayer3"), 
    getDependentFlagsEnabled = function()
        return true;
    end, 
    getEnabledFlag = function()
        return game:GetFastFlag("AXDefaultAvatarToShopEnabled3");
    end, 
    getEnabledForAllFlag = function()
        return game:GetFastFlag("AXDefaultAvatarToShopEnabledForAll3");
    end, 
    cacheVariables = true, 
    variables = {
        EnabledForUser = function(v3, v4)
            local l_avatarExperienceLandingPage_0 = v3.avatarExperienceLandingPage;
            local l_v4_0 = v4;
            if not l_v4_0 then
                if l_avatarExperienceLandingPage_0 then
                    l_v4_0 = true;
                    if not (l_avatarExperienceLandingPage_0 == "default") then
                        goto label0;
                    end;
                end;
                l_v4_0 = false;
            end;
            ::label0::;
            return l_v4_0;
        end, 
        GetFullScreenEnabled = function(v7, v8)
            return v8 or v7.avatarExperienceLandingPage == "shopFullscreen";
        end, 
        Row = function(_, _)
            return 2;
        end, 
        WidgetEnabled = function(_, _)
            return game:GetFastFlag("AXDefaultAvatarToShopWidgetEnabled3");
        end
    }
});
