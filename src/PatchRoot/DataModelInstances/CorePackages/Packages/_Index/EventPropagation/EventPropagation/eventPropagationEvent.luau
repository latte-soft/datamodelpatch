local v0 = {};
v0.__index = v0;
v0.new = function(v1, v2, v3, v4, v5)
    local v6 = {
        cancelled = false, 
        phase = v4, 
        currentInstance = v2, 
        targetInstance = v1, 
        eventName = v3, 
        eventData = if not (type(v5) == "table") or table.isfrozen(v5) then v5 else table.freeze(v5)
    };
    setmetatable(v6, v0);
    return v6;
end;
v0.cancel = function(v7)
    v7.cancelled = true;
end;
return v0;
