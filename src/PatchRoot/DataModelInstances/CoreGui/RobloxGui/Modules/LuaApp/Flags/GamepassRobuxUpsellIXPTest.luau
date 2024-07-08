local v0 = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Experiment.AppUserLayers);
game:DefineFastFlag("GamepassRobuxUpsellIXPV2", false);
game:DefineFastFlag("GamepassRobuxUpsellIXPRolledOutV2", false);
game:DefineFastFlag("GamepassRobuxUpsellEnabledV2", false);
local function v1()
    return game:GetFastFlag("GamepassRobuxUpsellEnabledV2");
end;
local function _()
    return game:GetFastFlag("GamepassRobuxUpsellEnabledV2") or game:GetFastFlag("GamepassRobuxUpsellIXPRolledOutV2");
end;
return {
    isEnabled = function()
        return game:GetFastFlag("GamepassRobuxUpsellEnabledV2") or game:GetFastFlag("GamepassRobuxUpsellIXPV2");
    end, 
    isEnabledForAll = v1, 
    isUserEnrolled = function(v3)
        if not game:GetFastFlag("GamepassRobuxUpsellEnabledV2") then
            if game:GetFastFlag("GamepassRobuxUpsellEnabledV2") or game:GetFastFlag("GamepassRobuxUpsellIXPV2") then
                local v4 = v3[v0.GamepassRobuxUpsellLayer] or {};
                if v4.isInExperiment then
                    return v4.isInExperiment ~= 0;
                elseif not (game:GetFastFlag("GamepassRobuxUpsellEnabledV2") or game:GetFastFlag("GamepassRobuxUpsellIXPRolledOutV2")) then
                    return false;
                else
                    return true;
                end;
            else
                return false;
            end;
        else
            return true;
        end;
    end
};
