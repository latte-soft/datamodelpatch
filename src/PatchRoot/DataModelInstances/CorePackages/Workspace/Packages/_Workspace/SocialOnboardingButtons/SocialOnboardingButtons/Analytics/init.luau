local v0 = require(script:FindFirstAncestor("SocialOnboardingButtons").Parent.SocialLuaAnalytics);
local l_AnalyticsFactory_0 = v0.Analytics.AnalyticsFactory;
local l_DefaultAnalyticsService_0 = v0.Analytics.DefaultAnalyticsService;
local v3 = require(script.getEventStreamActionList);
local v4 = require(script.DiagActionList);
return {
    EventNames = require(script.EventNames), 
    getAnalytics = function(v5)
        return l_AnalyticsFactory_0.setUpAnalyticsFactory({
            eventLists = {
                EventStream = v3(v5), 
                Diag = v4
            }, 
            analyticsImpl = {
                EventStream = l_DefaultAnalyticsService_0.EventStream, 
                Diag = l_DefaultAnalyticsService_0.Diag
            }
        });
    end
};
