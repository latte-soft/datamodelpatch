return function(v0, v1, v2)
    local v3 = type(v0);
    assert(v3 == "table", "expected a table for first argument, got " .. v3);
    local v4 = type(v1);
    assert(v4 == "function", "expected a function for second argument, got " .. v4);
    local v5 = v2 or #v0;
    for v6 = v5, 1, -1 do
        if v1(v0[v6], v6) then
            return v6;
        end;
    end;
    return nil;
end;
