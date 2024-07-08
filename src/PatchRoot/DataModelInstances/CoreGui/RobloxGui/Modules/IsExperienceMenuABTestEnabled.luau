local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(script.Parent.Flags.GetFFlagEnableV3MenuABTest);
local v2 = require(script.Parent.Flags.GetFFlagEnableMenuControlsABTest);
local l_GetFFlagEnableMenuModernizationABTest_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableMenuModernizationABTest;
local l_GetFFlagEnableInGameMenuChromeABTest_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableInGameMenuChromeABTest;
return function()
    return game:GetEngineFeature("ExperienceMenuABTest") and (((v1() or v2()) or l_GetFFlagEnableMenuModernizationABTest_0()) or l_GetFFlagEnableInGameMenuChromeABTest_0());
end;
