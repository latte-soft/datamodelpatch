return {
    eventName = "SocialStopwatchTelementy", 
    backends = {
        require(script:FindFirstAncestor("SocialStopwatch").Parent.LoggingProtocol).default.TelemetryBackends.Points
    }, 
    throttlingPercentage = game:DefineFastInt("SocialStopwatchTelementyThrottleHundrethsPercent", 10000), 
    lastUpdated = {
        24, 
        5, 
        6
    }, 
    description = "Report errors with using the Social Time Stopwatch Library.", 
    links = ""
};
