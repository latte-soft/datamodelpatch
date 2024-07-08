return function(v0)
    local v1 = type(v0);
    assert(v1 == "table", "expected a table for first argument, got " .. v1);
    local v2 = {};
    for v3 = 1, #v0 do
        v2[v0[v3]] = true;
    end;
    return v2;
end;
