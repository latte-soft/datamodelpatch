local l_Parent_0 = script.Parent.Parent.Parent;
local l_EventIngestService_0 = game:GetService("EventIngestService");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local v3 = require(l_Parent_0.Analytics);
local v4 = v3.Analytics.new(l_RbxAnalyticsService_0);
local l_getPlatformTarget_0 = v3.getPlatformTarget;
return {
    Diag = v4.Diag, 
    EventStream = {
        setRBXEventStream = function(_, v7, v8, v9)
            l_EventIngestService_0:SetRBXEventStream(l_getPlatformTarget_0(), v7, v8, v9 or {});
        end
    }
};
