local v0 = require(script:FindFirstAncestor("FriendsLanding").dependencies);
local l_Rodux_0 = v0.Rodux;
local l_FriendsNetworking_0 = v0.FriendsNetworking;
local l_llama_0 = v0.llama;
return l_Rodux_0.createReducer({}, {
    [l_FriendsNetworking_0.GetFriendsFromUserId.Succeeded.name] = function(_, v5)
        return l_llama_0.Dictionary.map(v5.responseBody.data, function(v6)
            return v6.isDeleted, (tostring(v6.id));
        end);
    end
});
