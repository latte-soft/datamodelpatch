local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsCarousel");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Context_0 = v1.SocialLibraries.Context;
local v4 = require(script.FriendsCarouselAnalyticsContext);
local v5 = require(script.setupFireEvent);
local v6 = require(script.useAnalytics);
local v7 = require(l_Parent_0.SocialLuaAnalytics);
local l_AnalyticsFactory_0 = v7.Analytics.AnalyticsFactory;
local l_DefaultAnalyticsService_0 = v7.Analytics.DefaultAnalyticsService;
return {
    EventNames = require(script.EventNames), 
    Analytics = if not require(l_script_FirstAncestor_0.Flags.FFlagFriendsCarouselOldFriendEndpointLoadingTime) then l_AnalyticsFactory_0.setUpAnalyticsFactory({
        eventLists = {
            EventStream = require(script.EventStreamActionList), 
            Diag = require(script.DiagActionList)
        }, 
        analyticsImpl = {
            EventStream = l_DefaultAnalyticsService_0.EventStream, 
            Diag = l_DefaultAnalyticsService_0.Diag
        }
    }) else require(script.AnalyticsSetup), 
    setupFireEvent = v5, 
    Context = v4, 
    connect = l_Context_0.getConnect(v4), 
    with = l_Context_0.getWith(v4), 
    useAnalytics = v6
};
