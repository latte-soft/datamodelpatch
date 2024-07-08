local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Rodux);
local v3 = require(l_Parent_1.llama);
local l_Actions_0 = l_Parent_0.Actions;
local v5 = require(l_Actions_0.RecommendationCreated);
local v6 = require(l_Actions_0.FriendRequestDeclined);
local _ = require(l_Parent_0.roduxFriendsTypes);
local v8 = {};
return function(v9)
    local l_friendsNetworking_0 = v9.friendsNetworking;
    return v2.createReducer(v8, {
        [v5.name] = function(v11, v12)
            local l_recommendedUser_0 = v12.payload.recommendedUser;
            return v3.Dictionary.join(v11, {
                [tostring(l_recommendedUser_0.id)] = not not l_recommendedUser_0.hasIncomingFriendRequest or false
            });
        end, 
        [l_friendsNetworking_0.GetFriendRecommendationsFromUserId.Succeeded.name] = function(v14, v15)
            return v3.Dictionary.join(v14, (v3.List.reduce(v3.List.filter(v15.responseBody.data, function(v16)
                return v16.contextType ~= "Contacts";
            end, {}), function(v17, v18)
                v17[tostring(v18.id)] = not not v18.friendRequest or false;
                return v17;
            end, {})));
        end, 
        [l_friendsNetworking_0.DeclineFriendRequestFromUserId.Succeeded.name] = function(v19, v20)
            return v3.Dictionary.join(v19, (v3.List.reduce(v20.ids, function(v21, v22)
                v21[tostring(v22)] = false;
                return v21;
            end, {})));
        end, 
        [v6.name] = function(v23, v24)
            return v3.Dictionary.join(v23, (v3.List.reduce(v24.ids, function(v25, v26)
                v25[tostring(v26)] = false;
                return v25;
            end, {})));
        end, 
        [l_friendsNetworking_0.DeclineAllFriendRequests.Succeeded.name] = function(_)
            return v8;
        end
    });
end;
