return function(v0)
    return {
        isFriendsWith = require(script.isFriendsWith)(v0), 
        getSortedByRankRecommendations = require(script.getSortedByRankRecommendations)(v0), 
        selectFriendshipStatusesByUserIds = require(script.selectFriendshipStatusesByUserIds)(v0), 
        getRecommendationIdsBySource = require(script.getRecommendationIdsBySource)(v0), 
        selectRecommendationsForUserId = require(script.selectRecommendationsForUserId)(v0), 
        getSortedByRankRecommendationIds = require(script.getSortedByRankRecommendationIds)(v0)
    };
end;
