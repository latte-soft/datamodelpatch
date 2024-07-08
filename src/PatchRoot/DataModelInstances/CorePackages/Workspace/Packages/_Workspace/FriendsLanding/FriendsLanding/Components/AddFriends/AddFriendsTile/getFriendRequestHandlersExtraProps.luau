local v0 = require(script:FindFirstAncestor("FriendsLanding").Common.Constants);
return function(v1)
    return {
        absolutePosition = v1.position, 
        requestedId = v1.playerId, 
        isRecommendation = not v1.isFriendRequest, 
        recommendationRank = if v1.isFriendRequest then nil else v1.rank, 
        source = if v1.isFriendRequest then nil else v0.AddFriendsPYMKSourceName, 
        contextType = v1.contextType
    };
end;
