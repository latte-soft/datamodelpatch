local v0 = require(script:FindFirstAncestor("Profile").dependencies);
local l_Rodux_0 = v0.Rodux;
local l_Dash_0 = v0.Dash;
return l_Rodux_0.createReducer({}, {
    [v0.NetworkingFriends.GetFollowingExists.Succeeded.name] = function(v3, v4)
        local v5 = {};
        l_Dash_0.forEach(v4.responseBody.followings, function(v6)
            v5[tostring(v6.userId)] = {
                isFollowed = v6.isFollowed, 
                isFollowing = v6.isFollowing
            };
        end);
        return l_Dash_0.join(v3, v5);
    end, 
    [v0.NetworkingBlocking.BlockUserById.Succeeded.name] = function(v7, v8)
        return l_Dash_0.join(v7, {
            [tostring(v8.namedIds.users)] = {
                isFollowed = false, 
                isFollowing = false
            }
        });
    end
});
