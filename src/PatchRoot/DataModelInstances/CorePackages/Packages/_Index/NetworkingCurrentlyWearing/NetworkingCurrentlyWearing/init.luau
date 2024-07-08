local l_networkRequests_0 = script.networkRequests;
local v1 = require(l_networkRequests_0.createGetCurrentlyWearing);
local v2 = require(l_networkRequests_0.createGetItemDetails);
return {
    config = function(v3)
        return {
            GetCurrentlyWearing = v1(v3), 
            GetItemDetails = v2(v3)
        };
    end
};
