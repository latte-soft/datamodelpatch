local l_script_FirstAncestor_0 = script:FindFirstAncestor("RoduxGames");
local v1 = require(l_script_FirstAncestor_0.Parent.t);
local l_CreatorType_0 = require(l_script_FirstAncestor_0.Enums).CreatorType;
local v3 = {};
v3.new = function(v4)
    assert(v3.isValid(v4));
    v3.__index = v3;
    setmetatable(v4, v3);
    return v4;
end;
v3.mock = function(v5)
    v5 = v5 or {};
    return (v3.new({
        creatorId = v5.creatorId or "creatorId", 
        creatorName = v5.creatorName or "creatorName", 
        creatorType = v5.creatorType or l_CreatorType_0.User
    }));
end;
v3.format = function(v6)
    return (v3.new({
        creatorId = tostring(v6.id), 
        creatorName = v6.name, 
        creatorType = l_CreatorType_0.fromRawValue(v6.type)
    }));
end;
v3.isValid = v1.strictInterface({
    creatorId = v1.string, 
    creatorName = v1.string, 
    creatorType = v1.userdata
});
return v3;
