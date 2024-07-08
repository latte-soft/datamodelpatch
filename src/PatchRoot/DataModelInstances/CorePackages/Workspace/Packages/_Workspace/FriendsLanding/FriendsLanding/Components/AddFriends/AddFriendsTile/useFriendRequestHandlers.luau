local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local v1 = require(l_script_FirstAncestor_0.AddFriends.dependencies);
local v2 = require(l_script_FirstAncestor_0.Parent.React);
local v3 = require(script.Parent.getFriendRequestHandlersExtraProps);
local l_FriendshipOriginSourceType_0 = v1.NetworkingFriendsEnums.FriendshipOriginSourceType;
local v5 = require(l_script_FirstAncestor_0.Flags.FFlagAddPYMKToConsoleAddFriends);
return function(v6)
    local v7 = v2.useMemo(function()
        return v3(v6);
    end, {
        v6.position, 
        v6.playerId, 
        v6.isFriendRequest, 
        v6.rank
    });
    local v8 = v2.useCallback(function()
        return v6.handleAcceptFriendRequest(v6.networking, v6.playerId, v7);
    end, {
        v6.networking, 
        v7, 
        v6.handleAcceptFriendRequest, 
        v6.playerId
    });
    local v9 = v2.useCallback(function()
        return v6.handleDeclineFriendRequest(v6.networking, v6.playerId, v7);
    end, {
        v6.networking, 
        v7, 
        v6.handleDeclineFriendRequest, 
        v6.playerId
    });
    local v10 = nil;
    local v11 = nil;
    if v5 then
        v10 = if not not v7 and v7.isRecommendation then l_FriendshipOriginSourceType_0.FriendRecommendations.rawValue() else nil;
        v11 = v2.useCallback(function()
            return v6.handleRequestFriendship(v6.networking, v6.playerId, v10, v7);
        end, {
            v6.networking, 
            v7, 
            v6.handleRequestFriendship, 
            v6.playerId
        });
    end;
    return {
        acceptFriendRequest = v8, 
        declineFriendRequest = v9, 
        requestFriendship = if not v5 then nil else v11
    };
end;
