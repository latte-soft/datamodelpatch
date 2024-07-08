local v0 = require(script:FindFirstAncestor("SocialLuaAnalytics").Parent.Cryo);
local v1 = require(script.Parent.AnalyticsFactory);
local _ = require(script.Parent.Parent.Types);
return function(v3)
    return function(v4)
        return v1(v0.Dictionary.join(v3, {
            infoForAllEvents = v0.Dictionary.join(v3.staticInfoForAllEvents or {}, not not v4 and v4.infoForAllEvents or {})
        }));
    end;
end;
