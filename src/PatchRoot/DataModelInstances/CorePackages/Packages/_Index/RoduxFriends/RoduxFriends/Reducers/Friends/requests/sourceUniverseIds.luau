local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Rodux);
local l_Actions_0 = l_Parent_0.Actions;
local v4 = require(l_Actions_0.FriendRequestCreated);
local v5 = require(l_Actions_0.FriendRequestDeclined);
local _ = require(l_Parent_0.roduxFriendsTypes);
local v7 = require(l_Parent_0.Reducers.Friends.utils.removeIdsFromRequestsStore);
local v8 = require(l_Parent_1.llama);
local v9 = {};
return function(v10)
    local l_friendsNetworking_0 = v10.friendsNetworking;
    return v2.createReducer(v9, {
        [l_friendsNetworking_0.AcceptFriendRequestFromUserId.Succeeded.name] = function(v12, v13)
            return v7(v12, v13.ids);
        end, 
        [l_friendsNetworking_0.DeclineFriendRequestFromUserId.Succeeded.name] = function(v14, v15)
            return v7(v14, v15.ids);
        end, 
        [l_friendsNetworking_0.GetFriendRequests.Succeeded.name] = function(v16, v17)
            local l_data_0 = v17.responseBody.data;
            local v19 = {};
            for _, v21 in pairs(l_data_0) do
                v19[tostring(v21.id)] = v21.friendRequest.sourceUniverseId;
            end;
            return (v8.Dictionary.join(v16, v19));
        end, 
        [v4.name] = function(v22, v23)
            return v8.Dictionary.join(v22, {
                [tostring(v23.requesteeId)] = v23.sourceUniverseId
            });
        end, 
        [v5.name] = function(v24, v25)
            return v7(v24, v25.ids);
        end, 
        [l_friendsNetworking_0.DeclineAllFriendRequests.Succeeded.name] = function()
            return {};
        end
    });
end;
