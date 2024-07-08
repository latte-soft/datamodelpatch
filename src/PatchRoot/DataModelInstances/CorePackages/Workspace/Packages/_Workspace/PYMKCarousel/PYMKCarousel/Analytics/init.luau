local v0 = require(script:FindFirstAncestor("PYMKCarousel").dependencies);
local l_Context_0 = v0.SocialLibraries.Context;
local v2 = require(script.PYMKCarouselAnalyticsContext);
return {
    setupFireEvent = require(script.setupFireEvent), 
    Context = v2, 
    connect = l_Context_0.getConnect(v2), 
    with = l_Context_0.getWith(v2), 
    EventNames = require(script.EventNames), 
    BtnValues = if not v0.getFFlagPYMKAddFriendsEntry() then nil else require(script.BtnValues), 
    useAnalytics = require(script.useAnalytics), 
    useUserSeenEvent = require(script.useUserSeenEvent)
};
