local v0 = require(script:FindFirstAncestor("FriendsLanding").dependencies);
local l_Rodux_0 = v0.Rodux;
local l_FriendsNetworking_0 = v0.FriendsNetworking;
local l_llama_0 = v0.llama;
local l_getDeepValue_0 = v0.SocialLibraries.Dictionary.getDeepValue;
return l_Rodux_0.createReducer({}, {
    [l_FriendsNetworking_0.GetFriendRequests.Succeeded.name] = function(_, v6)
        return (l_llama_0.Dictionary.map(v6.responseBody.data, function(v7)
            return l_getDeepValue_0(v7, "friendRequest.originSourceType") or "", (tostring(v7.id));
        end));
    end
});
