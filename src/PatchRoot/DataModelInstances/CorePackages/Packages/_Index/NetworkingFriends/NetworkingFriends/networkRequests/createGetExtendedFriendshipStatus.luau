local v0 = require(script.Parent.Parent.FRIENDS_URL);
local _ = require(script.Parent.Parent.networkingFriendsTypes);
return function(v2)
    return v2.roduxNetworking.GET({
        Name = "GetExtendedFriendshipStatus"
    }, function(v3, v4)
        return v3(v0):path("v1"):path("my"):path("friends"):id(v4.targetUserId):path("status");
    end);
end;
