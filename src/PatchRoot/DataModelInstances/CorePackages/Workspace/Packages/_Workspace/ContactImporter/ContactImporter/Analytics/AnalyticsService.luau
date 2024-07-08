return {
    EventStream = {
        setRBXEventStream = require(script.Parent.setupSetRbxEventStream)((game:GetService("EventIngestService")))
    }, 
    Diag = require(script:FindFirstAncestor("ContactImporter").Parent.Analytics).Analytics.new(game:GetService("RbxAnalyticsService")).Diag
};
