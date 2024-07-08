local l_VRService_0 = game:GetService("VRService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v3 = require(l_CoreGui_0.RobloxGui.Modules:FindFirstChild("LuaApp").ExperienceEventReceiver);
local l_SplashScreenManager_0 = require(l_CorePackages_0.Workspace.Packages.SplashScreenManager).SplashScreenManager;
local l_IntervalPerformanceTracker_0 = require(l_CorePackages_0.Workspace.Packages.IntervalPerformanceTracker).IntervalPerformanceTracker;
local v6 = nil;
local function _()
    if not v6 then
        v6 = l_VRService_0:GetPropertyChangedSignal("VRSessionState"):Connect(function()
            l_VRService_0.QuestDisplayRefreshRate = 72;
        end);
    end;
end;
return function()
    l_SplashScreenManager_0.initialize(36, 7, 36);
    l_IntervalPerformanceTracker_0:startTracking("appLaunchToTargetFPS");
    l_SplashScreenManager_0.addStatusChangeListener(function(v8)
        if v8 then
            l_IntervalPerformanceTracker_0:stopAndLogTracking("appLaunchToTargetFPS");
        end;
    end);
    local v9 = v3.new();
    l_VRService_0.QuestDisplayRefreshRate = 72;
    v9:onLeft(function()
        l_VRService_0.QuestDisplayRefreshRate = 72;
    end);
    if not v6 then
        v6 = l_VRService_0:GetPropertyChangedSignal("VRSessionState"):Connect(function()
            l_VRService_0.QuestDisplayRefreshRate = 72;
        end);
    end;
end;
