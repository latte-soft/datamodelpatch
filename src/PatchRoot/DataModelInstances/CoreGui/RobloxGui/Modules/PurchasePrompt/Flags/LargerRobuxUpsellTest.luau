game:DefineFastFlag("InGameLargerRobuxUpsellIXP", false);
game:DefineFastFlag("InGameLargerRobuxUpsellIXPRolledOut", false);
game:DefineFastFlag("InGameLargerRobuxUpsellEnabled", false);
game:DefineFastString("InGameLargerRobuxUpsellIXPLayerParam", "isInExperiment");
local function v0()
    return game:GetFastFlag("InGameLargerRobuxUpsellEnabled");
end;
local function _()
    return game:GetFastFlag("InGameLargerRobuxUpsellEnabled") or game:GetFastFlag("InGameLargerRobuxUpsellIXPRolledOut");
end;
return {
    isEnabled = function()
        return game:GetFastFlag("InGameLargerRobuxUpsellEnabled") or game:GetFastFlag("InGameLargerRobuxUpsellIXP");
    end, 
    isEnabledForAll = v0, 
    isUserEnrolled = function(v2)
        if not game:GetFastFlag("InGameLargerRobuxUpsellEnabled") then
            if game:GetFastFlag("InGameLargerRobuxUpsellEnabled") or game:GetFastFlag("InGameLargerRobuxUpsellIXP") then
                v2 = v2 or {};
                local l_game_FastString_0 = game:GetFastString("InGameLargerRobuxUpsellIXPLayerParam");
                if v2[l_game_FastString_0] == nil then
                    return game:GetFastFlag("InGameLargerRobuxUpsellEnabled") or game:GetFastFlag("InGameLargerRobuxUpsellIXPRolledOut");
                else
                    return v2[l_game_FastString_0];
                end;
            else
                return false;
            end;
        else
            return true;
        end;
    end
};
