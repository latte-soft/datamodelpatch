local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_RobloxGui_0.Modules.Common.Hooks.useScreenSize);
local v3 = require(script.ChromeAnalytics);
local v4 = require(l_CorePackages_0.Packages.React);
local v5 = require(script.Parent.Flags.GetFFlagUnibarLuaOcclusionMetrics)();
local v6 = require(script.OcclusionMetricsManager);
return function(_)
    v3.default:setScreenSize((v2()));
    if not v5 then
        return nil;
    else
        return v4.createElement(v6);
    end;
end;
