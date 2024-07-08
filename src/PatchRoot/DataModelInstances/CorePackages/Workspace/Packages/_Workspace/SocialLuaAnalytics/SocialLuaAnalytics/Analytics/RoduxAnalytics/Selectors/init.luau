local _ = require(script.Parent.AnalyticsTypes);
local v1 = require(script.getSessionIdByKey);
return function(v2)
    return {
        getSessionIdByKey = v1(v2)
    };
end;
