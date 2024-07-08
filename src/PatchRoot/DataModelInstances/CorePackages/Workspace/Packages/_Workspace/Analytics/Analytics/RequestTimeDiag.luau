local v0 = require(script.Parent.ReportToDiagByCountryCode);
local v1 = {};
v1.__index = v1;
v1.new = function(v2, v3)
    assert(v3, "metricName is required");
    return (setmetatable({
        metricName = v3, 
        startTime = tick()
    }, v2));
end;
v1.report = function(v4)
    v0(v4.metricName, "RoundTripTime", tick() - v4.startTime, 100);
end;
return v1;
