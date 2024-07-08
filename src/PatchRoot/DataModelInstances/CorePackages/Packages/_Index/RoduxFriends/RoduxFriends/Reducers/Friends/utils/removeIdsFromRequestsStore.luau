local v0 = require(script:FindFirstAncestor("RoduxFriends").Parent.llama);
return function(v1, v2)
    local v3 = {};
    for _, v5 in pairs(v2) do
        v3[v5] = v0.None;
    end;
    return v0.Dictionary.join(v1, v3);
end;
