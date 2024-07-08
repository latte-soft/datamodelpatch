local _ = require(script.Parent.networkingFriendsTypes);
local l_networkRequests_0 = script.Parent.networkRequests;
local v2 = require(l_networkRequests_0.createGetFriendsFromUserId);
local v3 = require(l_networkRequests_0.createFindFriendsFromUserId);
local v4 = require(l_networkRequests_0.createSearchFriendsByQuery);
local v5 = require(l_networkRequests_0.createGetFriendRequestsCount);
local v6 = require(l_networkRequests_0.createUnfriendTargetUserId);
local v7 = require(l_networkRequests_0.createGetFriendRequests);
local v8 = require(l_networkRequests_0.createAcceptFriendRequestFromUserId);
local v9 = require(l_networkRequests_0.createDeclineFriendRequestFromUserId);
local v10 = require(l_networkRequests_0.createDeclineAllFriendRequests);
local v11 = require(l_networkRequests_0.createGetFriendsCountFromUserId);
local v12 = require(l_networkRequests_0.createGetInactiveFriends);
local v13 = require(l_networkRequests_0.createRequestFriendshipFromUserId);
local v14 = require(l_networkRequests_0.createRequestFriendshipFromContactId);
local v15 = require(l_networkRequests_0.createGetFollowingExists);
local v16 = require(l_networkRequests_0.createGetUserFollowers);
local v17 = require(l_networkRequests_0.createGetFriendRecommendationsFromUserId);
local v18 = require(l_networkRequests_0.createGetFriendshipStatus);
local v19 = require(l_networkRequests_0.createGetExtendedFriendshipStatus);
local v20 = require(l_networkRequests_0.createAcceptFriendRequestWithToken);
local v21 = require(l_networkRequests_0.createGetFollowersCount);
local v22 = require(l_networkRequests_0.createGetFollowingsCount);
return function(v23)
    return {
        GetFriendsFromUserId = v2(v23), 
        FindFriendsFromUserId = v3(v23), 
        SearchFriendsByQuery = v4(v23), 
        GetFriendRequestsCount = v5(v23), 
        UnfriendTargetUserId = v6(v23), 
        GetFriendRequests = v7(v23), 
        AcceptFriendRequestFromUserId = v8(v23), 
        DeclineFriendRequestFromUserId = v9(v23), 
        DeclineAllFriendRequests = v10(v23), 
        GetFriendsCountFromUserId = v11(v23), 
        GetInactiveFriends = v12(v23), 
        RequestFriendshipFromUserId = v13(v23), 
        RequestFriendshipFromContactId = v14(v23), 
        GetFollowingExists = v15(v23), 
        GetUserFollowers = v16(v23), 
        GetFriendRecommendationsFromUserId = v17(v23), 
        GetFriendshipStatus = v18(v23), 
        GetExtendedFriendshipStatus = v19(v23), 
        AcceptFriendRequestWithToken = v20(v23), 
        GetFollowersCount = v21(v23), 
        GetFollowingsCount = v22(v23)
    };
end;
