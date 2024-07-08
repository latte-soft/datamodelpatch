local l_script_FirstAncestor_0 = script:FindFirstAncestor("PYMKCarousel");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_Dash_0 = v1.Dash;
local l_RoduxFriends_0 = v1.RoduxFriends;
local l_RoduxUsers_0 = v1.RoduxUsers;
local l_SocialCommon_0 = v1.SocialCommon;
local l_Recommendation_0 = l_RoduxFriends_0.Models.Recommendation;
local l_RecommendationContextType_0 = l_RoduxFriends_0.Enums.RecommendationContextType;
local l_User_0 = l_RoduxUsers_0.Models.User;
local l_RecommendationSourceEnum_0 = l_SocialCommon_0.Enums.RecommendationSourceEnum;
local l_RECOMMENDATION_SESSION_ID_KEY_0 = require(l_script_FirstAncestor_0.Common.Constants).RECOMMENDATION_SESSION_ID_KEY;
local l_HomepagePYMKCarousel_0 = l_RecommendationSourceEnum_0.HomepagePYMKCarousel;
local v12 = {
    longName = "1_longName", 
    noContext = "2_noContext", 
    mutualContextPlural = "3_mutualContextPlural", 
    mutualContextSingle = "4_mutualContextSingle", 
    mutualContextNone = "5_mutualContextNone", 
    frequentContext = "6_frequentContext", 
    pendingFriendRequest = "7_pendingFriendRequest", 
    incomingFriendRequest = "8_incomingFriendRequest"
};
return {
    recommendationIds = v12, 
    state = {
        LocalUserId = "123456", 
        PYMKCarousel = {
            NetworkStatus = {}, 
            Users = {
                byUserId = {
                    [v12.longName] = l_User_0.mock({
                        displayName = "Very Long Display Name"
                    }), 
                    [v12.noContext] = l_User_0.mock(), 
                    [v12.mutualContextPlural] = l_User_0.mock(), 
                    [v12.mutualContextSingle] = l_User_0.mock(), 
                    [v12.mutualContextNone] = l_User_0.mock(), 
                    [v12.frequentContext] = l_User_0.mock(), 
                    [v12.pendingFriendRequest] = l_User_0.mock(), 
                    [v12.incomingFriendRequest] = l_User_0.mock()
                }
            }, 
            Friends = {
                recommendations = {
                    bySource = {
                        [l_HomepagePYMKCarousel_0] = {
                            [v12.longName] = true, 
                            [v12.noContext] = true, 
                            [v12.mutualContextPlural] = true, 
                            [v12.mutualContextSingle] = true, 
                            [v12.mutualContextNone] = true, 
                            [v12.frequentContext] = true, 
                            [v12.pendingFriendRequest] = true, 
                            [v12.incomingFriendRequest] = true
                        }
                    }, 
                    byUserId = {
                        ["123456"] = {
                            [v12.longName] = l_Recommendation_0.mock({
                                id = v12.longName, 
                                rank = 5
                            }), 
                            [v12.noContext] = l_Recommendation_0.mock({
                                id = v12.noContext, 
                                contextType = l_RecommendationContextType_0.None, 
                                rank = 6
                            }), 
                            [v12.mutualContextPlural] = l_Recommendation_0.mock({
                                id = v12.mutualContextPlural, 
                                contextType = l_RecommendationContextType_0.MutualFriends, 
                                mutualFriendsList = {
                                    "111", 
                                    "222", 
                                    "333"
                                }, 
                                rank = 10
                            }), 
                            [v12.mutualContextSingle] = l_Recommendation_0.mock({
                                id = v12.mutualContextSingle, 
                                contextType = l_RecommendationContextType_0.MutualFriends, 
                                mutualFriendsList = {
                                    "111"
                                }, 
                                rank = 12
                            }), 
                            [v12.mutualContextNone] = l_Recommendation_0.mock({
                                id = v12.mutualContextNone, 
                                contextType = l_RecommendationContextType_0.MutualFriends, 
                                mutualFriendsList = {}, 
                                rank = 1
                            }), 
                            [v12.frequentContext] = l_Recommendation_0.mock({
                                id = v12.frequentContext, 
                                contextType = l_RecommendationContextType_0.Frequents, 
                                mutualFriendsList = {}, 
                                rank = 0
                            }), 
                            [v12.pendingFriendRequest] = l_Recommendation_0.mock({
                                id = v12.pendingFriendRequest, 
                                rank = 70
                            }), 
                            [v12.incomingFriendRequest] = l_Recommendation_0.mock({
                                id = v12.incomingFriendRequest, 
                                rank = 71
                            })
                        }
                    }, 
                    hasIncomingFriendRequest = {
                        [v12.incomingFriendRequest] = true
                    }
                }, 
                friendshipStatus = {
                    [v12.pendingFriendRequest] = Enum.FriendStatus.FriendRequestSent
                }
            }, 
            Analytics = {
                bySessionKey = {
                    [l_RECOMMENDATION_SESSION_ID_KEY_0] = "mockedRecommendationSessionId"
                }
            }
        }
    }, 
    recommendationIdsList = l_Dash_0.map(l_Dash_0.values(v12), function(v13)
        return {
            id = v13
        };
    end)
};
