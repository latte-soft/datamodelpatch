local v0 = require(game:GetService("CorePackages").Workspace.Packages.LoggingProtocol);
game:DefineFastInt("IntervalPerformanceTrackerEventThrottleHundrethsPercent", 10000);
return {
    eventName = "luaIntervalPerformanceTrackerTelemetry", 
    backends = {
        v0.TelemetryBackends.Points
    }, 
    throttlingPercentage = game:GetFastInt("IntervalPerformanceTrackerEventThrottleHundrethsPercent"), 
    lastUpdated = {
        24, 
        1, 
        10
    }, 
    description = "Report lua performance tracking metrics to Grafana.", 
    links = "https://roblox.atlassian.net/wiki/spaces/USER/pages/2379481365/Parallelize+work+through+the+new+multi-threading+API"
};
