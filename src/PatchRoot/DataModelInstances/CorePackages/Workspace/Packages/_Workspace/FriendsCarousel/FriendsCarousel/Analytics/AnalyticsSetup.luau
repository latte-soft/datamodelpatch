local v0 = require(script:FindFirstAncestor("FriendsCarousel").Parent.SocialLuaAnalytics);
local l_AnalyticsFactory_0 = v0.Analytics.AnalyticsFactory;
local l_DefaultAnalyticsService_0 = v0.Analytics.DefaultAnalyticsService;
return l_AnalyticsFactory_0.setUpAnalyticsFactory({
    eventLists = {
        EventStream = require(script.Parent.EventStreamActionList), 
        Diag = require(script.Parent.DiagActionList)
    }, 
    analyticsImpl = {
        EventStream = l_DefaultAnalyticsService_0.EventStream, 
        Diag = l_DefaultAnalyticsService_0.Diag
    }
});
