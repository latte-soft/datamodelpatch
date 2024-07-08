local v0 = require(script.Parent.Parent.LoggingProtocol);
game:DefineFastInt("PremiumSponsoredExperienceVideoThrottleHundredthsPercent", 10000);
return {
    eventName = "PremiumSponsoredExperienceVideo", 
    backends = {
        v0.TelemetryBackends.EventIngest
    }, 
    throttlingPercentage = game:GetFastInt("PremiumSponsoredExperienceVideoThrottleHundredthsPercent"), 
    lastUpdated = {
        24, 
        5, 
        13
    }, 
    description = "Reports when a user watches a sponsored video in a premium experience.", 
    links = "https://github.rbx.com/Roblox/proto-schemas/pull/2279"
};
