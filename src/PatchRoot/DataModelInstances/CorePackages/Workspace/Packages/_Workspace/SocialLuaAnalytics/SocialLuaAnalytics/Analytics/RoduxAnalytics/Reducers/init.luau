local l_Rodux_0 = require(script.Parent.Parent.Parent.dependencies).Rodux;
local _ = require(script.Parent.AnalyticsTypes);
local v2 = require(script.bySessionKey);
return function(v3)
    return l_Rodux_0.combineReducers({
        bySessionKey = v2(v3)
    });
end;
