local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.Screenshots.ScreenshotsApp);
local v2 = require(script.Parent.Parent.Parent.Service);
local v3 = require(script.Parent.Parent.Parent.Analytics.ChromeAnalytics);
local v4 = require(script.Parent.Parent.CommonIcon);
local l_GetFFlagEnableScreenshotUtility_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableScreenshotUtility;
local v6 = nil;
local v7 = nil;
if l_GetFFlagEnableScreenshotUtility_0() then
    v6 = v1.createShutterSound();
    v7 = nil;
end;
return not not l_GetFFlagEnableScreenshotUtility_0() and v2:register({
    initialAvailability = v2.AvailabilitySignal.Available, 
    id = "screenshot", 
    label = "CoreScripts.InGameMenu.Controls.Screenshot", 
    hotkeyCodes = v7, 
    activated = function(_)
        v3.default:onCaptureTaken("mobile", "buttonClick", "screenshots");
        if v6 then
            v6:Play();
        end;
        v1.takeCapture();
    end, 
    components = {
        Icon = function(_)
            return v4("icons/controls/screenshot");
        end
    }
}) or nil;
