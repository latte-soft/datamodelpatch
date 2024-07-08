local v0 = require(script.Parent.Parent.dependencies);
local v1 = require(script.Parent.EventConstants);
local v2 = v0.Analytics.AnalyticsReporters.EventIngest.new((game:GetService("EventIngestService")));
return {
    sendPageLoadEvent = function(v3, v4, v5)
        v2:sendEventDeferred(v3, v1.eventNames.pageLoad, {
            origin = v4, 
            state = v5
        });
    end, 
    sendSelectEvent = function(v6, v7, v8)
        v2:sendEventDeferred(v6, v1.eventNames.buttonClick, {
            origin = v7, 
            btn = v1.btn.select, 
            state = v8
        });
    end, 
    sendModalShownEvent = function(v9, v10)
        v2:sendEventDeferred(v9, v1.eventNames.modalShown, {
            origin = v10
        });
    end, 
    sendButtonClickEvent = function(v11, v12, v13)
        v2:sendEventDeferred(v11, v1.eventNames.buttonClick, {
            origin = v12, 
            btn = v13
        });
    end
};
