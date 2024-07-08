return function(v0, ...)
    local v1 = {};
    for v2, _ in pairs(v0) do
        v1[v2] = true;
    end;
    for v4 = 1, select("#", ...) do
        v1[select(v4, ...)] = nil;
    end;
    return v1;
end;
