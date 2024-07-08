return function(v0, v1)
    local v2 = type(v0);
    assert(v2 == "table", "expected a table for first argument, got " .. v2);
    local v3 = type(v1);
    assert(v3 == "function", "expected a function for second argument, got " .. v3);
    for v4 = 1, #v0 do
        if v1(v0[v4], v4) then
            return true;
        end;
    end;
    return false;
end;
