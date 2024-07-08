local l_Parent_0 = script.Parent;
local l_networkRequests_0 = l_Parent_0.networkRequests;
local v2 = require(l_networkRequests_0.createUploadContactsByUser);
local v3 = require(l_networkRequests_0.createFindContactFriends);
local v4 = require(l_networkRequests_0.createGetContactEntitiesByContactId);
local _ = require(l_Parent_0.Types.networkRequestsTypes);
return function(v6)
    return {
        UploadContactsByUser = v2(v6), 
        FindContactFriends = v3(v6), 
        GetContactEntitiesByContactId = v4(v6)
    };
end;
