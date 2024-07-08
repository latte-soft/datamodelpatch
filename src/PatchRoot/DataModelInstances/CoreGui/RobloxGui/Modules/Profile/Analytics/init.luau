local l_Context_0 = require(script:FindFirstAncestor("Profile").dependencies).SocialLibraries.Context;
local v1 = require(script.ProfileAnalytics);
local v2 = require(script.ProfileAnalyticsContext);
return {
    Class = v1, 
    Context = v2, 
    connect = l_Context_0.getConnect(v2), 
    with = l_Context_0.getWith(v2), 
    Enums = {
        EntryPoints = require(script.EntryPoints), 
        ButtonClickEvents = require(script.ButtonClickEvents)
    }
};
