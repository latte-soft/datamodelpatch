return function(v0, v1)
    local v2 = type(v0);
    assert(v2 == "table", "expected a table for first argument, got " .. v2);
    assert(v1 ~= nil, "expected second argument to be anything but nil, got nil");
    return v0[v1] ~= nil;
end;
