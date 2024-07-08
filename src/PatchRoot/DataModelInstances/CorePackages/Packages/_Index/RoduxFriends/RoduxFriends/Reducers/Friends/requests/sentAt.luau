local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Rodux);
local _ = require(l_Parent_0.roduxFriendsTypes);
local l_Actions_0 = l_Parent_0.Actions;
local v5 = require(l_Actions_0.FriendRequestCreated);
local v6 = require(l_Actions_0.FriendRequestDeclined);
local v7 = require(l_Actions_0.FriendshipCreated);
local v8 = require(l_Parent_0.Reducers.Friends.utils.removeIdsFromRequestsStore);
local v9 = require(l_Parent_1.llama);
local v10 = {};
return function(v11)
    local l_friendsNetworking_0 = v11.friendsNetworking;
    return v2.createReducer(v10, {
        [l_friendsNetworking_0.AcceptFriendRequestFromUserId.Succeeded.name] = function(v13, v14)
            return v8(v13, v14.ids);
        end, 
        [l_friendsNetworking_0.DeclineFriendRequestFromUserId.Succeeded.name] = function(v15, v16)
            return v8(v15, v16.ids);
        end, 
        [l_friendsNetworking_0.GetFriendRequests.Succeeded.name] = function(v17, v18)
            local l_data_0 = v18.responseBody.data;
            local v20 = {};
            for _, v22 in pairs(l_data_0) do
                v20[tostring(v22.id)] = DateTime.fromIsoDate(v22.friendRequest.sentAt);
            end;
            return v9.Dictionary.join(v17, v20);
        end, 
        [v5.name] = function(v23, v24)
            return v9.Dictionary.join(v23, {
                [tostring(v24.requesteeId)] = DateTime.fromIsoDate(v24.sentAt)
            });
        end, 
        [v6.name] = function(v25, v26)
            return v8(v25, v26.ids);
        end, 
        [v7.name] = function(v27, v28)
            return v8(v27, {
                v28.payload.userId1, 
                v28.payload.userId2
            });
        end, 
        [l_friendsNetworking_0.DeclineAllFriendRequests.Succeeded.name] = function()
            return v10;
        end
    });
end;
