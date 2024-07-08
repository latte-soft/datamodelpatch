local l_script_FirstAncestor_0 = script:FindFirstAncestor("UserSearch");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Apollo.ProfilesInsightsQuery);
local _ = require(l_script_FirstAncestor_0.Common.LocalTypes);
local _ = require(l_Parent_0.ApolloClient);
local _ = require(l_Parent_0.GraphQLServer);
local function v7(v6)
    return {
        __typename = "ProfileInsights", 
        targetUserId = v6, 
        isOfflineFrequents = true, 
        mutualFriends = {}
    };
end;
local function v9(v8)
    return {
        __typename = "ProfileInsights", 
        targetUserId = v8, 
        isOfflineFrequents = true, 
        mutualFriends = {
            {
                __typename = "MutualFriend", 
                id = "234", 
                username = "mockedUsername", 
                displayName = "mockedDisplayName"
            }
        }
    };
end;
local v10 = v2.createPageId("test");
return {
    mockProfileInsight = v7, 
    mockProfileInsightWithMutualFriends = v9, 
    twoEntries = {
        users = {
            {
                id = "111"
            }, 
            {
                id = "222"
            }
        }, 
        userIds = {
            "111", 
            "222"
        }, 
        searchKeyword = "test", 
        pageId = v10, 
        response = {
            userInsights = {
                {
                    targetUser = "111", 
                    profileInsights = {
                        {
                            mutualFriendInsight = {}, 
                            offlineFrequentsInsight = {
                                havePlayedTogether = true
                            }
                        }
                    }
                }, 
                {
                    targetUser = "222", 
                    profileInsights = {
                        {
                            mutualFriendInsight = {}, 
                            offlineFrequentsInsight = {
                                havePlayedTogether = true
                            }
                        }
                    }
                }
            }
        }, 
        query = {
            variables = {
                userIds = {
                    "111", 
                    "222"
                }, 
                pageId = v10
            }, 
            query = v2.query, 
            data = {
                profilesInsights = {
                    __typename = "ProfileInsightsPages", 
                    id = v10, 
                    profileInsights = {
                        {
                            __typename = "ProfileInsights", 
                            targetUserId = "111", 
                            isOfflineFrequents = true, 
                            mutualFriends = {}
                        }, 
                        {
                            __typename = "ProfileInsights", 
                            targetUserId = "222", 
                            isOfflineFrequents = true, 
                            mutualFriends = {}
                        }
                    }
                }
            }
        }, 
        usersMore = {
            {
                id = "111"
            }, 
            {
                id = "222"
            }, 
            {
                id = "333"
            }, 
            {
                id = "444"
            }
        }, 
        queryMore = {
            variables = {
                userIds = {
                    "333", 
                    "444"
                }, 
                pageId = v10
            }, 
            query = v2.query, 
            data = {
                profilesInsights = {
                    __typename = "ProfileInsightsPages", 
                    id = v10, 
                    profileInsights = {
                        {
                            __typename = "ProfileInsights", 
                            targetUserId = "333", 
                            isOfflineFrequents = true, 
                            mutualFriends = {}
                        }, 
                        {
                            __typename = "ProfileInsights", 
                            targetUserId = "444", 
                            isOfflineFrequents = true, 
                            mutualFriends = {}
                        }
                    }
                }
            }
        }, 
        userIdsMore = {
            "333", 
            "444"
        }
    }
};
