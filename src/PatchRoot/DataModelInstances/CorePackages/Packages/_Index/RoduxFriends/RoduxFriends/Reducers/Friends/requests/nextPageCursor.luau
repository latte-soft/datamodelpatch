local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Parent.Rodux);
local _ = require(l_Parent_0.roduxFriendsTypes);
return function(v3)
    local l_friendsNetworking_0 = v3.friendsNetworking;
    return v1.createReducer(nil, {
        [l_friendsNetworking_0.GetFriendRequests.Succeeded.name] = function(_, v6)
            return v6.responseBody.nextPageCursor;
        end, 
        [l_friendsNetworking_0.DeclineAllFriendRequests.Succeeded.name] = function(_, _)
            return nil;
        end
    });
end;
