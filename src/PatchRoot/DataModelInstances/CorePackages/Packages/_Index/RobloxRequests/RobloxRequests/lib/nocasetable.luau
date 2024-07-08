return function(v0)
    local v6 = setmetatable({}, {
        __index = function(v1, v2)
            return (rawget(v1, v2:lower()));
        end, 
        __newindex = function(v3, v4, v5)
            rawset(v3, v4:lower(), v5);
        end
    });
    for v7, v8 in pairs(v0) do
        v6[v7] = v8;
    end;
    return v6;
end;
