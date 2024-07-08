local v0 = require(game:GetService("CorePackages").Workspace.Packages.LoggingProtocol);
game:DefineFastInt("AvatarChatSubsessionStatsEventThrottleHundrethsPercent", 0);
return {
    eventName = "avatarChatSubsessionStats", 
    backends = {
        v0.TelemetryBackends.EventIngest
    }, 
    throttlingPercentage = game:GetFastInt("AvatarChatSubsessionStatsEventThrottleHundrethsPercent"), 
    lastUpdated = {
        22, 
        10, 
        17
    }, 
    description = "Report FACS sending/receiving time per Avatar Chat session to EventIngest.", 
    links = "https://roblox.atlassian.net/wiki/spaces/DA/pages/1857851197/Logging+Specs+Subsession+Analytics"
};
