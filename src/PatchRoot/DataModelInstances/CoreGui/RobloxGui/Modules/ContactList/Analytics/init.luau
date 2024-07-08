local v0 = require(game:GetService("CorePackages").Workspace.Packages.SocialLuaAnalytics);
return {
    Analytics = v0.Analytics.AnalyticsFactory.setUpAnalyticsFactory({
        eventLists = {
            EventStream = require(script.EventStreamActionList), 
            Diag = nil
        }, 
        analyticsImpl = {
            EventStream = v0.Analytics.DefaultAnalyticsService.EventStream, 
            Diag = nil
        }
    }), 
    useAnalytics = require(script.useAnalytics)
};
