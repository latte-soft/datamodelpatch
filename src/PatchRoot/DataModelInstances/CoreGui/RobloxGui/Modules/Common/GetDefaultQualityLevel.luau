local l_IsVRAppBuild_0 = require(game:GetService("CorePackages").Workspace.Packages.AppCommonLib).IsVRAppBuild;
local _ = game:GetService("UserInputService");
local _ = game:GetService("CoreGui"):WaitForChild("RobloxGui");
return function()
    if not l_IsVRAppBuild_0() then
        return Enum.QualityLevel.Automatic;
    else
        return Enum.QualityLevel.Level07;
    end;
end;
