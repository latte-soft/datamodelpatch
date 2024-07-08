local v0 = require(script.Parent.Parent.FRIENDS_URL);
local _ = require(script.Parent.Parent.networkingFriendsTypes);
return function(v2)
    return v2.roduxNetworking.GET({
        Name = "GetFriendRequests"
    }, function(v3, v4)
        return v3(v0, {
            currentUserId = v4.currentUserId
        }):path("v1"):path("my"):path("friends"):path("requests"):queryArgs({
            fetchMutualFriends = v4.fetchMutualFriends, 
            sortOrder = v4.sortOrder, 
            limit = v4.limit, 
            cursor = v4.cursor
        });
    end);
end;
