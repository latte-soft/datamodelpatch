local l_networkRequests_0 = script.Parent.networkRequests;
local v1 = require(l_networkRequests_0.createGetBlockedUsers);
local v2 = require(l_networkRequests_0.createBlockUserById);
local v3 = require(l_networkRequests_0.createUnblockUserById);
return function(v4)
    return {
        GetBlockedUsers = v1(v4), 
        BlockUserById = v2(v4), 
        UnblockUserById = v3(v4)
    };
end;
