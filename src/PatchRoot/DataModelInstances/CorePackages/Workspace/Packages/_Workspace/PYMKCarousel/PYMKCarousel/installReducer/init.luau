local l_script_FirstAncestor_0 = script:FindFirstAncestor("PYMKCarousel");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_Rodux_0 = v1.Rodux;
local l_RoduxNetworking_0 = v1.RoduxNetworking;
local v4 = require(script.RoduxAnalytics);
local v5 = require(script.Users);
local v6 = require(script.Friends);
local _ = require(l_script_FirstAncestor_0.Common.OmniTypes);
return function(v8)
    if not v8.contentType or not v8.treatmentType then
        return nil;
    else
        return (l_Rodux_0.combineReducers({
            Users = v5(v8), 
            Friends = v6(v8), 
            NetworkStatus = l_RoduxNetworking_0.installReducer(), 
            Analytics = v4(v8)
        }));
    end;
end;
