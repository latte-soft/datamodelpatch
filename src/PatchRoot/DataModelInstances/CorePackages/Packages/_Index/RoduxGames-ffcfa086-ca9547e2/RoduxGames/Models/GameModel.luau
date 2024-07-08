local v0 = require(script:FindFirstAncestor("RoduxGames").Parent.t);
local v1 = require(script.Parent.CreatorModel);
local v2 = {};
v2.new = function(v3)
    assert(v2.isValid(v3));
    v2.__index = v2;
    setmetatable(v3, v2);
    return v3;
end;
v2.mock = function(v4)
    v4 = v4 or {};
    return (v2.new({
        experienceId = v4.experienceId or "experienceId", 
        name = v4.name or "name", 
        description = v4.description or "description", 
        price = v4.price or 666, 
        rootPlaceId = v4.rootPlaceId or "rootPlaceId", 
        creator = v1.mock(v4.creator), 
        maxPlayers = v4.maxPlayers or 6
    }));
end;
v2.format = function(v5)
    return (v2.new({
        experienceId = tostring(v5.id), 
        name = v5.name, 
        description = v5.description or "", 
        price = v5.price or 0, 
        rootPlaceId = tostring(v5.rootPlaceId), 
        creator = v1.format(v5.creator), 
        maxPlayers = v5.maxPlayers
    }));
end;
v2.isValid = v0.strictInterface({
    experienceId = v0.string, 
    name = v0.string, 
    description = v0.string, 
    price = v0.number, 
    rootPlaceId = v0.string, 
    creator = v1.isValid, 
    maxPlayers = v0.number
});
return v2;
