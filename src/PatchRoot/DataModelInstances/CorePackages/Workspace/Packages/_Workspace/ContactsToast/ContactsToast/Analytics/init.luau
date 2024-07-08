local v0 = require(script:FindFirstAncestor("ContactsToast").Parent.SocialLuaAnalytics);
local l_AnalyticsFactory_0 = v0.Analytics.AnalyticsFactory;
local l_DefaultAnalyticsService_0 = v0.Analytics.DefaultAnalyticsService;
return {
    EventNames = require(script.EventNames), 
    Analytics = l_AnalyticsFactory_0.setUpAnalyticsFactory({
        eventLists = {
            EventStream = require(script.EventStreamActionList), 
            Diag = require(script.DiagActionList)
        }, 
        analyticsImpl = {
            EventStream = l_DefaultAnalyticsService_0.EventStream, 
            Diag = l_DefaultAnalyticsService_0.Diag
        }
    })
};
