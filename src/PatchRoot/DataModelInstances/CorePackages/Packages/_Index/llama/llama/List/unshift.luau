return function(v0, ...)
    local v1 = type(v0);
    assert(v1 == "table", "expected a table for first argument, got " .. v1);
    local v2 = select("#", ...);
    local v3 = {};
    for v4 = 1, v2 do
        v3[v4] = select(v4, ...);
    end;
    for v5 = 1, #v0 do
        v3[v2 + v5] = v0[v5];
    end;
    return v3;
end;
