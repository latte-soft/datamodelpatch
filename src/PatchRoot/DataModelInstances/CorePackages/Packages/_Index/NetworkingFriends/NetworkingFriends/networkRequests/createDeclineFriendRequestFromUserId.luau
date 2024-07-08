local v0 = require(script.Parent.Parent.FRIENDS_URL);
local _ = require(script.Parent.Parent.networkingFriendsTypes);
return function(v2)
    return v2.roduxNetworking.POST({
        Name = "DeclineFriendRequesterUserId"
    }, function(v3, v4)
        return v3(v0, {
            currentUserId = v4.currentUserId
        }):path("v1"):path("users"):id(v4.targetUserId):path("decline-friend-request"):body({});
    end);
end;
