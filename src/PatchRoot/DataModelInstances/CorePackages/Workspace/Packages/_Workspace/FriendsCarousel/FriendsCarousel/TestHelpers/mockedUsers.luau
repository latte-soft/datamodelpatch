local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsCarousel");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_PresenceType_0 = v1.RoduxPresence.Enums.PresenceType;
local l_RecommendationContextType_0 = v1.RoduxFriends.Enums.RecommendationContextType;
local _ = require(l_script_FirstAncestor_0.Common.LocalTypes);
local l_FFlagContactRecs_0 = require(l_script_FirstAncestor_0.Parent.SharedFlags).FFlagContactRecs;
local v6 = {
    friendOnline = {
        id = "2326285850", 
        username = "username", 
        displayName = "name", 
        userId = "friendOnline", 
        userPresenceType = l_PresenceType_0.Online, 
        isFriendWithUser = true, 
        hasPendingFriendRequest = false, 
        canSendFriendRequest = false
    }, 
    friendOffline = {
        id = "2326285850", 
        username = "username", 
        displayName = "friendOffline displayName", 
        userId = "friendOffline", 
        userPresenceType = l_PresenceType_0.Offline, 
        isFriendWithUser = true, 
        hasPendingFriendRequest = false, 
        canSendFriendRequest = false
    }, 
    friendInGame = {
        id = "2326285850", 
        username = "username", 
        displayName = "friendInGame displayName", 
        userId = "friendInGame", 
        lastOnline = "lastOnline", 
        lastLocation = "last Location very long name name name", 
        universeId = "universeId", 
        rootPlaceId = "rootPlaceId", 
        placeId = "placeId", 
        gameId = "gameId", 
        userPresenceType = l_PresenceType_0.InGame, 
        isFriendWithUser = true, 
        hasPendingFriendRequest = false, 
        canSendFriendRequest = false
    }, 
    friendInGameWithoutLocation = {
        id = "2326285850", 
        username = "username", 
        displayName = "friendInGameWithoutLocation displayName", 
        userId = "friendInGameWithoutLocation", 
        lastOnline = "lastOnline", 
        lastLocation = nil, 
        universeId = "universeId", 
        rootPlaceId = "rootPlaceId", 
        placeId = "placeId", 
        gameId = "gameId", 
        userPresenceType = l_PresenceType_0.InGame, 
        isFriendWithUser = true, 
        hasPendingFriendRequest = false, 
        canSendFriendRequest = false
    }, 
    friendInStudio = {
        id = "2326285850", 
        username = "username", 
        displayName = "friendInStudio displayName", 
        userId = "friendInStudio", 
        userPresenceType = l_PresenceType_0.InStudio, 
        isFriendWithUser = true, 
        hasPendingFriendRequest = false, 
        canSendFriendRequest = false, 
        lastLocation = "In Studio location"
    }, 
    recommendationMutual = {
        id = "2326285850", 
        username = "username", 
        displayName = "recommendationMutual displayName", 
        mutualFriendsList = {
            "1", 
            "2", 
            "3", 
            "4"
        }, 
        contextType = l_RecommendationContextType_0.MutualFriends, 
        rank = 1, 
        isFriendWithUser = false, 
        hasPendingFriendRequest = false, 
        canSendFriendRequest = true
    }, 
    recommendationMutualSingle = {
        id = "2326285850", 
        username = "username", 
        displayName = "recommendationMutual displayName", 
        mutualFriendsList = {
            "1"
        }, 
        contextType = l_RecommendationContextType_0.MutualFriends, 
        rank = 1, 
        isFriendWithUser = false, 
        hasPendingFriendRequest = false, 
        canSendFriendRequest = true
    }, 
    recommendationMutualNone = {
        id = "2326285850", 
        username = "username", 
        displayName = "recommendationMutualNone displayName", 
        mutualFriendsList = {}, 
        contextType = l_RecommendationContextType_0.MutualFriends, 
        rank = 1, 
        isFriendWithUser = false, 
        hasPendingFriendRequest = false, 
        canSendFriendRequest = true
    }, 
    recommendationNone = {
        id = "2326285850", 
        username = "username2", 
        displayName = "recommendationNone displayName", 
        mutualFriendsList = {}, 
        contextType = l_RecommendationContextType_0.None, 
        rank = 1, 
        isFriendWithUser = false, 
        hasPendingFriendRequest = false, 
        canSendFriendRequest = true
    }, 
    requestPending = {
        id = "2326285850", 
        username = "username", 
        displayName = "requestPending displayName", 
        mutualFriendsList = {
            "1"
        }, 
        contextType = l_RecommendationContextType_0.MutualFriends, 
        rank = 0, 
        isFriendWithUser = false, 
        hasPendingFriendRequest = true, 
        canSendFriendRequest = false
    }, 
    recommendationFrequent = {
        id = "2326285850", 
        username = "username", 
        displayName = "recommendationFrequent displayName", 
        mutualFriendsList = {}, 
        contextType = l_RecommendationContextType_0.Frequents, 
        rank = 1, 
        isFriendWithUser = false, 
        hasPendingFriendRequest = false, 
        canSendFriendRequest = true
    }, 
    recommendationIncomingFriendRequest = {
        id = "2326285850", 
        username = "username", 
        displayName = "recommendationIncomingFriendRequest displayName", 
        mutualFriendsList = {
            "1"
        }, 
        contextType = l_RecommendationContextType_0.MutualFriends, 
        rank = 1, 
        isFriendWithUser = false, 
        hasPendingFriendRequest = false, 
        canSendFriendRequest = false, 
        hasIncomingFriendRequest = true
    }, 
    recommendationPlatformName = {
        id = "123", 
        username = "username", 
        displayName = "recommendationPlatformName displayName", 
        mutualFriendsList = {
            "1"
        }, 
        contextType = l_RecommendationContextType_0.MutualFriends, 
        rank = 1, 
        isFriendWithUser = false, 
        hasPendingFriendRequest = false, 
        canSendFriendRequest = false, 
        hasIncomingFriendRequest = true
    }
};
if l_FFlagContactRecs_0 then
    v6.recommendationContactImporter = {
        id = "Entity Id", 
        entityId = "Entity Id", 
        contextType = not l_FFlagContactRecs_0 and "" or l_RecommendationContextType_0.Contacts, 
        entityDisplayName = "Display Name", 
        isFriendWithUser = false, 
        rank = 1, 
        thumbnailEntities = {
            avatarImageUrl = "avatarImageUrl", 
            headshotImageUrl = "headshotImageUrl"
        }
    };
end;
return v6;
