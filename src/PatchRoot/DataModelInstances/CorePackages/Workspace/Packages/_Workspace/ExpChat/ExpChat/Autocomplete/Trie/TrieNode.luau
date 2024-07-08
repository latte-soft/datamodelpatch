local v0 = {};
v0.__index = v0;
v0.new = function(v1)
    local v2 = {};
    setmetatable(v2, v0);
    v2.children = {};
    v2.isEndOfWord = false;
    v2.data = v1;
    return v2;
end;
return v0;
