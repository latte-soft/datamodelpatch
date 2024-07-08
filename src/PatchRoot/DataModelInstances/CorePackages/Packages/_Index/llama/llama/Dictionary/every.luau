return function(v0, v1)
    local v2 = type(v0);
    assert(v2 == "table", "expected a table for first argument, got " .. v2);
    local v3 = type(v1);
    assert(v3 == "function", "expected a function for second argument, got " .. v3);
    for v4, v5 in pairs(v0) do
        if not v1(v5, v4) then
            return false;
        end;
    end;
    return true;
end;
