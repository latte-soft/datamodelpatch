local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local l_IsVRAppBuild_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).IsVRAppBuild;
local l_DeviceOrientationMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).DeviceOrientationMode;
return function(v5)
    if not l_IsVRAppBuild_0() then
        return v5.DeviceOrientation == l_DeviceOrientationMode_0.Portrait;
    else
        return true;
    end;
end;
