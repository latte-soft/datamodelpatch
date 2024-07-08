return function(v0, v1, v2)
    local v3 = type(v0);
    assert(v3 == "table", "expected a table for first argument, got " .. v3);
    local v4 = #v0;
    v1 = v1 or 1;
    v2 = v2 or v4;
    assert(v1 <= v2, "start index must be less than or equal to end index");
    local v5 = {};
    local v6 = 1;
    for v7 = math.max(1, v1), math.min(v2, v4) do
        v5[v6] = v0[v7];
        v6 = v6 + 1;
    end;
    return v5;
end;
