local v0 = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.Util.IXPUtils);
game:DefineFastString("AXAndroidBackButtonLayer", "PlatformExcellence.QualityImprovement.App");
game:DefineFastFlag("AXAndroidBackButtonIXPEnabled", false);
game:DefineFastFlag("AXAndroidBackButtonEnabledForAll", false);
return v0.defineIXPTest({
    name = "PlatformExcellence.QualityImprovement.App.AXAndroidBackButton.1", 
    layer = game:GetFastString("AXAndroidBackButtonLayer"), 
    getDependentFlagsEnabled = function()
        return true;
    end, 
    getEnabledFlag = function()
        return game:GetFastFlag("AXAndroidBackButtonIXPEnabled");
    end, 
    getEnabledForAllFlag = function()
        return game:GetFastFlag("AXAndroidBackButtonEnabledForAll");
    end, 
    variables = {
        EnabledForUser = function(v1, v2)
            return v2 or v1.axAndroidBackButtonEnabled;
        end
    }
});
