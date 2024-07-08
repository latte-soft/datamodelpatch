local l_Parent_0 = script:FindFirstAncestor("SocialLuaAnalytics").Parent;
local l_EventIngestService_0 = game:GetService("EventIngestService");
return {
    EventStream = {
        setRBXEventStream = require(script.Parent.setupSetRbxEventStream)(l_EventIngestService_0), 
        sendEventDeferred = require(script.Parent.setupSendEventDeferred)(l_EventIngestService_0)
    }, 
    Diag = require(l_Parent_0.Analytics).Analytics.new(game:GetService("RbxAnalyticsService")).Diag
};
