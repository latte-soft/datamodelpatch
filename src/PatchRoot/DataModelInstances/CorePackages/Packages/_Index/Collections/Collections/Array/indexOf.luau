local _ = require(script.Parent.Parent.Parent.ES7Types);
return function(v1, v2, v3)
    local v4 = v3 or 1;
    local v5 = #v1;
    if v4 < 1 then
        v4 = math.max(v5 - math.abs(v4), 1);
    end;
    for v6 = v4, v5 do
        if v1[v6] == v2 then
            return v6;
        end;
    end;
    return -1;
end;
