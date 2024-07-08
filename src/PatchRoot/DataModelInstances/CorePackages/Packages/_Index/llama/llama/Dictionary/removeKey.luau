local v0 = require(script.Parent.copy);
return function(v1, ...)
    local v2 = type(v1);
    assert(v2 == "table", "expected a table for first argument, got " .. v2);
    local v3 = v0(v1);
    for v4 = 1, select("#", ...) do
        v3[select(v4, ...)] = nil;
    end;
    return v3;
end;
