local v0 = require(script.Parent.Parent.FRIENDS_URL);
local _ = require(script.Parent.Parent.networkingFriendsTypes);
return function(v2)
    return v2.roduxNetworking.POST({
        Name = "DeclineAllFriendRequests"
    }, function(v3, v4)
        return v3(v0, {
            currentUserId = v4.currentUserId
        }):path("v1"):path("user"):path("friend-requests"):path("decline-all"):body({});
    end);
end;
