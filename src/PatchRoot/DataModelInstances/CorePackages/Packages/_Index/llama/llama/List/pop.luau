return function(v0, v1)
    local v2 = type(v0);
    assert(v2 == "table", "expected a table for first argument, got " .. v2);
    v1 = v1 or 1;
    local v3 = type(v1);
    local v4 = false;
    if v3 == "number" then
        v4 = v1 % 1 == 0;
    end;
    assert(v4, "expected an integer for second argument, got " .. v3);
    local v5 = {};
    for v6 = 1, #v0 - v1 do
        v5[v6] = v0[v6];
    end;
    return v5;
end;
