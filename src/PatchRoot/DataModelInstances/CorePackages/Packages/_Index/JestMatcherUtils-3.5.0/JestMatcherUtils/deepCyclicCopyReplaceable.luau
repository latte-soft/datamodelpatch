local v0 = nil;
local v1 = nil;
v0 = function(v2, v3)
    local v4 = {};
    v3[v2] = v4;
    for v5, v6 in pairs(v2) do
        v4[v5] = v1(v6, v3);
    end;
    return v4;
end;
v1 = function(v7, v8)
    if typeof(v7) ~= "table" then
        return v7;
    elseif not v8[v7] then
        local v9 = v0(v7, v8);
        local v10 = getmetatable(v7);
        if v10 and typeof(v10) == "table" then
            setmetatable(v9, v10);
        end;
        return v9;
    else
        return v8[v7];
    end;
end;
return function(v11, v12)
    local v13 = v12 or {};
    setmetatable(v13, {
        _mode = "kv"
    });
    return v1(v11, v13);
end;
