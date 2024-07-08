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
        channelId = v3.channelId or "23456", 
        members = v3.members or {
            "12345"
        }
    }));
end;
v1.format = function(v4)
    return (v1.new({
        channelId = v4.channelId, 
        members = v4.members
    }));
end;
v1.isValid = v0.strictInterface({
    channelId = v0.string, 
    members = v0.array(v0.string)
});
return v1;
