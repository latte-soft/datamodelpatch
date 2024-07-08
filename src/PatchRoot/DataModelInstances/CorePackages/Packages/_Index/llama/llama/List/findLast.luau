return function(v0, v1, v2)
    local v3 = type(v0);
    assert(v3 == "table", "expected a table for first argument, got " .. v3);
    local v4 = v2 or #v0;
    for v5 = v4, 1, -1 do
        if v0[v5] == v1 then
            return v5;
        end;
    end;
    return nil;
end;
