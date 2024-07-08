local v0 = require(script:FindFirstAncestor("FriendsLanding").dependencies);
local l_getDeepValue_0 = v0.SocialLibraries.Dictionary.getDeepValue;
local l_FriendsNetworking_0 = v0.FriendsNetworking;
return function(v3)
    local v4 = l_getDeepValue_0(v3, string.format("FriendsLanding.Friends.byUserId.%s", v3.LocalUserId));
    return {
        localUserId = v3.LocalUserId, 
        screenSize = v3.ScreenSize, 
        inactiveFriendsNetworkRequestStatus = l_FriendsNetworking_0.GetInactiveFriends.getStatus(v3, v3.LocalUserId), 
        friendRequestCount = l_getDeepValue_0(v3, "FriendsLanding.Friends.requests.receivedCount") or 0, 
        totalFriendCount = not not v4 and #v4 or 0
    };
end;
