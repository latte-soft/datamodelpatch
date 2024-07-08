local v0 = require(script:FindFirstAncestor("UserSearch").Parent.SocialLuaAnalytics);
local l_createFireEvent_0 = v0.Analytics.FireEvent.createFireEvent;
local l_AnalyticsFactory_0 = v0.Analytics.AnalyticsFactory;
local l_DefaultAnalyticsService_0 = v0.Analytics.DefaultAnalyticsService;
local v4 = require(script.EventStreamActionList);
return {
    setupFireEvent = l_createFireEvent_0({
        EventStream = v4
    }), 
    EventNames = require(script.EventNames), 
    Analytics = l_AnalyticsFactory_0.setUpAnalyticsFactory({
        eventLists = {
            EventStream = v4, 
            Diag = require(script.DiagEventsList)
        }, 
        analyticsImpl = {
            EventStream = l_DefaultAnalyticsService_0.EventStream, 
            Diag = l_DefaultAnalyticsService_0.Diag
        }
    })
};
