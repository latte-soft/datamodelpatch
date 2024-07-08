local v0 = require(script.enums);
local _ = require(script.types);
return {
    AnalyticsEvent = v0.AnalyticsEvent, 
    requests = require(script.requests), 
    EventDetailsPageLoader = require(script.Components.EventDetailsPageLoader), 
    ShareEventModal = require(script.Components.ShareEventModal), 
    EventNotificationsModal = require(script.Components.EventNotificationsModal), 
    EventsList = require(script.Components.EventsList), 
    installReducer = require(script.installReducer), 
    fireEventDetailsPageVisit = require(script.Analytics.fireEventDetailsPageVisit), 
    fireShareVirtualEventIconClicked = require(script.Analytics.fireShareVirtualEventIconClicked), 
    fireVirtualEventJoined = require(script.Analytics.fireVirtualEventJoined), 
    fireVirtualEventLinkCopied = require(script.Analytics.fireVirtualEventLinkCopied), 
    fireVirtualEventRSVP = require(script.Analytics.fireVirtualEventRSVP), 
    fireEventNotificationEnabled = require(script.Analytics.fireEventNotificationEnabled), 
    fireVirtualEventImpression = require(script.Analytics.fireVirtualEventImpression), 
    ["jest.config"] = script["jest.config"]
};
