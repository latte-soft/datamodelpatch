local l_CoreGui_0 = game:GetService("CoreGui");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v3 = require(l_RobloxGui_0.Modules.Common.PolicyService);
local v4 = require(l_RobloxGui_0.Modules.Flags.GetFFlagScreenshotHudApi);
return function()
    local l_l_UserInputService_0_Platform_0 = l_UserInputService_0:GetPlatform();
    local v6 = true;
    if l_l_UserInputService_0_Platform_0 ~= Enum.Platform.IOS then
        v6 = l_l_UserInputService_0_Platform_0 == Enum.Platform.Android;
    end;
    local v7 = false;
    if not ((not v4() or not v6) or v3:IsSubjectToChinaPolicies()) then
        v7 = true;
    end;
    return v7;
end;
