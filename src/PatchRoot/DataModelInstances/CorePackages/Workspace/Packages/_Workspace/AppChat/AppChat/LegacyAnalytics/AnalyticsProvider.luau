local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Roact);
local l_Analytics_0 = require(l_Parent_0.Analytics).Analytics;
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local v5 = require(script.Parent.RoactChatAnalytics);
local v6 = require(l_script_FirstAncestor_0.LegacyAnalytics.AnalyticsContext);
return function(v7)
    return v2.createElement(v6.Provider, {
        value = v5.new(l_Analytics_0.new(l_RbxAnalyticsService_0), v7.localUserId)
    }, v2.oneChild(v7[v2.Children]));
end;
