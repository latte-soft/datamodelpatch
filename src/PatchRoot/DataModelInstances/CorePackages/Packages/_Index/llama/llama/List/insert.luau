return function(v0, v1, ...)
    local v2 = type(v0);
    assert(v2 == "table", "expected a table for first argument, got " .. v2);
    local v3 = #v0;
    local v4 = false;
    if v1 >= 1 then
        v4 = v1 <= v3 + 1;
    end;
    assert(v4, "index must be in bounds of list");
    local v5 = {};
    v4 = 1;
    for v6 = 1, v3 do
        if v6 == v1 then
            for v7 = 1, select("#", ...) do
                v5[v4] = select(v7, ...);
                v4 = v4 + 1;
            end;
        end;
        v5[v4] = v0[v6];
        v4 = v4 + 1;
    end;
    return v5;
end;
