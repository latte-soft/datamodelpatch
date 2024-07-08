local v0 = require(game:GetService("CorePackages").Workspace.Packages.LoggingProtocol);
game:DefineFastInt("LuaLogoutReasonsThrottleHundrethsPercent", 0);
return {
    eventName = "LuaLogoutReasons", 
    backends = {
        v0.TelemetryBackends.Points
    }, 
    throttlingPercentage = game:GetFastInt("LuaLogoutReasonsThrottleHundrethsPercent"), 
    lastUpdated = {
        23, 
        2, 
        16
    }, 
    description = "Report Lua logout reasons to Points with document name \"lualogoutreasons\"", 
    links = "https://roblox.atlassian.net/wiki/spaces/AUTH/pages/1972602346/Logout+telemetry+for+Universal+App"
};
