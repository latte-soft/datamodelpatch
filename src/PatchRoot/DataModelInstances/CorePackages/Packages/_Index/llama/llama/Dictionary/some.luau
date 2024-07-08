return function(v0, v1)
    local v2 = type(v1);
    assert(v2 == "function", "expected a function for second argument, got " .. v2);
    for v3, v4 in pairs(v0) do
        if v1(v4, v3) then
            return true;
        end;
    end;
    return false;
end;
