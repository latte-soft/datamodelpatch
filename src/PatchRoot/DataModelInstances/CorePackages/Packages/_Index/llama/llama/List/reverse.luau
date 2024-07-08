return function(v0)
    local v1 = type(v0);
    assert(v1 == "table", "expected a table for first argument, got " .. v1);
    local v2 = {};
    local v3 = #v0;
    local v4 = v3 + 1;
    for v5 = 1, v3 do
        v2[v5] = v0[v4 - v5];
    end;
    return v2;
end;
