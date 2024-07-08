local _ = require(script.Parent.Parent.Parent.Parent.ES7Types);
return function(v1, v2, v3)
    local v4 = {};
    if not v2 then
        v4 = {};
        for v5, v6 in v1, nil, nil do
            v4[v5] = v6;
        end;
        return v4;
    else
        v4 = {};
        for v7, v8 in v1, nil, nil do
            if v3 ~= nil then
                v4[v7] = v2(v3, v8, v7);
            else
                v4[v7] = v2(v8, v7);
            end;
        end;
        return v4;
    end;
end;
