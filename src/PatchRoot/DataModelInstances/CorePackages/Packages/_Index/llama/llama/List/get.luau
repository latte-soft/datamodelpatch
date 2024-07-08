return function(v0, v1)
    local v2 = type(v0);
    assert(v2 == "table", "expected a table for first argument, got " .. v2);
    local v3 = type(v1);
    local v4 = false;
    if v3 == "number" then
        v4 = v1 % 1 == 0;
    end;
    assert(v4, "expected second argument to be an integer, got " .. v3);
    return v0[v1];
end;
