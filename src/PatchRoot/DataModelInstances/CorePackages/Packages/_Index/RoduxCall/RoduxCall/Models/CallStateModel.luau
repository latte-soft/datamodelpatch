local l_script_FirstAncestor_0 = script:FindFirstAncestor("RoduxCall");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Status_0 = require(l_script_FirstAncestor_0.Enums).Status;
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
        status = v6.status or l_Status_0.Active, 
        callerId = v6.callerId or 123, 
        calleeId = v6.calleeId or 456, 
        placeId = v6.placeId or 789, 
        reservedServerAccessCode = v6.reservedServerAccessCode or nil, 
        callId = v6.callId or nil, 
        callerCombinedName = v6.callerCombinedName or nil, 
        calleeCombinedName = v6.calleeCombinedName or nil, 
        instanceId = v6.instanceId or nil, 
        createdUtc = v6.createdUtc or 0, 
        activeUtc = v6.activeUtc or 0
    }));
end;
v4.format = function(v7)
    return (v4.new({
        status = v7.status, 
        callerId = v7.callerId, 
        calleeId = v7.calleeId, 
        placeId = v7.placeId, 
        reservedServerAccessCode = v7.reservedServerAccessCode, 
        callId = v7.callId, 
        callerCombinedName = v7.callerCombinedName, 
        calleeCombinedName = v7.calleeCombinedName, 
        instanceId = v7.instanceId, 
        createdUtc = v7.createdUtc, 
        activeUtc = v7.activeUtc
    }));
end;
v4.isValid = v3.strictInterface({
    status = v3.string, 
    callerId = v3.optional(v3.number), 
    calleeId = v3.optional(v3.number), 
    placeId = v3.optional(v3.number), 
    reservedServerAccessCode = v3.optional(v3.string), 
    callId = v3.optional(v3.string), 
    callerCombinedName = v3.optional(v3.string), 
    calleeCombinedName = v3.optional(v3.string), 
    instanceId = v3.optional(v3.string), 
    createdUtc = v3.optional(v3.number), 
    activeUtc = v3.optional(v3.number)
});
return v4;
