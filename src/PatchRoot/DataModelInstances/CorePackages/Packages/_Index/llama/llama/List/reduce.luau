return function(v0, v1, v2)
    local v3 = type(v0);
    assert(v3 == "table", "expected a table for first argument, got " .. v3);
    local v4 = type(v1);
    assert(v4 == "function", "expected a function for second argument, got " .. v4);
    local l_v2_0 = v2;
    if l_v2_0 == nil then
        l_v2_0 = v0[1];
    end;
    local v6 = v2 == nil and 2 or 1;
    for v7 = v6, #v0 do
        l_v2_0 = v1(l_v2_0, v0[v7], v7);
    end;
    return l_v2_0;
end;
