local v0 = require(script.Parent.copy);
return function(v1, v2, v3)
    local v4 = type(v1);
    assert(v4 == "table", "expected a table for first argument, got " .. v4);
    assert(v2 ~= nil, "expected second argument to be anything but nil, got nil");
    local v5 = v0(v1);
    v5[v2] = v3;
    return v5;
end;
