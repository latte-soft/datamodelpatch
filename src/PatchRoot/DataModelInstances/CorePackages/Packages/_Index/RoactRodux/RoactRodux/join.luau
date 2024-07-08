return function(...)
    local v0 = {};
    for v1 = 1, select("#", ...) do
        local v2 = select(v1, ...);
        if v2 ~= nil then
            for v3, v4 in pairs(v2) do
                v0[v3] = v4;
            end;
        end;
    end;
    return v0;
end;
