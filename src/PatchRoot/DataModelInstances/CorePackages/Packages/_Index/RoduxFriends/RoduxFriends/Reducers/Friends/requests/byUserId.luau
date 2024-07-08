local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Rodux);
local l_Actions_0 = l_Parent_0.Actions;
local v4 = require(l_Actions_0.FriendRequestCreated);
local v5 = require(l_Actions_0.FriendRequestDeclined);
local v6 = require(l_Actions_0.FriendshipCreated);
local v7 = require(l_Parent_0.Reducers.Friends.utils.removeIdsFromRequestsStore);
local _ = require(l_Parent_0.roduxFriendsTypes);
local v9 = require(l_Parent_1.llama);
local v10 = {};
return function(v11)
    local l_friendsNetworking_0 = v11.friendsNetworking;
    return v2.createReducer(v10, {
        [l_friendsNetworking_0.AcceptFriendRequestFromUserId.Succeeded.name] = function(v13, v14)
            return v7(v13, v14.ids);
        end, 
        [l_friendsNetworking_0.DeclineFriendRequestFromUserId.Succeeded.name] = function(v15, v16)
            return v7(v15, v16.ids);
        end, 
        [l_friendsNetworking_0.GetFriendRequests.Succeeded.name] = function(v17, v18)
            local l_data_0 = v18.responseBody.data;
            local v20 = {};
            for _, v22 in pairs(l_data_0) do
                v20[tostring(v22.id)] = true;
            end;
            return (v9.Dictionary.join(v17, v20));
        end, 
        [v4.name] = function(v23, v24)
            return v9.Dictionary.join(v23, {
                [tostring(v24.requesteeId)] = true
            });
        end, 
        [v5.name] = function(v25, v26)
            return v7(v25, v26.ids);
        end, 
        [v6.name] = function(v27, v28)
            assert(type(v28.payload.userId1) == "string", "Expected userId1 to be a string");
            assert(type(v28.payload.userId2) == "string", "Expected userId2 to be a string");
            return v7(v27, {
                v28.payload.userId1, 
                v28.payload.userId2
            });
        end, 
        [l_friendsNetworking_0.DeclineAllFriendRequests.Succeeded.name] = function()
            return {};
        end
    });
end;
