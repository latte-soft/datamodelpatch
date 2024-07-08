local v0 = require(script.Parent.Parent.dependencies);
local v1 = require(script.Parent.EventConstants);
local v2 = v0.Analytics.AnalyticsReporters.EventIngest.new((game:GetService("EventIngestService")));
return {
    sendPageLoadEvent = function(v3, v4)
        v2:sendEventDeferred(v3, v1.eventNames.pageLoad, {
            origin = v4
        });
    end, 
    sendFormInteractionEvent = function(v5, v6, v7)
        v2:sendEventDeferred(v5, v1.eventNames.formInteraction, {
            origin = v6, 
            field = v7
        });
    end, 
    sendButtonClickEvent = function(v8, v9, v10)
        v2:sendEventDeferred(v8, v1.eventNames.buttonClick, {
            origin = v9, 
            btn = v10
        });
    end, 
    sendMsgShownEvent = function(v11, v12, v13, v14)
        v2:sendEventDeferred(v11, v1.eventNames.msgShown, {
            origin = v12, 
            field = v13, 
            errorCode = tostring(v14)
        });
    end
};
