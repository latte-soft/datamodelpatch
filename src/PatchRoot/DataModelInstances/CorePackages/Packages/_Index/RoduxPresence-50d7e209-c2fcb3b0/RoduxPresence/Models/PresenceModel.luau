local l_script_FirstAncestor_0 = script:FindFirstAncestor("RoduxPresence");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.t);
local v4 = require(l_script_FirstAncestor_0.Enums);
local v5 = {};
v5.new = function(v6)
    assert(v5.isValid(v6));
    v5.__index = v5;
    setmetatable(v6, v5);
    return v6;
end;
v5.mock = function(v7)
    v7 = v7 or {};
    return (v5.new({
        userPresenceType = v7.userPresenceType or 0, 
        lastLocation = v7.lastLocation or "LastLocation", 
        placeId = v7.placeId or 123, 
        rootPlaceId = v7.rootPlaceId or 234, 
        gameId = v7.gameId or "Game-OoooOO-Id", 
        universeId = v7.universeId or 345, 
        userId = v7.userId or 456, 
        lastOnline = v7.lastOnline or "LastOnline-OOOoOO"
    }));
end;
v5.format = function(v8)
    return v2.Dictionary.join(v8, {
        userPresenceType = v4.PresenceType.fromRawValue(v8.userPresenceType)
    });
end;
v5.isValid = v3.interface({
    userPresenceType = v3.numberConstrained(0, 3), 
    lastLocation = v3.string, 
    placeId = v3.optional(v3.union(v3.numberPositive, v3.string)), 
    rootPlaceId = v3.optional(v3.union(v3.numberPositive, v3.string)), 
    gameId = v3.optional(v3.string), 
    universeId = v3.optional(v3.union(v3.numberPositive, v3.string)), 
    userId = v3.union(v3.numberPositive, v3.string), 
    lastOnline = v3.string
});
return v5;
