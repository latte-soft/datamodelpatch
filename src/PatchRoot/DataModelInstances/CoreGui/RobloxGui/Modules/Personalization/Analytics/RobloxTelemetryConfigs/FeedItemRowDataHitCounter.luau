return {
    eventName = "feedItemRowDataHitCounter", 
    backends = {
        require(game:GetService("CorePackages").Workspace.Packages.LoggingProtocol).TelemetryBackends.Counter
    }, 
    throttlingPercentage = require(game:GetService("CoreGui").RobloxGui.Modules.Personalization.Flags.FIntFeedItemRowDataCounterThrottle), 
    lastUpdated = {
        24, 
        5, 
        29
    }, 
    description = "Count the number of times feed item row data is accessible when game impression is sent"
};
