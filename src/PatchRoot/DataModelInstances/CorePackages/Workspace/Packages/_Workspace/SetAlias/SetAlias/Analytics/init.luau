local l_Parent_0 = script.Parent;
local v1 = require(script.SetAliasAnalyticsContext);
return {
    AnalyticsService = require(script.AnalyticsService), 
    Context = v1, 
    connect = require(l_Parent_0.dependencies).SocialLibraries.Context.getConnect(v1), 
    EventNames = require(script.Enums.EventNames), 
    EntryPoints = require(script.Enums.EntryPoints), 
    setupFireAnalyticsEvents = require(script.setupFireAnalyticsEvents), 
    useAnalytics = require(script.useAnalytics)
};
