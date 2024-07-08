local v0 = require(script:FindFirstAncestor("RoduxSquads").Parent.t);
local v1 = {};
v1.new = function(v2)
    assert(v1.isValid(v2));
    v1.__index = v1;
    setmetatable(v2, v1);
    return v2;
end;
v1.mock = function(v3)
    v3 = v3 or {};
    return (v1.new({
        userId = v3.userId or 1234, 
        rank = v3.rank or 0
    }));
end;
v1.format = function(v4)
    return (v1.new({
        userId = v4.userId, 
        rank = v4.rank
    }));
end;
v1.isValid = v0.strictInterface({
    userId = v0.number, 
    rank = v0.number
});
return v1;
