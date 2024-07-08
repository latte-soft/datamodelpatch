local v0 = {
    OmniRecommendationsContentType = {
        Game = "Game", 
        CatalogAsset = "CatalogAsset", 
        CatalogBundle = "CatalogBundle", 
        RecommendedFriend = "RecommendedFriend", 
        GameCoPlay = "GameCoPlay"
    }, 
    OmniRecommendationsPageType = {
        PAGE_TYPE_INVALID = "", 
        PAGE_TYPE_HOME = "Home", 
        PAGE_TYPE_GAMES = "Games"
    }
};
local v1 = {
    GenreExplorer = "GenreExplorerLabel", 
    Carousel = "Carousel", 
    AvatarCarousel = "AvatarCarousel", 
    UserInfo = "UserInfo", 
    FriendCarousel = "FriendCarousel", 
    FriendRecommendationCarousel = "FriendRecommendationCarousel", 
    HomeGameGrid = "SortlessGrid"
};
mockEndpointResponse = function(v2)
    local v3 = {
        rootPlaceId = "10395446", 
        universeId = "149757", 
        name = "test", 
        totalUpVotes = 10970, 
        totalDownVotes = 2564, 
        playerCount = 5, 
        under9 = true, 
        under13 = false, 
        friendActivityTitle = "Friend Activity", 
        minimumAge = 0, 
        ageRecommendationDisplayName = "All Ages"
    };
    return {
        contentMetadata = {
            [v0.OmniRecommendationsContentType.Game] = {
                [v3.universeId] = v3
            }, 
            [v0.OmniRecommendationsContentType.CatalogAsset] = {}, 
            [v0.OmniRecommendationsContentType.CatalogBundle] = {}, 
            [v0.OmniRecommendationsContentType.RecommendedFriend] = {}
        }, 
        sorts = {
            {
                topic = v2 or "topic123", 
                topicId = 100000003, 
                recommendationList = {
                    {
                        contentType = v0.OmniRecommendationsContentType.Game, 
                        contentId = v3.universeId, 
                        contentMetadata = {
                            Score = "10"
                        }
                    }
                }, 
                treatmentType = v1.Carousel
            }
        }, 
        pageType = v0.OmniRecommendationsPageType.PAGE_TYPE_HOME, 
        requestId = "123avcd3-1431-35bd-24db-452abcde65abf35", 
        nextPageToken = "eyJzdGFydCI6MTAsImNvdW50IjoxMCwiZW5kT2ZQYWdlIjpmYWxzZX0=", 
        isSessionExpired = false
    };
end;
return mockEndpointResponse;
