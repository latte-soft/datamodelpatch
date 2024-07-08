local v0 = require(script:FindFirstAncestor("FriendsLanding").AddFriends.dependencies);
local l_llama_0 = v0.llama;
local l_t_0 = v0.t;
return function(v3)
    assert(l_t_0.table(v3));
    return l_llama_0.List.sort(v3, function(v4, v5)
        return (v4.order or 9999999) < (v5.order or 9999999);
    end);
end;
