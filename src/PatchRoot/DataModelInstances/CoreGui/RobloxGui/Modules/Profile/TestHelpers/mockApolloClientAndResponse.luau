local v0 = require(script:FindFirstAncestor("Profile").dependencies);
local l_mockApolloClient_0 = v0.GraphQLServer.ApolloClientTestUtils.mockApolloClient;
local l_UserProfiles_0 = v0.UserProfiles;
local l_queries_0 = v0.ApolloLocalState.queries;
local v4 = require(script.Parent.generateMutualFriendsList);
return function(v5, v6)
    local v7 = v5 or l_mockApolloClient_0({});
    local v8 = v4(v6.mutualFriendsCount);
    if not v6.skipRealNamesMock then
        l_UserProfiles_0.TestUtils.writeProfileDataToCache(v7, {
            ["1"] = {
                combinedName = "1_displayName"
            }, 
            ["2"] = {
                combinedName = "2_displayName"
            }, 
            ["3"] = {
                combinedName = "3_displayName"
            }
        });
    end;
    if not v6.skipMutualFriendsMock then
        v7:writeQuery({
            variables = {
                userIds = {
                    "123"
                }
            }, 
            query = l_queries_0.profilesInsightsByUserIds, 
            data = {
                profilesInsightsByUserIds = {
                    {
                        __typename = "ProfileInsights", 
                        targetUserId = "123", 
                        isOfflineFrequents = false, 
                        mutualFriends = v8
                    }
                }
            }
        });
    end;
    return v7;
end;
