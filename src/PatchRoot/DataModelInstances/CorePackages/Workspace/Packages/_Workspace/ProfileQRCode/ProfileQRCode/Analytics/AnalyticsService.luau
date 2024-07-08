return {
    EventStream = {
        setRBXEventStream = require(script.Parent.setupSetRbxEventStream)((game:GetService("EventIngestService")))
    }, 
    Diag = require(script:FindFirstAncestor("ProfileQRCode").Parent.Analytics).Analytics.new(game:GetService("RbxAnalyticsService")).Diag
};
