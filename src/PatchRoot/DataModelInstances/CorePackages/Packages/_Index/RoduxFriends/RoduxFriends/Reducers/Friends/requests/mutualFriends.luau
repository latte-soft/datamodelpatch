local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Rodux);
local l_Actions_0 = l_Parent_0.Actions;
local v4 = require(l_Actions_0.FriendRequestCreated);
local v5 = require(l_Actions_0.FriendRequestDeclined);
local v6 = require(l_Parent_0.Reducers.Friends.utils.removeIdsFromRequestsStore);
local _ = require(l_Parent_0.roduxFriendsTypes);
local v8 = require(l_Parent_1.llama);
local v9 = {};
return function(v10)
    local l_friendsNetworking_0 = v10.friendsNetworking;
    return v2.createReducer(v9, {
        [l_friendsNetworking_0.AcceptFriendRequestFromUserId.Succeeded.name] = function(v12, v13)
            return v6(v12, v13.ids);
        end, 
        [l_friendsNetworking_0.DeclineFriendRequestFromUserId.Succeeded.name] = function(v14, v15)
            return v6(v14, v15.ids);
        end, 
        [l_friendsNetworking_0.GetFriendRequests.Succeeded.name] = function(v16, v17)
            local l_data_0 = v17.responseBody.data;
            local v19 = {};
            for _, v21 in pairs(l_data_0) do
                if v21.mutualFriendsList then
                    v19[tostring(v21.id)] = v8.List.map(v21.mutualFriendsList, function(v22)
                        return (tostring(v22));
                    end);
                end;
            end;
            return (v8.Dictionary.join(v16, v19));
        end, 
        [v4.name] = function(v23, v24)
            return v8.Dictionary.join(v23, {
                [tostring(v24.requesteeId)] = v8.List.map(v24.mutualFriends, function(v25)
                    return (tostring(v25));
                end)
            });
        end, 
        [v5.name] = function(v26, v27)
            return v6(v26, v27.ids);
        end, 
        [l_friendsNetworking_0.DeclineAllFriendRequests.Succeeded.name] = function()
            return {};
        end
    });
end;
