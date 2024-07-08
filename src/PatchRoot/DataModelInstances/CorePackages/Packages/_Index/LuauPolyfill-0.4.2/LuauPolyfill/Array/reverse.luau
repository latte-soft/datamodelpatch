local _ = require(script.Parent.Parent.types);
return function(v1)
    local v2 = #v1;
    local v3 = 1;
    while v3 < v2 do
        local v4 = v1[v2];
        local v5 = v1[v3];
        v1[v3] = v4;
        v1[v2] = v5;
        v3 = v3 + 1;
        v2 = v2 - 1;
    end;
    return v1;
end;
