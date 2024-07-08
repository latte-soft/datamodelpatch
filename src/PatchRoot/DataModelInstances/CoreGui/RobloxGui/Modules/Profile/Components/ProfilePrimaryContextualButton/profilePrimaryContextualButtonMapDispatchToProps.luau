local v0 = require(script.Parent.Parent.Parent.dependencies);
local l_NetworkingFriends_0 = v0.NetworkingFriends;
local l_NetworkingBlocking_0 = v0.NetworkingBlocking;
local l_RoduxContacts_0 = v0.RoduxContacts;
return function(v4)
    return {
        unfriendUser = function(v5, v6)
            return v4(l_NetworkingFriends_0.UnfriendTargetUserId.API({
                targetUserId = v6, 
                currentUserId = v5
            }));
        end, 
        sendFriendshipRequest = function(v7, v8, v9)
            return v4(l_NetworkingFriends_0.RequestFriendshipFromUserId.API({
                targetUserId = v8, 
                currentUserId = v7, 
                friendshipOriginSourceType = v9
            }));
        end, 
        acceptFriendshipRequest = function(v10, v11)
            return v4(l_NetworkingFriends_0.AcceptFriendRequestFromUserId.API({
                targetUserId = v11, 
                currentUserId = v10
            }));
        end, 
        acceptOffNetworkFriendshipRequest = function(v12)
            return v4(l_NetworkingFriends_0.AcceptFriendRequestWithToken.API({
                targetUserId = v12.profileUserId, 
                currentUserId = v12.localUserId, 
                friendingToken = v12.token
            }));
        end, 
        unblockUser = function(v13)
            return v4(l_NetworkingBlocking_0.UnblockUserById.API({
                userId = v13.targetUserId, 
                currentUserId = v13.currentUserId
            })):andThen(function()
                return v4(l_NetworkingFriends_0.GetExtendedFriendshipStatus.API({
                    targetUserId = v13.targetUserId
                }));
            end);
        end, 
        sendContactFriendshipRequest = function(v14)
            v4(l_RoduxContacts_0.Actions.RequestSent({
                id = v14.contactId
            }));
            return v4(l_NetworkingFriends_0.RequestFriendshipFromContactId.API(v14));
        end
    };
end;
