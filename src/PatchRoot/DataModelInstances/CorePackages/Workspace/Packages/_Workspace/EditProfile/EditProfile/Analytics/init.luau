local l_Parent_0 = script:FindFirstAncestor("EditProfile").Parent;
local v1 = require(script.EditProfileAnalyticsContext);
return {
    AnalyticsService = require(script.AnalyticsService), 
    Context = v1, 
    connect = require(l_Parent_0.LuaSocialLibrariesDeps).SocialLibraries.config({}).Context.getConnect(v1), 
    EventNames = require(script.Enums.EventNames), 
    setupFireAnalyticsEvents = require(script.setupFireAnalyticsEvents), 
    useAnalytics = require(script.useAnalytics)
};
