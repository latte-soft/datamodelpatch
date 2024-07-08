return function(v0, v1, v2)
    local v3 = type(v0);
    assert(v3 == "table", "expected a table for first argument, got " .. v3);
    for v4 = v2 or 1, #v0 do
        if v0[v4] == v1 then
            return v4;
        end;
    end;
    return nil;
end;
