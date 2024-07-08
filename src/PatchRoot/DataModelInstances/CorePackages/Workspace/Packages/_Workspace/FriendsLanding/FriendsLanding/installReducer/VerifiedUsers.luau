local v0 = require(script:FindFirstAncestor("FriendsLanding").dependencies);
local l_Rodux_0 = v0.Rodux;
local l_llama_0 = v0.llama;
local l_FriendsNetworking_0 = v0.FriendsNetworking;
local v4 = {};
local function v10(v5, v6)
    local v7 = {};
    for _, v9 in ipairs(v6) do
        v7[tostring(v9.id)] = not not v9.hasVerifiedBadge or l_llama_0.None;
    end;
    return l_llama_0.Dictionary.join(v5, v7);
end;
return l_Rodux_0.createReducer(v4, {
    [l_FriendsNetworking_0.GetFriendsFromUserId.Succeeded.name] = function(v11, v12)
        return v10(v11, v12.responseBody.data);
    end
});
