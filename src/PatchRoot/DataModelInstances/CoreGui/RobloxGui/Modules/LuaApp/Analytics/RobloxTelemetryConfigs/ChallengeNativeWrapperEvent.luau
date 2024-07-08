local v0 = require(game:GetService("CorePackages").Workspace.Packages.LoggingProtocol);
game:DefineFastInt("LuaAppChallengeNativeWrapperEventThrottleHundredthsPercent", 10000);
return {
    eventName = "accountSecurityChallengeNativeWrapperEvent", 
    backends = {
        v0.TelemetryBackends.EventIngest
    }, 
    throttlingPercentage = game:GetFastInt("LuaAppChallengeNativeWrapperEventThrottleHundredthsPercent"), 
    lastUpdated = {
        24, 
        4, 
        17
    }, 
    description = "Tracks lifecycle events for Lua GCS challenges", 
    links = "https://roblox.atlassian.net/wiki/spaces/BaS/pages/2184872709/Bypassing+Challenges+for+Xbox+PS+Quest+etc+Requests#Event-Tracking"
};
