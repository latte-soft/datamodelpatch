local l_Parent_0 = script:FindFirstAncestor("ApolloLocalState").Parent;
local _ = require(l_Parent_0.ApolloClient);
local v2 = require(l_Parent_0.Cryo);
local v3 = require(script.Parent.utils.mergeListsWithoutDuplicates);
return {
    fields = {
        omniFeedItem = {
            read = if not require(l_Parent_0.SharedFlags).GetFFlagApolloClientFetchThumbnails() then nil else function(_, _, v6)
                return v6:toReference({
                    __typename = "OmniFeedItem", 
                    topicId = v6.args.sortId
                });
            end
        }, 
        profilesInsightsByUserIds = {
            read = function(_, _, v9)
                local v10 = {};
                for _, v12 in pairs(v9.args.userIds) do
                    local v13 = v9:toReference({
                        __typename = "ProfileInsights", 
                        targetUserId = v12
                    });
                    table.insert(v10, v13);
                    if not v9:canRead(v13) then
                        return nil;
                    end;
                end;
                return v10;
            end
        }, 
        userProfiles = {
            read = function(_, _, v16)
                local v17 = {};
                for _, v19 in v16.args.userIds, nil, nil do
                    local v20 = v16:toReference({
                        __typename = "UserProfile", 
                        id = v19
                    });
                    table.insert(v17, v20);
                    if not v16:canRead(v20) then
                        return nil;
                    end;
                end;
                return v17;
            end
        }, 
        allFriendsByUserId = if not require(l_Parent_0.SharedFlags).FFlagApolloClientAllFriendsQueryPolicy then nil else {
            keyArgs = {
                "userId", 
                "sort"
            }, 
            merge = function(_, v22, v23)
                if v22 then
                    if v22.nextCursor == v23.curCursor then
                        return v2.Dictionary.join(v23, {
                            friends = v3(v22 and v22.friends, v23 and v23.friends, "__ref")
                        });
                    else
                        return v22;
                    end;
                else
                    return v23;
                end;
            end
        }, 
        onlineFriendsByUserId = if not require(l_Parent_0.SharedFlags).FFlagApolloClientOnlineFriendsQueryPolicy then nil else {
            keyArgs = {
                "userId", 
                "sort"
            }, 
            read = function(_, v25, v26)
                if v25 then
                    return (v2.List.filter(v25, function(v27)
                        local v28 = v26:readField("userPresenceType", (v26:readField("presence", v27)));
                        return v28 and v28 ~= "Offline";
                    end));
                else
                    return v25;
                end;
            end
        }
    }
};
