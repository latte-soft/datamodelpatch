local l_Parent_0 = script:FindFirstAncestor("RoduxSquads").Parent;
local v1 = require(script.Parent.SquadMemberModel);
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.t);
local v4 = {};
v4.new = function(v5)
    assert(v4.isValid(v5));
    v4.__index = v4;
    setmetatable(v5, v4);
    return v5;
end;
v4.mock = function(v6)
    v6 = v6 or {};
    return (v4.new({
        squadId = v6.squadId or "12345", 
        initiatorId = v6.initiatorId or 54321, 
        createdUtc = v6.createdUtc or 1666635183, 
        channelId = v6.channelId or "23456", 
        members = v2.List.map(v6.members or {
            {
                userId = 1234, 
                rank = 0
            }
        }, function(v7)
            return v1.mock(v7);
        end)
    }));
end;
v4.format = function(v8)
    return (v4.new({
        squadId = v8.squadId, 
        initiatorId = v8.initiatorId, 
        createdUtc = v8.createdUtc, 
        channelId = v8.channelId, 
        members = v2.List.map(v8.members, function(v9)
            return v1.format(v9);
        end)
    }));
end;
v4.isValid = v3.strictInterface({
    squadId = v3.string, 
    initiatorId = v3.number, 
    createdUtc = v3.number, 
    channelId = v3.string, 
    members = v3.array(v1.isValid)
});
return v4;
