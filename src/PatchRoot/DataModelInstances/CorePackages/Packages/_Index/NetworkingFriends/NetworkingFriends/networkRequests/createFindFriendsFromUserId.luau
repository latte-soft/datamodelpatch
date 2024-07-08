local v0 = require(script.Parent.Parent.FRIENDS_URL);
local _ = require(script.Parent.Parent.networkingFriendsTypes);
return function(v2)
    return v2.roduxNetworking.GET({
        Name = "FindFriendsFromUserId"
    }, function(v3, v4, v5)
        return v3(v0):path("v1"):path("users"):id(v4):path("friends"):path("find"):queryArgs({
            userSort = if not v5 then nil else v5.userSort, 
            cursor = if not v5 then nil else v5.cursor, 
            limit = if not v5 then nil else v5.limit
        });
    end);
end;
