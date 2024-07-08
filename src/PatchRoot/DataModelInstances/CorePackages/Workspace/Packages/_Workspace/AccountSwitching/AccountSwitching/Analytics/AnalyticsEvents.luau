local v0 = require(script.Parent.Parent.dependencies);
local v1 = require(script.Parent.EventConstants);
local v2 = v0.Analytics.AnalyticsReporters.EventIngest.new((game:GetService("EventIngestService")));
return {
    sendModalShownEvent = function(v3, v4)
        v2:sendEventDeferred(v3, v1.eventNames.modalShown, {
            state = v4
        });
    end, 
    sendButtonClickEvent = function(v5, v6, v7)
        v2:sendEventDeferred(v5, v1.eventNames.buttonClick, {
            btn = v6, 
            state = v7
        });
    end
};
