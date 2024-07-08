return {
    eventName = "ScrollingPerformance", 
    backends = {
        require(game:GetService("CorePackages").Workspace.Packages.LoggingProtocol).TelemetryBackends.Points
    }, 
    throttlingPercentage = 10000, 
    lastUpdated = {
        23, 
        10, 
        18
    }, 
    description = "Reporting the scrolling performance of ScrollingFrames", 
    links = "https://roblox.atlassian.net/wiki/spaces/APEX/pages/2276295974/Scrolling+Performance+Tracker"
};
