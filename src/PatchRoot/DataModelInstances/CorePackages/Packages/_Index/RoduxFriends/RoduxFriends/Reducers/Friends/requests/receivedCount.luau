local l_script_FirstAncestor_0 = script:FindFirstAncestor("RoduxFriends");
local v1 = require(l_script_FirstAncestor_0.Parent.Rodux);
local v2 = require(l_script_FirstAncestor_0.Actions.RequestReceivedCountUpdated);
return function(v3)
    return v1.createReducer(0, {
        [v2.name] = function(_, v5)
            assert(type(v5.payload.count) == "number", "Expected count to be a number");
            return v5.payload.count;
        end, 
        [v3.friendsNetworking.GetFriendRequestsCount.Succeeded.name] = function(_, v7)
            return v7.responseBody.count;
        end
    });
end;
