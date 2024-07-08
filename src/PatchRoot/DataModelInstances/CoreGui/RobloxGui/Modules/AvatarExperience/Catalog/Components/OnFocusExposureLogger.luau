local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.React);
local l_NavigationEvents_0 = require(l_CorePackages_0.RoactNavigation).NavigationEvents;
local v5 = require(l_Modules_0.AvatarExperience.Common.Util.IXPUtils);
return function(v6)
    local v7 = v5.useLogExposureOnce(v6.ixpTest);
    if v6.ixpTest.isEnabled() then
        return v3.createElement(l_NavigationEvents_0, {
            onDidFocus = v7
        });
    else
        return nil;
    end;
end;
