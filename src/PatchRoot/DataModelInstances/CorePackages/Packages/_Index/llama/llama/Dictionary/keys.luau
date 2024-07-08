return function(v0)
    local v1 = type(v0);
    assert(v1 == "table", "expected a table for first argument, got " .. v1);
    local v2 = {};
    local v3 = 1;
    for v4, _ in pairs(v0) do
        v2[v3] = v4;
        v3 = v3 + 1;
    end;
    return v2;
end;
