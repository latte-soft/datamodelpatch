local v0 = require(script:FindFirstAncestor("Profile").dependencies);
local l_Rodux_0 = v0.Rodux;
local l_Dash_0 = v0.Dash;
local l_NetworkingFriends_0 = v0.NetworkingFriends;
local l_NetworkingBlocking_0 = v0.NetworkingBlocking;
local function _(v5)
    if v5 == "NotFriends" then
        return Enum.FriendStatus.NotFriend;
    elseif v5 == "Friends" then
        return Enum.FriendStatus.Friend;
    elseif v5 == "RequestSent" then
        return Enum.FriendStatus.FriendRequestSent;
    elseif v5 == "RequestReceived" then
        return Enum.FriendStatus.FriendRequestReceived;
    else
        return Enum.FriendStatus.Unknown;
    end;
end;
return l_Rodux_0.createReducer({}, {
    [l_NetworkingFriends_0.GetFriendshipStatus.Succeeded.name] = function(v7, v8)
        local v9 = tostring(v8.responseBody.data[1].id);
        local l_join_0 = l_Dash_0.join;
        local l_v7_0 = v7;
        local v12 = {};
        local l_status_0 = v8.responseBody.data[1].status;
        v12[v9] = if l_status_0 == "NotFriends" then Enum.FriendStatus.NotFriend else if l_status_0 == "Friends" then Enum.FriendStatus.Friend else if l_status_0 == "RequestSent" then Enum.FriendStatus.FriendRequestSent else if l_status_0 == "RequestReceived" then Enum.FriendStatus.FriendRequestReceived else Enum.FriendStatus.Unknown;
        return l_join_0(l_v7_0, v12);
    end, 
    [l_NetworkingFriends_0.GetExtendedFriendshipStatus.Succeeded.name] = function(v14, v15)
        local v16 = tostring(v15.ids[1]);
        local l_join_1 = l_Dash_0.join;
        local l_v14_0 = v14;
        local v19 = {};
        local l_status_1 = v15.responseBody.status;
        v19[v16] = if l_status_1 == "NotFriends" then Enum.FriendStatus.NotFriend else if l_status_1 == "Friends" then Enum.FriendStatus.Friend else if l_status_1 == "RequestSent" then Enum.FriendStatus.FriendRequestSent else if l_status_1 == "RequestReceived" then Enum.FriendStatus.FriendRequestReceived else Enum.FriendStatus.Unknown;
        return l_join_1(l_v14_0, v19);
    end, 
    [l_NetworkingFriends_0.UnfriendTargetUserId.Succeeded.name] = function(v21, v22)
        return l_Dash_0.join(v21, {
            [tostring(v22.namedIds.users)] = Enum.FriendStatus.NotFriend
        });
    end, 
    [l_NetworkingFriends_0.DeclineFriendRequestFromUserId.Succeeded.name] = function(v23, v24)
        return l_Dash_0.join(v23, {
            [tostring(v24.namedIds.users)] = Enum.FriendStatus.NotFriend
        });
    end, 
    [l_NetworkingFriends_0.AcceptFriendRequestFromUserId.Succeeded.name] = function(v25, v26)
        return l_Dash_0.join(v25, {
            [tostring(v26.namedIds.users)] = Enum.FriendStatus.Friend
        });
    end, 
    [l_NetworkingFriends_0.AcceptFriendRequestWithToken.Succeeded.name] = function(v27, v28)
        return l_Dash_0.join(v27, {
            [tostring(v28.namedIds.users)] = Enum.FriendStatus.Friend
        });
    end, 
    [l_NetworkingFriends_0.RequestFriendshipFromUserId.Succeeded.name] = function(v29, v30)
        return l_Dash_0.join(v29, {
            [tostring(v30.namedIds.users)] = Enum.FriendStatus.FriendRequestSent
        });
    end, 
    [l_NetworkingBlocking_0.BlockUserById.Succeeded.name] = function(v31, v32)
        return l_Dash_0.join(v31, {
            [tostring(v32.namedIds.users)] = Enum.FriendStatus.NotFriend
        });
    end
});
