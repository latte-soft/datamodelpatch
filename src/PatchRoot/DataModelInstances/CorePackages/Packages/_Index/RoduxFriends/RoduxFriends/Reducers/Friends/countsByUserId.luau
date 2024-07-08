local l_script_FirstAncestor_0 = script:FindFirstAncestor("RoduxFriends");
local v1 = require(l_script_FirstAncestor_0.Parent.llama);
local l_Actions_0 = l_script_FirstAncestor_0.Actions;
local v3 = require(l_Actions_0.FriendshipCreated);
local v4 = require(l_Actions_0.FriendshipDestroyed);
local v5 = require(script.Parent.utils.addUser);
local v6 = require(script.Parent.utils.removeUser);
local v7 = require(script.Parent.utils.setFriendshipsInStore);
local v8 = require(script.Parent.utils.removeTargetUserFriendshipInStore);
local v9 = require(script.Parent.utils.countUserFriendsInStore);
local v10 = {
    byUserId = {}, 
    countsByUserId = {}
};
return function(v11)
    local l_friendsNetworking_0 = v11.friendsNetworking;
    return function(v13, v14)
        local v15 = v13 or v10;
        if v14 and v14.type == v3.name then
            assert(type(v14.payload.userId1) == "string", "Expected userId1 to be a string");
            assert(type(v14.payload.userId2) == "string", "Expected userId2 to be a string");
            return v1.Dictionary.join(v15.countsByUserId, {
                [v14.payload.userId1] = #v5(v15.byUserId[v14.payload.userId1], v14.payload.userId2), 
                [v14.payload.userId2] = #v5(v15.byUserId[v14.payload.userId2], v14.payload.userId1)
            });
        elseif v14 and v14.type == v4.name then
            assert(type(v14.payload.userId1) == "string", "Expected userId1 to be a string");
            assert(type(v14.payload.userId2) == "string", "Expected userId2 to be a string");
            return v1.Dictionary.join(v15.countsByUserId, {
                [v14.payload.userId1] = #v6(v15.byUserId[v14.payload.userId1], v14.payload.userId2), 
                [v14.payload.userId2] = #v6(v15.byUserId[v14.payload.userId2], v14.payload.userId1)
            });
        elseif v14 and v14.type == l_friendsNetworking_0.GetFriendsFromUserId.Succeeded.name then
            return v9((v7(v15.byUserId, v14)));
        elseif v14 and v14.type == l_friendsNetworking_0.UnfriendTargetUserId.Succeeded.name then
            return v9((v8(v13.byUserId, v14)));
        else
            return v15.countsByUserId;
        end;
    end;
end;
