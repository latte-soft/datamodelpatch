local v0 = require(game:GetService("CorePackages").Workspace.Packages.LoggingProtocol);
game:DefineFastInt("LoginByUsernameSSOErrorsThrottleHundrethsPercent", 0);
return {
    eventName = "LoginByUsernameSSOErrors", 
    backends = {
        v0.TelemetryBackends.Points
    }, 
    throttlingPercentage = game:GetFastInt("LoginByUsernameSSOErrorsThrottleHundrethsPercent"), 
    lastUpdated = {
        24, 
        5, 
        3
    }, 
    description = "Report LoginByUsernameSSO Error codes to Points with document name \"loginbyusernamessoerrors\""
};
