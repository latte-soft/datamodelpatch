local v0 = require(script.Parent.Parent.FRIENDS_URL);
local _ = require(script.Parent.Parent.networkingFriendsTypes);
return function(v2)
    return v2.roduxNetworking.GET({
        Name = "GetLuobuFriendRequests"
    }, function(v3, v4)
        return v3(v0):path("v1"):path("my"):path("luobu-friends"):path("requests"):queryArgs({
            userOpenId = v4.userOpenId, 
            userAccessToken = v4.userAccessToken, 
            type = v4.type, 
            appType = v4.appType, 
            sortOrder = v4.sortOrder, 
            limit = v4.limit, 
            cursor = v4.cursor
        });
    end);
end;
