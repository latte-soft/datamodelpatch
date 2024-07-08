local l_CorePackages_0 = game:GetService("CorePackages");
local _ = script:FindFirstAncestor("Modules");
local l_Logger_0 = require(l_CorePackages_0.Workspace.Packages.Loggers).Logger;
local l_Analytics_0 = require(l_CorePackages_0.Workspace.Packages.Analytics).Analytics;
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local v5 = require(l_CorePackages_0.Packages.t);
local v6 = {
    homePage = game:DefineFastString("HomePageNavigationFriendsLandingCounter", "HomePageNavigationFriendsLanding"), 
    morePage = game:DefineFastString("MorePageNavigationFriendsLandingCounter", "MorePageNavigationFriendsLanding")
};
local v7 = v5.strictInterface({
    localUserId = v5.string, 
    context = v5.string, 
    analytics = v5.optional(v5.table)
});
return function(v8)
    assert(v7(v8));
    local v9 = v8.analytics or l_Analytics_0.new(l_RbxAnalyticsService_0);
    if not v6[v8.context] then
        l_Logger_0:error("Error from navigate: Invalid destination '{}'", v8.context);
        return ;
    else
        v9.EventStream:setRBXEventStream(v8.context, "buttonClick", {
            uid = v8.localUserId, 
            btn = "friendsLanding"
        });
        v9.Diag:reportCounter(v6[v8.context], 1);
        return ;
    end;
end;
