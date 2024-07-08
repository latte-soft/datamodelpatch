local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Experiment.AppUserLayers);
local v2 = require(l_Modules_0.AvatarExperience.Common.Util.IXPUtils);
game:DefineFastFlag("SponsoredItemsIXPEnabled4", false);
game:DefineFastFlag("SponsoredItemsEnabledForAll4", false);
game:DefineFastInt("DebugSponsoredItemsRow", 0);
local v3 = game:DefineFastString("SponsoredItemsIXPLayer", v1.AvatarMarketplaceAdsLayer);
local v4 = game:DefineFastString("SponsoredItemsIXPRowNum", "sponsoredItemsRowNum");
return v2.defineIXPTest({
    name = "SponsoredItems", 
    layer = v3, 
    getDependentFlagsEnabled = function()
        return true;
    end, 
    getEnabledFlag = function()
        return game:GetFastFlag("SponsoredItemsIXPEnabled4");
    end, 
    getEnabledForAllFlag = function()
        return game:GetFastFlag("SponsoredItemsEnabledForAll4");
    end, 
    variables = {
        EnabledForUser = function(v5, v6)
            local v7;
            if not v6 then
                v7 = v5[v4] or 0;
            else
                local l_game_FastInt_0 = game:GetFastInt("DebugSponsoredItemsRow");
                v7 = if l_game_FastInt_0 > 0 then l_game_FastInt_0 else 3;
            end;
            return v7 > 0;
        end, 
        Row = function(v9, v10)
            if not v10 then
                return v9[v4] or 0;
            else
                local l_game_FastInt_1 = game:GetFastInt("DebugSponsoredItemsRow");
                if l_game_FastInt_1 > 0 then
                    return l_game_FastInt_1;
                else
                    return 3;
                end;
            end;
        end
    }
});
