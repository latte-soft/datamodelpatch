return {
    eventName = "accountSecurityChallengeDeviceIntegrityEvent", 
    backends = {
        require(game:GetService("CorePackages").Workspace.Packages.LoggingProtocol).TelemetryBackends.EventIngest
    }, 
    throttlingPercentage = 10000, 
    lastUpdated = {
        24, 
        1, 
        22
    }, 
    description = "Tracks lifecycle events for the Device Integrity GCS challenge", 
    links = "https://roblox.atlassian.net/wiki/spaces/BaS/pages/2184872709/Bypassing+Challenges+for+Xbox+PS+Quest+etc+Requests#Event-Tracking"
};
