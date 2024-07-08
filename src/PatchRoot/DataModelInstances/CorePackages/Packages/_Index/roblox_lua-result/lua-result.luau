local v0 = {};
v0.__index = v0;
local v1 = newproxy(true);
v0.new = function(v2, v3)
    assert(typeof(v2) == "boolean");
    local v4 = {
        _source = debug.traceback(), 
        [v1] = true, 
        _status = v2, 
        _value = v3
    };
    setmetatable(v4, v0);
    return v4;
end;
v0.success = function(v5)
    return v0.new(true, v5);
end;
v0.error = function(v6)
    return v0.new(false, v6);
end;
v0.is = function(v7)
    if typeof(v7) ~= "table" then
        return false;
    else
        return v7[v1];
    end;
end;
v0.match = function(v8, v9, v10)
    local v11 = true;
    if typeof(v9) ~= "function" then
        v11 = typeof(v9) == "nil";
    end;
    assert(v11, string.format("Result:match expects successHandler to be a function or nil, got %s", (typeof(v9))));
    v11 = true;
    if typeof(v10) ~= "function" then
        v11 = typeof(v10) == "nil";
    end;
    assert(v11, string.format("Result:match expects errorHandler to be a function or nil, got %s", (typeof(v10))));
    local v12 = nil;
    if not v8._status then
        if v10 ~= nil then
            v12 = v10(v8._value);
        else
            return v8;
        end;
    elseif v9 ~= nil then
        v12 = v9(v8._value);
    else
        return v8;
    end;
    if not v0.is(v12) then
        return v0.success(v12);
    else
        return v12;
    end;
end;
v0.matchSuccess = function(v13, v14)
    return v13:match(v14, nil);
end;
v0.matchError = function(v15, v16)
    return v15:match(nil, v16);
end;
v0.unwrap = function(v17)
    return v17._status, v17._value;
end;
return v0;
