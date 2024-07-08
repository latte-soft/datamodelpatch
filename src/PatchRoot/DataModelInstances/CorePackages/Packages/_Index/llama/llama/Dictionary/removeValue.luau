local v0 = require(script.Parent.Parent.List.toSet);
return function(v1, ...)
    local v2 = type(v1);
    assert(v2 == "table", "expected a table for first argument, got " .. v2);
    local v3 = v0({
        ...
    });
    local v4 = {};
    for v5, v6 in pairs(v1) do
        if not v3[v6] then
            v4[v5] = v6;
        end;
    end;
    return v4;
end;
