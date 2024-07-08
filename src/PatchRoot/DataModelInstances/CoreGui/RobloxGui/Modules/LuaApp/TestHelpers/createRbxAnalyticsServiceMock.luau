local l_CorePackages_0 = game:GetService("CorePackages");
local _ = require(l_CorePackages_0.Workspace.Packages.Analytics);
local l_jest_0 = require(l_CorePackages_0.Packages.Dev.JestGlobals).jest;
return function()
    return {
        ReportCounter = l_jest_0.fn(), 
        ReportInfluxSeries = l_jest_0.fn(), 
        ReportStats = l_jest_0.fn(), 
        ReleaseRBXEventStream = l_jest_0.fn(), 
        SetRBXEvent = l_jest_0.fn(), 
        SetRBXEventStream = l_jest_0.fn(), 
        TrackEvent = l_jest_0.fn(), 
        UpdateHeartbeatObject = l_jest_0.fn(), 
        SendEventDeferred = l_jest_0.fn(), 
        SendEventImmediately = l_jest_0.fn()
    };
end;
