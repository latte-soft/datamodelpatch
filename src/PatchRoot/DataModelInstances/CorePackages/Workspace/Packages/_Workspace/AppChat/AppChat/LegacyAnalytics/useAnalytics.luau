local v0 = require(script:FindFirstAncestor("AppChat").Parent.React);
local v1 = require(script.Parent.AnalyticsContext);
return function()
    return v0.useContext(v1);
end;
