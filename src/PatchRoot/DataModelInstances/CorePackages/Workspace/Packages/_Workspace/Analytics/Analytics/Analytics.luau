local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_AnalyticsReporters_0 = script.Parent.AnalyticsReporters;
local v2 = require(l_AnalyticsReporters_0.Diag);
local v3 = require(l_AnalyticsReporters_0.EventStream);
local v4 = require(l_AnalyticsReporters_0.GoogleAnalytics);
local v5 = require(l_AnalyticsReporters_0.Influx);
local v6 = {};
v6.__index = v6;
v6.new = function(v7)
    if not v7 then
        v7 = l_RbxAnalyticsService_0;
    end;
    local v8 = {
        Diag = v2.new(v7), 
        EventStream = v3.new(v7), 
        GoogleAnalytics = v4.new(v7), 
        InfluxDb = v5.new(v7)
    };
    setmetatable(v8, v6);
    return v8;
end;
v6.mock = function()
    return v6.new({
        ReportCounter = function()
        end, 
        ReportInfluxSeries = function()
        end, 
        ReportStats = function()
        end, 
        SetRBXEvent = function()
        end, 
        SetRBXEventStream = function()
        end, 
        TrackEvent = function()
        end, 
        UpdateHeartbeatObject = function()
        end, 
        SendEventDeferred = function()
        end
    });
end;
return v6;
