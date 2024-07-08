return function(v0, v1, v2)
    local v3 = type(v0);
    assert(v3 == "table", "expected a table for first argument, got " .. v3);
    local v4 = type(v1);
    assert(v4 == "function", "expected a function for second argument, got " .. v4);
    for v5 = v2 or 1, #v0 do
        if v1(v0[v5], v5) then
            return v5;
        end;
    end;
    return nil;
end;
