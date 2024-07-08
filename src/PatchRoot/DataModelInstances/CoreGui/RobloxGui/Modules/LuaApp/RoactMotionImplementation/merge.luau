return function(...)
    local v0 = {};
    for v1 = 1, select("#", ...) do
        for v2, v3 in pairs(select(v1, ...)) do
            v0[v2] = v3;
        end;
    end;
    return v0;
end;
