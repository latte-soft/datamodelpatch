local v0 = require(script:FindFirstAncestor("Autocomplete").Trie.Trie);
local v1 = {};
v1.__index = v1;
v1.new = function(v2)
    local v3 = {};
    setmetatable(v3, v1);
    v3.trie = v0.new();
    v3.trie = v2(v3);
    return v3;
end;
v1.getResults = function(v4, v5, v6)
    local v7 = v4.trie:autocomplete(v5);
    if not v6 then
        return v7;
    else
        return v6(v7);
    end;
end;
return v1;
