local l_Context_0 = require(script:FindFirstAncestor("FriendsLanding").dependencies).SocialLibraries.Context;
local v1 = require(script.ButtonClickEvents);
local v2 = require(script.ImpressionEvents);
local v3 = require(script.AnalyticsContext);
return {
    Class = require(script.FriendsLandingAnalytics), 
    Context = v3, 
    connect = l_Context_0.getConnect(v3), 
    with = l_Context_0.getWith(v3), 
    ButtonClickEvents = v1, 
    AddFriendsPageLoadAnalytics = require(script.AddFriendsPageLoadAnalytics), 
    AddFriendsSearchbarPressedEvent = require(script.AddFriendsSearchbarPressedEvent), 
    ImpressionEvents = v2, 
    PlayerSearchEvent = require(script.PlayerSearchEvent)
};
