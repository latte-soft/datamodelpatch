local v0 = require(script.Parent.toSet);
return function(v1, ...)
    local v2 = type(v1);
    assert(v2 == "table", "expected a table for first argument, got " .. v2);
    local v3 = {};
    local v4 = v0({
        ...
    });
    local v5 = 1;
    for v6 = 1, #v1 do
        if not v4[v6] then
            v3[v5] = v1[v6];
            v5 = v5 + 1;
        end;
    end;
    return v3;
end;
