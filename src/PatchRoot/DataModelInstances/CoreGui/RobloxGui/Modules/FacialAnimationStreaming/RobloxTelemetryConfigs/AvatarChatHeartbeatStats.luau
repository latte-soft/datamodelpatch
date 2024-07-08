local v0 = require(game:GetService("CorePackages").Workspace.Packages.LoggingProtocol);
game:DefineFastInt("AvatarChatHeartbeatStatsEventThrottleHundrethsPercent", 0);
return {
    eventName = "avatarChatHeartbeatStats", 
    backends = {
        v0.TelemetryBackends.Points
    }, 
    throttlingPercentage = game:GetFastInt("AvatarChatHeartbeatStatsEventThrottleHundrethsPercent"), 
    lastUpdated = {
        23, 
        3, 
        15
    }, 
    description = "Report Avatar Chat session heartbeat to EventIngest.", 
    links = "https://roblox.atlassian.net/wiki/spaces/DA/pages/2025358355/Logging+Specs+Avatar+Chat+Heartbeat+Stats"
};
