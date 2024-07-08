local _ = require(script.Parent.Parent.Array);
return function(v1)
    assert(v1 ~= nil, "cannot get entries from a nil value");
    local v2 = typeof(v1);
    local v3 = {};
    if v2 == "table" then
        for v4, v5 in pairs(v1) do
            table.insert(v3, {
                v4, 
                v5
            });
        end;
        return v3;
    else
        if v2 == "string" then
            for v6 = 1, string.len(v1) do
                v3[v6] = {
                    tostring(v6), 
                    (string.sub(v1, v6, v6))
                };
            end;
        end;
        return v3;
    end;
end;
