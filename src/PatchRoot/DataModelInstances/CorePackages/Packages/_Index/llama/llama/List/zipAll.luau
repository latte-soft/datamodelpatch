local v0 = require(script.Parent.Parent.None);
return function(...)
    local v1 = {};
    local v2 = select("#", ...);
    local v3 = #select(1, ...);
    for v4 = 2, v2 do
        local v5 = #select(v4, ...);
        if v3 < v5 then
            v3 = v5;
        end;
    end;
    for v6 = 1, v3 do
        v1[v6] = {};
        for v7 = 1, v2 do
            if select(v7, ...)[v6] == nil then
                v1[v6][v7] = v0;
            else
                v1[v6][v7] = select(v7, ...)[v6];
            end;
        end;
    end;
    return v1;
end;
