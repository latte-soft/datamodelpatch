local l_Context_0 = require(script.Parent.dependencies).SocialLibraries.Context;
local v1 = require(script.DiscoverabilityModalAnalyticsContext);
return {
    setupFireAnalyticsEvents = require(script.setupFireAnalyticsEvents), 
    Context = v1, 
    connect = l_Context_0.getConnect(v1), 
    EventNames = require(script.Enums.EventNames), 
    useAnalytics = require(script.useAnalytics), 
    EntryPoints = require(script.Enums.EntryPoints), 
    AnalyticsService = require(script.AnalyticsService)
};
