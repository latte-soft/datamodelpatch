local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.Roact);
local l_Analytics_0 = require(l_Parent_0.Analytics).Analytics;
local v3 = require(script.Parent.Parent.RoactChatAnalytics);
local v4 = require(script.Parent.Parent.AnalyticsContext);
return function(v5)
    return v1.createElement(v4.Provider, {
        value = v3.new(l_Analytics_0.mock(), (tostring(math.random(999999999))))
    }, v1.oneChild(v5[v1.Children]));
end;
