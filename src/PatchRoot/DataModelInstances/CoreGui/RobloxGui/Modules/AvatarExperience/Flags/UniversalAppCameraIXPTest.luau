local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Experiment.AppUserLayers);
local v2 = require(l_Modules_0.AvatarExperience.Common.Util.IXPUtils);
game:DefineFastFlag("UniversalAppCameraEnabled4", false);
local v3 = require(l_Modules_0.AvatarExperience.Flags.FFlagUniversalAppCameraEnabledForAll);
return v2.defineIXPTest({
    name = "CameraButton", 
    getDependentFlagsEnabled = function()
        return game:GetEngineFeature("FacialAnimationStreaming2") and game:GetEngineFeature("VideoCaptureService");
    end, 
    layer = game:DefineFastString("UniversalAppCameraIXPLayer", v1.CameraButton), 
    recordExposure = false, 
    getEnabledFlag = function()
        return game:GetFastFlag("UniversalAppCameraEnabled4");
    end, 
    getEnabledForAllFlag = function()
        return v3;
    end, 
    variables = {
        EnabledForUser = function(v4, v5)
            return v5 or v4.cameraButtonEnabled;
        end
    }
});
