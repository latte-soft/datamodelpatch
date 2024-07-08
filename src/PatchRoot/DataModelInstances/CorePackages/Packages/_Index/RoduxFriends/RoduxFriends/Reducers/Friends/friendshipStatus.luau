local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Rodux);
local v3 = require(l_Parent_1.llama);
local l_Actions_0 = l_Parent_0.Actions;
local v5 = require(l_Actions_0.FriendshipCreated);
local v6 = require(l_Actions_0.FriendshipDestroyed);
local v7 = require(l_Actions_0.FriendRequestCreated);
local v8 = require(l_Actions_0.FriendRequestDeclined);
local _ = require(l_Parent_0.roduxFriendsTypes);
local v10 = {};
local function _(v11)
    if v11 == "NotFriends" then
        return Enum.FriendStatus.NotFriend;
    elseif v11 == "Friends" then
        return Enum.FriendStatus.Friend;
    elseif v11 == "RequestSent" then
        return Enum.FriendStatus.FriendRequestSent;
    elseif v11 == "RequestReceived" then
        return Enum.FriendStatus.FriendRequestReceived;
    else
        return Enum.FriendStatus.Unknown;
    end;
end;
local function v24(v13, v14)
    local v15 = {};
    for _, v17 in pairs(v13) do
        v15[v17] = true;
    end;
    for _, v19 in pairs(v14) do
        v15[v19] = nil;
    end;
    local v20 = {};
    local v21 = 0;
    for _, v23 in pairs(v13) do
        if v15[v23] then
            v21 = v21 + 1;
            v20[v21] = v23;
        end;
    end;
    return v20;
end;
return function(v25)
    local l_friendsNetworking_0 = v25.friendsNetworking;
    return v2.createReducer(v10, {
        [l_friendsNetworking_0.GetFriendshipStatus.Succeeded.name] = function(v27, v28)
            local v29 = {};
            for _, v31 in pairs(v28.responseBody.data) do
                local v32 = tostring(v31.id);
                local l_status_0 = v31.status;
                v29[v32] = if l_status_0 == "NotFriends" then Enum.FriendStatus.NotFriend else if l_status_0 == "Friends" then Enum.FriendStatus.Friend else if l_status_0 == "RequestSent" then Enum.FriendStatus.FriendRequestSent else if l_status_0 == "RequestReceived" then Enum.FriendStatus.FriendRequestReceived else Enum.FriendStatus.Unknown;
            end;
            return v3.Dictionary.join(v27, v29);
        end, 
        [l_friendsNetworking_0.GetExtendedFriendshipStatus.Succeeded.name] = function(v34, v35)
            local v36 = tostring(v35.ids[1]);
            local l_join_0 = v3.Dictionary.join;
            local l_v34_0 = v34;
            local v39 = {};
            local l_status_1 = v35.responseBody.status;
            v39[v36] = if l_status_1 == "NotFriends" then Enum.FriendStatus.NotFriend else if l_status_1 == "Friends" then Enum.FriendStatus.Friend else if l_status_1 == "RequestSent" then Enum.FriendStatus.FriendRequestSent else if l_status_1 == "RequestReceived" then Enum.FriendStatus.FriendRequestReceived else Enum.FriendStatus.Unknown;
            return l_join_0(l_v34_0, v39);
        end, 
        [l_friendsNetworking_0.GetFriendsFromUserId.Succeeded.name] = function(v41, v42)
            local v44 = v3.Dictionary.keys(v3.Dictionary.filter(v41, function(v43)
                return v43 == Enum.FriendStatus.Friend;
            end));
            local v46 = v3.List.map(v3.Dictionary.values(v42.responseBody.data), function(v45)
                return (tostring(v45.id));
            end);
            local v47 = v24(v46, v44);
            local v48 = v24(v44, v46);
            for _, v50 in pairs(v47) do
                v41 = v3.Dictionary.join(v41, {
                    [v50] = Enum.FriendStatus.Friend
                });
            end;
            for _, v52 in pairs(v48) do
                v41 = v3.Dictionary.join(v41, {
                    [v52] = Enum.FriendStatus.Unknown
                });
            end;
            return v41;
        end, 
        [l_friendsNetworking_0.UnfriendTargetUserId.Succeeded.name] = function(v53, v54)
            return v3.Dictionary.join(v53, {
                [tostring(v54.namedIds.users)] = Enum.FriendStatus.NotFriend
            });
        end, 
        [l_friendsNetworking_0.AcceptFriendRequestFromUserId.Succeeded.name] = function(v55, v56)
            return v3.Dictionary.join(v55, {
                [tostring(v56.ids[1])] = Enum.FriendStatus.Friend
            });
        end, 
        [l_friendsNetworking_0.DeclineFriendRequestFromUserId.Succeeded.name] = function(v57, v58)
            local l_ids_0 = v58.ids;
            local v60 = {};
            for _, v62 in pairs(l_ids_0) do
                v60[tostring(v62)] = Enum.FriendStatus.NotFriend;
            end;
            return v3.Dictionary.join(v57, v60);
        end, 
        [l_friendsNetworking_0.GetFriendRequests.Succeeded.name] = function(v63, v64)
            local l_data_0 = v64.responseBody.data;
            local v66 = {};
            for _, v68 in pairs(l_data_0) do
                v66[tostring(v68.id)] = Enum.FriendStatus.FriendRequestReceived;
            end;
            return v3.Dictionary.join(v63, v66);
        end, 
        [l_friendsNetworking_0.DeclineAllFriendRequests.Succeeded.name] = function(v69)
            local v70 = {};
            for v71, v72 in pairs(v69) do
                if v72 == Enum.FriendStatus.FriendRequestReceived then
                    v70[tostring(v71)] = Enum.FriendStatus.NotFriend;
                end;
            end;
            return v3.Dictionary.join(v69, v70);
        end, 
        [l_friendsNetworking_0.RequestFriendshipFromUserId.Succeeded.name] = function(v73, v74)
            return v3.Dictionary.join(v73, {
                [tostring(v74.namedIds.users)] = Enum.FriendStatus.FriendRequestSent
            });
        end, 
        [l_friendsNetworking_0.RequestFriendshipFromContactId.Succeeded.name] = function(v75, v76)
            return v3.Dictionary.join(v75, {
                [tostring(v76.namedIds.contacts)] = Enum.FriendStatus.FriendRequestSent
            });
        end, 
        [v6.name] = function(v77, v78)
            return v3.Dictionary.join(v77, {
                [tostring(v78.payload.userId1)] = Enum.FriendStatus.NotFriend
            });
        end, 
        [v5.name] = function(v79, v80)
            return v3.Dictionary.join(v79, {
                [tostring(v80.payload.userId1)] = Enum.FriendStatus.Friend
            });
        end, 
        [v7.name] = function(v81, v82)
            return v3.Dictionary.join(v81, {
                [tostring(v82.requesteeId)] = Enum.FriendStatus.FriendRequestReceived
            });
        end, 
        [v8.name] = function(v83, v84)
            local l_ids_1 = v84.ids;
            local v86 = {};
            for _, v88 in pairs(l_ids_1) do
                v86[tostring(v88)] = Enum.FriendStatus.NotFriend;
            end;
            return v3.Dictionary.join(v83, v86);
        end
    });
end;
