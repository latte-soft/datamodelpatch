local v0 = require(script:FindFirstAncestor("RoduxFriends").Parent.llama);
return function(v1, v2)
    return v0.List.removeValue(v1 or {}, v2);
end;
