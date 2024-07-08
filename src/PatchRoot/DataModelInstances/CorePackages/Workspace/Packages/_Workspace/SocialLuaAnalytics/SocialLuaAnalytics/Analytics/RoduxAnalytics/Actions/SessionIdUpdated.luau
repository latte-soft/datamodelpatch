local v0 = require(script.Parent.Parent.Parent.Parent.dependencies);
local _ = require(script.Parent.Parent.AnalyticsTypes);
return v0.Rodux.makeActionCreator(script.Name, function(v2)
    return {
        payload = v2
    };
end);
