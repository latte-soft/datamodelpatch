local l_script_FirstAncestor_0 = script:FindFirstAncestor("PYMKCarousel");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_RecommendationContextType_0 = require(l_script_FirstAncestor_0.dependencies).RoduxFriends.Enums.RecommendationContextType;
local _ = require(l_script_FirstAncestor_0.Common.OmniTypes);
local v4 = require(l_script_FirstAncestor_0.Common.Constants);
local l_FFlagContactRecs_0 = require(l_Parent_0.SharedFlags).FFlagContactRecs;
local v6 = {
    topicId = "topicId3", 
    treatmentType = "FriendRecommendationCarousel", 
    topic = "", 
    recommendations = {
        [1] = {
            contentId = "RecommendedFriend1", 
            contentType = "RecommendedFriend", 
            contentMetadata = {
                rank = "10", 
                recommendationRequestId = "recommendationSessionId", 
                hasPendingFriendRequest = v4.BE_FALSE_VALUE
            }
        }, 
        [2] = {
            contentId = "RecommendedFriend2", 
            contentType = "RecommendedFriend", 
            contentMetadata = {
                rank = "5", 
                mutualFriendsCount = "5", 
                contextType = l_RecommendationContextType_0.MutualFriends.rawValue(), 
                recommendationRequestId = "recommendationSessionId", 
                hasPendingFriendRequest = v4.BE_TRUE_VALUE
            }
        }, 
        [3] = {
            contentId = "RecommendedFriend3", 
            contentType = "RecommendedFriend", 
            contentMetadata = {
                rank = "8", 
                contextType = l_RecommendationContextType_0.Frequents.rawValue(), 
                recommendationRequestId = "recommendationSessionId", 
                hasPendingFriendRequest = v4.BE_FALSE_VALUE
            }
        }
    }
};
if l_FFlagContactRecs_0 then
    table.insert(v6.recommendations, {
        contentStringId = "RecommendedFriend4", 
        contentId = "", 
        contentType = "RecommendedFriend", 
        contentMetadata = {
            rank = "1", 
            contextType = l_RecommendationContextType_0.Contacts.rawValue(), 
            recommendationRequestId = "recommendationSessionId", 
            hasPendingFriendRequest = v4.BE_FALSE_VALUE
        }
    });
end;
local v7 = {
    RecommendedFriend1 = {
        userName = "userName1", 
        mutualFriendDisplayName = {}, 
        displayName = "displayName1", 
        userId = "RecommendedFriend1", 
        contextType = l_RecommendationContextType_0.Frequents.rawValue()
    }, 
    RecommendedFriend2 = {
        userName = "userName2", 
        mutualFriendDisplayName = {}, 
        displayName = "displayName2", 
        userId = "RecommendedFriend2", 
        contextType = l_RecommendationContextType_0.None.rawValue()
    }, 
    RecommendedFriend3 = {
        userName = "userName3", 
        mutualFriendDisplayName = {}, 
        displayName = "displayName3", 
        userId = "RecommendedFriend3", 
        contextType = "NotCorrect"
    }
};
if l_FFlagContactRecs_0 then
    v7.RecommendedFriend4 = {
        AvatarThumbnailUrl = "AvatarImageUrl", 
        ContactId = "ContactId", 
        ContactName = "ContactName", 
        HeadshotThumbnailUrl = "HeadshotImageUrl", 
        contextType = l_RecommendationContextType_0.Contacts.rawValue(), 
        mutualFriendDisplayName = {}, 
        userId = "0"
    };
end;
local v8 = {
    [1] = {
        topicId = "topicId1", 
        treatmentType = "Carousel", 
        topic = "TopicGames1", 
        recommendations = {
            [1] = {
                contentId = "Game1", 
                contentType = "Game", 
                contentMetadata = {}
            }, 
            [2] = {
                contentId = "Game2", 
                contentType = "Game", 
                contentMetadata = {}
            }
        }
    }, 
    [2] = {
        topicId = "topicId2", 
        treatmentType = "Carousel", 
        topic = "TopicGames2", 
        recommendations = {
            [1] = {
                contentId = "Game3", 
                contentType = "Game", 
                contentMetadata = {}
            }
        }
    }
};
local v9 = {
    Game1 = {
        universeId = "universeId1", 
        name = "name1", 
        totalUpVotes = 123, 
        totalDownVotes = 123, 
        placeId = "placeId1", 
        playerCount = 123
    }, 
    Game2 = {
        universeId = "universeId2", 
        name = "name2", 
        totalUpVotes = 123, 
        totalDownVotes = 123, 
        placeId = "placeId2", 
        playerCount = 123
    }, 
    Game3 = {
        universeId = "universeId3", 
        name = "name3", 
        totalUpVotes = 123, 
        totalDownVotes = 123, 
        placeId = "placeId3", 
        playerCount = 123
    }
};
return {
    withoutContent = {
        type = "AddOmniRecommendations", 
        recommendationsId = "recommendationsId", 
        pageType = "Home", 
        sortsExpirationTime = 2434324, 
        recommendations = {}
    }, 
    withRecommendedFriends = {
        type = "AddOmniRecommendations", 
        recommendationsId = "recommendationsId", 
        pageType = "Home", 
        sortsExpirationTime = 2434324, 
        recommendations = {
            Home = {
                omniSessionId = "omniSessionId1", 
                sorts = {
                    [1] = v8[1], 
                    [2] = v8[2], 
                    [3] = v6
                }, 
                metadata = {
                    CatalogAsset = {}, 
                    CatalogBundle = {}, 
                    RecommendedFriend = v7, 
                    Game = v9
                }
            }
        }
    }, 
    withoutRecommendedFriends = {
        type = "AddOmniRecommendations", 
        recommendationsId = "recommendationsId", 
        pageType = "Home", 
        sortsExpirationTime = 2434324, 
        recommendations = {
            Home = {
                omniSessionId = "omniSessionId1", 
                sorts = {
                    [1] = v8[1], 
                    [2] = v8[2]
                }, 
                metadata = {
                    CatalogAsset = {}, 
                    CatalogBundle = {}, 
                    RecommendedFriend = {}, 
                    Game = v9
                }
            }
        }
    }, 
    invalidRecommendedFriendsSort = {
        type = "AddOmniRecommendations", 
        recommendationsId = "recommendationsId", 
        pageType = "Home", 
        sortsExpirationTime = 2434324, 
        recommendations = {
            Home = {
                omniSessionId = "omniSessionId1", 
                sorts = {
                    [1] = v8[1], 
                    [2] = v8[2], 
                    [3] = {
                        topicId = "topicId3", 
                        treatmentType = "FriendRecommendationCarousel", 
                        topic = "", 
                        recommendations = nil
                    }
                }, 
                metadata = {
                    CatalogAsset = {}, 
                    CatalogBundle = {}, 
                    RecommendedFriend = {}, 
                    Game = v9
                }
            }
        }
    }, 
    recommendedFriendMetadata = v7, 
    recommendedFriendSort = v6
};
