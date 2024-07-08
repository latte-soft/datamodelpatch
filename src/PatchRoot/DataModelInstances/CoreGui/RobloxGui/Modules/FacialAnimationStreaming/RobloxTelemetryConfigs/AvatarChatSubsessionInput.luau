local v0 = require(game:GetService("CorePackages").Workspace.Packages.LoggingProtocol);
game:DefineFastInt("AvatarChatSubsessionInputEventThrottleHundrethsPercent", 0);
return {
    eventName = "avatarChatSubsessionInput", 
    backends = {
        v0.TelemetryBackends.EventIngest
    }, 
    throttlingPercentage = game:GetFastInt("AvatarChatSubsessionInputEventThrottleHundrethsPercent"), 
    lastUpdated = {
        22, 
        10, 
        17
    }, 
    description = "Report user camera/mic settings for Avatar Chat to EventIngest.", 
    links = "https://roblox.atlassian.net/wiki/spaces/DA/pages/1857851197/Logging+Specs+Subsession+Analytics"
};
