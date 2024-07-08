local _ = require(script.Parent.Parent.Parent.Parent.ES7Types);
return function(v1, v2, v3)
    local v4 = {};
    if not v2 then
        return (table.clone(v1._array));
    else
        v4 = {};
        for v5, v6 in v1, nil, nil do
            if v3 ~= nil then
                v4[v5] = v2(v3, v6, v5);
            else
                v4[v5] = v2(v6, v5);
            end;
        end;
        return v4;
    end;
end;
