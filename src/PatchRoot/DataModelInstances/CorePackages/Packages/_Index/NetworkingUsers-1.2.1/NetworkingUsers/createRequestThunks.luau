local l_networkRequests_0 = script.Parent.networkRequests;
local v1 = require(l_networkRequests_0.createGetSkinnyUsersFromUserIds);
local v2 = require(l_networkRequests_0.createGetUsernameHistoryFromUserId);
local v3 = require(l_networkRequests_0.createGetUserV2FromUserId);
local v4 = require(l_networkRequests_0.createGetDisplayNameValidation);
local v5 = require(l_networkRequests_0.createSetDisplayName);
local v6 = require(l_networkRequests_0.createSetDescription);
return function(v7)
    return {
        GetSkinnyUsersFromUserIds = v1(v7), 
        GetUsernameHistoryFromUserId = v2(v7), 
        GetUserV2FromUserId = v3(v7), 
        GetDisplayNameValidation = v4(v7), 
        SetDisplayName = v5(v7), 
        SetDescription = v6(v7)
    };
end;
