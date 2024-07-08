return function(...)
    local v0 = {};
    local v1 = select("#", ...);
    local v2 = #select(1, ...);
    for v3 = 2, v1 do
        local v4 = #select(v3, ...);
        if v4 < v2 then
            v2 = v4;
        end;
    end;
    for v5 = 1, v2 do
        v0[v5] = {};
        for v6 = 1, v1 do
            v0[v5][v6] = select(v6, ...)[v5];
        end;
    end;
    return v0;
end;
