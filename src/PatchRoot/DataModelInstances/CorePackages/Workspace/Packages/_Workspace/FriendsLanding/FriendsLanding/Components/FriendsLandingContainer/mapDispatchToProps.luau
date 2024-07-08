local l_FriendsNetworking_0 = require(script:FindFirstAncestor("FriendsLanding").dependencies).FriendsNetworking;
return function(v1)
    return {
        fetchFriends = function(v2)
            return v1(l_FriendsNetworking_0.GetFriendsFromUserId.API(v2));
        end, 
        getFriendRequestsCount = function()
            return v1(l_FriendsNetworking_0.GetFriendRequestsCount.API());
        end, 
        getInactiveFriends = function(v3)
            return v1(l_FriendsNetworking_0.GetInactiveFriends.API(v3));
        end, 
        unfriendTargetUser = function(v4)
            return v1(l_FriendsNetworking_0.UnfriendTargetUserId.API(v4));
        end
    };
end;
