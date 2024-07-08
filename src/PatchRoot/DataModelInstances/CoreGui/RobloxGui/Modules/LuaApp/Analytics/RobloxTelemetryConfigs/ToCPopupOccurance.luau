local v0 = require(game:GetService("CorePackages").Workspace.Packages.LoggingProtocol);
game:DefineFastInt("ToCPopupOccuranceThrottleHundrethsPercent", 0);
return {
    eventName = "ToCPopupOccurance", 
    backends = {
        v0.TelemetryBackends.Points
    }, 
    throttlingPercentage = game:GetFastInt("ToCPopupOccuranceThrottleHundrethsPercent"), 
    lastUpdated = {
        23, 
        3, 
        8
    }, 
    description = "Report ocurrance of ToC popup"
};
