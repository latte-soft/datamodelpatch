local l_RoduxFriends_0 = require(script:FindFirstAncestor("FriendsLanding").dependencies).RoduxFriends;
local v1 = require(script.Parent.convertActions);
local v2 = require(script.Parent.friendsActionAdaptor);
local v3 = {
    countsByUserId = {}, 
    byUserId = {}, 
    requests = {
        receivedCount = 0
    }
};
return function(v4)
    return v1(l_RoduxFriends_0.installReducer(), v2(v4), v3);
end;
