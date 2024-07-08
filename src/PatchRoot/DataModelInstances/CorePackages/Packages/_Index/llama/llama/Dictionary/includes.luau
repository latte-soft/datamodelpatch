return function(v0, v1)
    local v2 = type(v0);
    assert(v2 == "table", "expected a table for first argument, got " .. v2);
    for _, v4 in pairs(v0) do
        if v4 == v1 then
            return true;
        end;
    end;
    return false;
end;
