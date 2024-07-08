local l_VRService_0 = game:GetService("VRService");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local v2 = require(l_RobloxGui_0.Modules.TenFootInterface);
local v3 = require(l_RobloxGui_0.Modules.Settings.Utility);
local v4 = game:DefineFastFlag("FixPlayerListOpenOnLaunch", false);
local function _()
    if not _G.__TESTEZ_RUNNING_TEST__ then
        return v3:IsSmallTouchScreen();
    else
        return false;
    end;
end;
return function()
    if not v4 then
        return not if not _G.__TESTEZ_RUNNING_TEST__ then v3:IsSmallTouchScreen() else false and not l_VRService_0.VREnabled;
    else
        return (not if not _G.__TESTEZ_RUNNING_TEST__ then v3:IsSmallTouchScreen() else false and not l_VRService_0.VREnabled) and not v2:IsEnabled();
    end;
end;
