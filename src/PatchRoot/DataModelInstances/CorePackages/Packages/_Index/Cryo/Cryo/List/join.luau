local v0 = require(script.Parent.Parent.None);
return function(...)
    local v1 = {};
    for v2 = 1, select("#", ...) do
        local v3 = select(v2, ...);
        local v4 = #v1;
        for v5 = 1, #v3 do
            if v3[v5] == v0 then
                v4 = v4 - 1;
            else
                v1[v4 + v5] = v3[v5];
            end;
        end;
    end;
    return v1;
end;
