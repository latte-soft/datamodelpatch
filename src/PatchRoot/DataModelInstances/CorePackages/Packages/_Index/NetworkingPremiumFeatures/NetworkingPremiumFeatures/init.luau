local v0 = require(script.networkRequests.createGetUserPremiumMembershipStatus);
return {
    config = function(v1)
        return {
            GetUserPremiumMembershipStatus = v0(v1)
        };
    end
};
