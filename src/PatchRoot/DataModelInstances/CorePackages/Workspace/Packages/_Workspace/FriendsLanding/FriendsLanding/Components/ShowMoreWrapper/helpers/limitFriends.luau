local v0 = require(script:FindFirstAncestor("FriendsLanding").dependencies);
local l_llama_0 = v0.llama;
local l_t_0 = v0.t;
return function(v3, v4)
    assert(l_t_0.table(v4));
    assert(l_t_0.number(v3));
    return l_llama_0.List.filter(v4, function(_, v6)
        return v6 <= v3;
    end);
end;
