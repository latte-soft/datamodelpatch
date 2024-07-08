local v0 = require(script.Parent.Parent.dependencies);
local l_EventIngestService_0 = game:GetService("EventIngestService");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_Analytics_0 = v0.Analytics;
local v4 = l_Analytics_0.Analytics.new(l_RbxAnalyticsService_0);
local l_getPlatformTarget_0 = l_Analytics_0.getPlatformTarget;
return {
    Diag = v4.Diag, 
    EventStream = {
        setRBXEventStream = function(_, v7, v8, v9)
            l_EventIngestService_0:SetRBXEventStream(l_getPlatformTarget_0(), v7, v8, v9 or {});
        end
    }
};
