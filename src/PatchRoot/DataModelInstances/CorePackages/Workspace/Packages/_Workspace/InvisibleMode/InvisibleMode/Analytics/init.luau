local l_Context_0 = require(script.Parent.dependencies).SocialLibraries.Context;
local v1 = require(script.InvisibleModeAnalytics);
return {
    connect = l_Context_0.getConnect(v1), 
    Context = v1, 
    EventNames = require(script.EventNames), 
    setupFireEvent = require(script.setupFireEvent), 
    Surface = {
        HomePage = "homepage", 
        ProfileCard = "profileCard", 
        SocialTab = "socialTab", 
        UniversalAppHeaderBar = "universalAppHeaderBar"
    }, 
    useAnalytics = require(script.useAnalytics), 
    wrapWithAnalyticsProvider = require(script.wrapWithAnalyticsProvider)
};
