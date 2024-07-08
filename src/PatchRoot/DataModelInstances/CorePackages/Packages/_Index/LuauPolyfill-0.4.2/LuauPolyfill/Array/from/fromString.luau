local _ = require(script.Parent.Parent.Parent.types);
return function(v1, v2, v3)
    local v4 = {};
    local v5 = #v1;
    v4 = table.create(v5);
    if not v2 then
        for v6 = 1, v5 do
            v4[v6] = string.sub(v1, v6, v6);
        end;
        return v4;
    else
        for v7 = 1, v5 do
            if v3 ~= nil then
                v4[v7] = v2(v3, string.sub(v1, v7, v7), v7);
            else
                v4[v7] = v2(string.sub(v1, v7, v7), v7);
            end;
        end;
        return v4;
    end;
end;
