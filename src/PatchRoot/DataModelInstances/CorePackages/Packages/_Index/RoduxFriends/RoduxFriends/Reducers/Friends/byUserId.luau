local l_script_FirstAncestor_0 = script:FindFirstAncestor("RoduxFriends");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Rodux);
local v3 = require(l_Parent_0.llama);
local l_Actions_0 = l_script_FirstAncestor_0.Actions;
local v5 = require(l_Actions_0.FriendshipCreated);
local v6 = require(l_Actions_0.FriendshipDestroyed);
local v7 = require(script.Parent.utils.addUser);
local v8 = require(script.Parent.utils.removeUser);
local v9 = require(script.Parent.utils.setFriendshipsInStore);
local v10 = require(script.Parent.utils.removeTargetUserFriendshipInStore);
local v11 = {};
return function(v12)
    local l_friendsNetworking_0 = v12.friendsNetworking;
    return v2.createReducer(v11, {
        [v5.name] = function(v14, v15)
            assert(type(v15.payload.userId1) == "string", "Expected userId1 to be a string");
            assert(type(v15.payload.userId2) == "string", "Expected userId2 to be a string");
            return v3.Dictionary.join(v14, {
                [v15.payload.userId1] = v7(v14[v15.payload.userId1], v15.payload.userId2), 
                [v15.payload.userId2] = v7(v14[v15.payload.userId2], v15.payload.userId1)
            });
        end, 
        [v6.name] = function(v16, v17)
            assert(type(v17.payload.userId1) == "string", "Expected userId1 to be a string");
            assert(type(v17.payload.userId2) == "string", "Expected userId2 to be a string");
            return v3.Dictionary.join(v16, {
                [v17.payload.userId1] = v8(v16[v17.payload.userId1], v17.payload.userId2), 
                [v17.payload.userId2] = v8(v16[v17.payload.userId2], v17.payload.userId1)
            });
        end, 
        [l_friendsNetworking_0.GetFriendsFromUserId.Succeeded.name] = function(v18, v19)
            return v9(v18, v19);
        end, 
        [l_friendsNetworking_0.UnfriendTargetUserId.Succeeded.name] = function(v20, v21)
            return v10(v20, v21);
        end, 
        [l_friendsNetworking_0.AcceptFriendRequestFromUserId.Succeeded.name] = function(v22, v23)
            local v24 = tostring(v23.ids[1]);
            local v25 = tostring(v23.additionalData.currentUserId);
            return v3.Dictionary.join(v22, {
                [v24] = v7(v22[v24], v25), 
                [v25] = v7(v22[v25], v24)
            });
        end
    });
end;
