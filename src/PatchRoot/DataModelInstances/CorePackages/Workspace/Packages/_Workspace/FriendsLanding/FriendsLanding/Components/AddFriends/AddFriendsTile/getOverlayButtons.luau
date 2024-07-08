local v0 = require(script:FindFirstAncestor("FriendsLanding").AddFriends.dependencies);
local l_t_0 = v0.t;
local l_Images_0 = v0.UIBlox.App.ImageSet.Images;
local l_FriendshipOriginSourceType_0 = v0.NetworkingFriendsEnums.FriendshipOriginSourceType;
local v4 = require(script.Parent.getFriendRequestHandlersExtraProps);
local v5 = l_t_0.strictInterface({
    playerId = l_t_0.string, 
    isFriendRequest = l_t_0.boolean, 
    hasIncomingFriendRequest = l_t_0.optional(l_t_0.boolean), 
    friendStatus = l_t_0.optional(l_t_0.enum(Enum.FriendStatus)), 
    networking = l_t_0.optional(l_t_0.callback), 
    handleRequestFriendship = l_t_0.optional(l_t_0.callback), 
    handleAcceptFriendRequest = l_t_0.optional(l_t_0.callback), 
    handleDeclineFriendRequest = l_t_0.optional(l_t_0.callback), 
    position = l_t_0.optional(l_t_0.integer), 
    rank = l_t_0.optional(l_t_0.integer), 
    contextType = l_t_0.optional(l_t_0.string)
});
return function(v6)
    assert(v5(v6));
    local v7 = {};
    local v8 = v4(v6);
    if not v6.isFriendRequest then
        local v9 = v6.friendStatus or Enum.FriendStatus.NotFriend;
        if not v6.hasIncomingFriendRequest then
            if v9 == Enum.FriendStatus.NotFriend then
                local v10 = nil;
                if v8.isRecommendation then
                    v10 = l_FriendshipOriginSourceType_0.FriendRecommendations.rawValue();
                end;
                table.insert(v7, {
                    icon = l_Images_0["icons/actions/friends/friendAdd"], 
                    isSecondary = false, 
                    onActivated = function()
                        v6.handleRequestFriendship(v6.networking, v6.playerId, v10, v8);
                    end
                });
                return v7;
            elseif v9 == Enum.FriendStatus.FriendRequestSent then
                table.insert(v7, {
                    icon = l_Images_0["icons/actions/friends/friendpending"], 
                    isSecondary = false, 
                    isDisabled = true, 
                    onActivated = function()
                    end
                });
            end;
        else
            table.insert(v7, {
                icon = l_Images_0["icons/actions/friends/friendAdd"], 
                isSecondary = false, 
                onActivated = function()
                    v6.handleAcceptFriendRequest(v6.networking, v6.playerId, v8);
                end
            });
            return v7;
        end;
    elseif (v6.friendStatus or Enum.FriendStatus.FriendRequestReceived) == Enum.FriendStatus.FriendRequestReceived then
        table.insert(v7, {
            icon = l_Images_0["icons/actions/reject"], 
            isSecondary = true, 
            onActivated = function()
                v6.handleDeclineFriendRequest(v6.networking, v6.playerId, v8);
            end
        });
        table.insert(v7, {
            icon = l_Images_0["icons/actions/friends/friendAdd"], 
            isSecondary = false, 
            onActivated = function()
                v6.handleAcceptFriendRequest(v6.networking, v6.playerId, v8);
            end
        });
        return v7;
    end;
    return v7;
end;
