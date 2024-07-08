return {
    EventStream = {
        sendEventDeferred = require(script:FindFirstAncestor("StreamNotifications").analytics.sendEventDeferred)((game:GetService("EventIngestService")))
    }
};
