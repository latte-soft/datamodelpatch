local l_default_0 = require(game:GetService("CorePackages").Workspace.Packages.LoggingProtocol).default;
local v1 = game:DefineFastInt("AXPointsEventHundredthsPercent", 0);
local function _(v2)
    return {
        eventName = "AvatarExperience" .. v2, 
        backends = {
            l_default_0.TelemetryBackends.Points
        }, 
        throttlingPercentage = v1
    };
end;
return {
    sendTelemetryEvent = function(v4, v5)
        l_default_0:logRobloxTelemetryEvent({
            eventName = "AvatarExperience" .. v4, 
            backends = {
                l_default_0.TelemetryBackends.Points
            }, 
            throttlingPercentage = v1
        }, nil, v5);
    end
};
