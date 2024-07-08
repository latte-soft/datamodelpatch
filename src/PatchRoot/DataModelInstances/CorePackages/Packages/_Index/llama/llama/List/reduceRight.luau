return function(v0, v1, v2)
    local v3 = type(v0);
    assert(v3 == "table", "expected a table for first argument, got " .. v3);
    local v4 = type(v1);
    assert(v4 == "function", "expected a function for second argument, got " .. v4);
    local v5 = #v0;
    local l_v2_0 = v2;
    if l_v2_0 == nil then
        l_v2_0 = v0[v5];
    end;
    local v7 = v2 == nil and v5 - 1 or v5;
    for v8 = v7, 1, -1 do
        l_v2_0 = v1(l_v2_0, v0[v8], v8);
    end;
    return l_v2_0;
end;
