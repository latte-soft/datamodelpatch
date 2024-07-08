local v0 = require(script:FindFirstAncestor("SocialLuaAnalytics").Parent.React);
local v1 = require(script.Parent.Timers);
local _ = require(script.Parent.SimpleTimer);
return function(v3)
    return v0.useRef(v1(v3)).current;
end;
