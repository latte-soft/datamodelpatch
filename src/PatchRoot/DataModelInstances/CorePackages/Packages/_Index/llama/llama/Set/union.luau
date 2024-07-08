return function(...)
    local v0 = {};
    for v1 = 1, select("#", ...) do
        for v2, _ in pairs(select(v1, ...)) do
            v0[v2] = true;
        end;
    end;
    return v0;
end;
