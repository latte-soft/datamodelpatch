local _ = require(script.Parent.networkingCallTypes);
local l_networkRequests_0 = script.Parent.networkRequests;
local v2 = require(l_networkRequests_0.createGetCallHistory);
local v3 = require(l_networkRequests_0.createGetSuggestedCallees);
return function(v4)
    return {
        GetCallHistory = v2(v4), 
        GetSuggestedCallees = v3(v4)
    };
end;
