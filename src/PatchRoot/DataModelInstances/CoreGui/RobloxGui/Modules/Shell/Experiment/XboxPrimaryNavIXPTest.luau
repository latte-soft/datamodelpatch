local v0 = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Experiment.AppUserLayers);
local v1 = require(script.Parent.makeExperiment);
local v2 = game:DefineFastFlag("XboxPrimaryNavABIXPEnabled", false);
local v3 = game:DefineFastFlag("XboxPrimaryNavABIXPEnrolledForAll", false);
local v4 = game:DefineFastString("XboxPrimaryNavABIXPVariable", "tenFootPrimaryNavEnabled");
local v5 = {};
return {
    isEnabled = function()
        return v3 or v2;
    end, 
    isEnrolledForAll = function()
        return v3;
    end, 
    isUserEnrolled = function()
        if not v3 then
            if v3 or v2 then
                return (v5[v0.XboxClassicUILayer] or {})[v4] or false;
            else
                return false;
            end;
        else
            return true;
        end;
    end, 
    layer = v0.XboxClassicUILayer, 
    experiment = v1("OnUserLayerLoadingStatusChanged", "GetUserLayerLoadingStatus", "GetUserLayerVariables", "LogUserLayerExposure", "GetUserStatusForLayer"), 
    setExperimentState = function(v6)
        v5 = v6;
    end
};
