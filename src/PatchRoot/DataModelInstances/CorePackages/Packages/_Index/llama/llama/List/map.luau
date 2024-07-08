return function(v0, v1)
    local v2 = type(v0);
    assert(v2 == "table", "expected a table for first argument, got " .. v2);
    local v3 = type(v1);
    assert(v3 == "function", "expected a function for second argument, got " .. v3);
    local v4 = {};
    local v5 = 1;
    for v6 = 1, #v0 do
        local v7 = v1(v0[v6], v6);
        if v7 ~= nil then
            v4[v5] = v7;
            v5 = v5 + 1;
        end;
    end;
    return v4;
end;
