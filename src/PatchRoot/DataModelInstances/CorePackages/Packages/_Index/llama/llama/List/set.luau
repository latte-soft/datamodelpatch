return function(v0, v1, v2)
    local v3 = type(v0);
    assert(v3 == "table", "expected a table for first argument, got " .. v3);
    local v4 = #v0;
    assert(v1 <= v4, "index must be less than or equal to the list length");
    assert(v1 >= 1, "index must be greater than or equal to 1");
    local v5 = {};
    local v6 = 1;
    for v7 = 1, v4 do
        if v7 == v1 then
            v5[v6] = v2;
        else
            v5[v6] = v0[v7];
        end;
        v6 = v6 + 1;
    end;
    return v5;
end;
