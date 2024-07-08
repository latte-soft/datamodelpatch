local v0 = require(script:FindFirstAncestor("FriendsLanding").dependencies);
local l_llama_0 = v0.llama;
return v0.Rodux.createReducer({}, {
    [v0.FriendsNetworking.GetFollowingExists.Succeeded.name] = function(v2, v3)
        local v4 = {};
        l_llama_0.List.every(v3.responseBody.followings, function(v5)
            v4[tostring(v5.userId)] = {
                isFollowing = v5.isFollowing, 
                isFollowed = v5.isFollowed
            };
            return true;
        end);
        return l_llama_0.Dictionary.join(v2, v4);
    end
});
