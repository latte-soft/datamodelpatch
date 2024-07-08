local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Rodux);
local v3 = require(l_Parent_1.llama);
local _ = require(l_Parent_0.roduxFriendsTypes);
local v5 = require(l_Parent_0.Actions.FriendRequestCreated);
local v6 = {};
return function(v7)
    return v2.createReducer(v6, {
        [v7.friendsNetworking.GetFriendRequests.Succeeded.name] = function(v8, v9)
            local l_data_0 = v9.responseBody.data;
            local v11 = {};
            for _, v13 in pairs(l_data_0) do
                v11[tostring(v13.id)] = v13.friendRequest.contactName;
            end;
            return v3.Dictionary.join(v8, v11);
        end, 
        [v5.name] = function(v14, v15)
            return v3.Dictionary.join(v14, {
                [tostring(v15.requesteeId)] = v15.contactName
            });
        end
    });
end;
