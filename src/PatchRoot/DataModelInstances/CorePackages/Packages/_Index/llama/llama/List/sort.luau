local v0 = require(script.Parent.copy);
return function(v1, v2)
    local v3 = type(v1);
    assert(v3 == "table", "expected a table for first argument, got " .. v3);
    local v4 = v0(v1);
    table.sort(v4, v2);
    return v4;
end;
