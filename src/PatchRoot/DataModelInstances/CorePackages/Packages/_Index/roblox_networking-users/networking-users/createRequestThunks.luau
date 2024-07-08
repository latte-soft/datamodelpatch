local l_networkRequests_0 = script.Parent.networkRequests;
local v1 = require(l_networkRequests_0.createGetSkinnyUsersFromUserIds);
local v2 = require(l_networkRequests_0.createGetUsernameHistoryFromUserId);
local v3 = require(l_networkRequests_0.createGetUserV2FromUserId);
return function(v4)
    return {
        GetSkinnyUsersFromUserIds = v1(v4), 
        GetUsernameHistoryFromUserId = v2(v4), 
        GetUserV2FromUserId = v3(v4)
    };
end;
