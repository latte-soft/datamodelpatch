local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Experiment.AppUserLayers);
local v2 = require(l_Modules_0.AvatarExperience.Common.Util.IXPUtils);
local v3 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagColorPickerSliderIXPEnabled);
local v4 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagColorPickerSliderIXPEnabledForAll);
return v2.defineIXPTest({
    name = "ColorPickerSlider", 
    layer = game:DefineFastString("ColorPickerIXPLayer", v1.AvatarExperienceColorPickerExposure), 
    recordExposure = false, 
    getDependentFlagsEnabled = function()
        return true;
    end, 
    getEnabledFlag = function()
        return v3();
    end, 
    getEnabledForAllFlag = function()
        return v4();
    end, 
    variables = {
        EnabledForUser = function(v5, v6)
            return (v6 or v5.colorPickerSliderEnabled) or false;
        end
    }
});
