local l_Parent_0 = script:FindFirstAncestor("ApolloProfileInsights").Parent;
local v1 = require(l_Parent_0.Cryo);
local v2 = require(l_Parent_0.ApolloLocalState);
local _ = require(l_Parent_0.ApolloClient);
local l_queries_0 = v2.queries;
return function(v5, v6, v7)
    local v8 = if not not v7 and v7.query then v7.query else l_queries_0.profilesInsightsByUserIds;
    for v9, v10 in v6, nil, nil do
        local v11 = v10.mutualFriends or {};
        local v12 = {};
        for v13, v14 in v11, nil, nil do
            table.insert(v12, v1.Dictionary.join({
                __typename = "MutualFriend", 
                id = v14.id or tostring(v13), 
                username = v14.username or "", 
                displayName = v14.displayName or ""
            }, v14));
        end;
        v5:writeQuery({
            variables = {
                userIds = v9
            }, 
            query = v8, 
            data = {
                profilesInsightsByUserIds = {
                    {
                        __typename = "ProfileInsights", 
                        targetUserId = v10.targetUserId or tostring(v9), 
                        isOfflineFrequents = v10.isOfflineFrequents or false, 
                        mutualFriends = v12
                    }
                }
            }
        });
    end;
end;
