local v0 = require(script.Parent.Parent.FRIENDS_URL);
local _ = require(script.Parent.Parent.networkingFriendsTypes);
return function(v2)
    return v2.roduxNetworking.GET({
        Name = "GetFriendsFromUserId"
    }, function(v3, v4, v5)
        return v3(v0):path("v1"):path("users"):id(v4):path("friends"):queryArgs({
            userSort = not not v5 and v5.userSort or nil
        });
    end);
end;
