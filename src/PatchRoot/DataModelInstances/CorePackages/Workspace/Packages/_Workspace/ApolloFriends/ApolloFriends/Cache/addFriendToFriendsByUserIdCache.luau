local l_Parent_0 = script:FindFirstAncestor("ApolloFriends").Parent;
local v1 = require(l_Parent_0.Cryo);
local l_utils_0 = require(l_Parent_0.ApolloLocalState).typePolicies.utils;
local v3 = require(script.Parent.createFriendInCache);
return function(v4, v5)
    local v6 = v3(v4, {
        userId = v5.userId, 
        targetUserId = v5.targetUserId, 
        hasVerifiedBadge = v5.hasVerifiedBadge
    });
    v4.cache:modify({
        id = v4.cache:identify({
            __typename = "AllFriendsPage"
        }), 
        fields = {
            allFriendsByUserId = function(_, v8, _)
                if v8.targetUserId == v5.targetUserId then
                    return (v1.Dictionary.join(v8, {
                        friends = l_utils_0.mergeListsWithoutDuplicates(v8.friends, {
                            v6
                        }, "__ref")
                    }));
                else
                    return v8;
                end;
            end
        }
    });
end;
