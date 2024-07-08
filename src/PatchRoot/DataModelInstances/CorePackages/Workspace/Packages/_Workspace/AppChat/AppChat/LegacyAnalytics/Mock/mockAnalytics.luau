local v0 = require(script:FindFirstAncestor("AppChat").Parent.Roact);
local v1 = require(script.Parent.MockAnalyticsProvider);
return function(v2)
    return v0.createElement(v1, {}, {
        AnalyticsElement = v2
    });
end;
