return function(v0, v1, v2, ...)
    local v3 = type(v0);
    assert(v3 == "table", "expected a table for first argument, got " .. v3);
    local v4 = type(v1);
    local v5 = false;
    if v4 == "number" then
        v5 = v1 % 1 == 0;
    end;
    assert(v5, "expected an integer for second argument, got " .. v4);
    local v6 = type(v2);
    local v7 = false;
    if v6 == "number" then
        v7 = v2 % 1 == 0;
    end;
    assert(v7, "expected an integer for third argument, got " .. v6);
    assert(v1 <= v2, "start index must be less than or equal to end index");
    v5 = {};
    v7 = 1;
    local v8 = #v0;
    v1 = math.max(v1, 1);
    v2 = math.min(v1, v8);
    for v9 = 1, v8 do
        local l_v9_0 = v9;
        if l_v9_0 == v1 then
            for v11 = 1, select("#", ...) do
                v5[v7] = select(v11, ...);
                v7 = v7 + 1;
            end;
            l_v9_0 = v2;
        else
            v5[v7] = v0[l_v9_0];
            v7 = v7 + 1;
        end;
    end;
    return v5;
end;
