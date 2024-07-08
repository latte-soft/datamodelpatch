local v0 = {};
v0.__index = v0;
v0.createNode = function(v1)
    local v2 = {
        previous = nil, 
        next = nil, 
        value = v1
    };
    setmetatable(v2, v0);
    return v2;
end;
v0.CreateNext = function(v3, v4)
    local v5 = {
        previous = v3, 
        next = v3.next, 
        value = v4 or {}
    };
    if v3.next then
        v3.next.previous = v5;
    end;
    setmetatable(v5, v0);
    v3.next = v5;
    return v5;
end;
v0.CreatePrevious = function(v6, v7)
    local v8 = {
        previous = v6.previous, 
        next = v6, 
        value = v7 or {}
    };
    if v6.previous then
        v6.previous.next = v8;
    end;
    setmetatable(v8, v0);
    v6.previous = v8;
    return v8;
end;
return v0;
