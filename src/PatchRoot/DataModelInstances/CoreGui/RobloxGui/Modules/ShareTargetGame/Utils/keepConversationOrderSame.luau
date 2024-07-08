return function(v0, v1)
    local v2 = {};
    for v3, v4 in pairs(v0) do
        v2[v3] = {};
        for v5, v6 in pairs(v4) do
            v2[v3][v5] = v6;
        end;
        local v7 = v1 and v1[v3];
        if v7 then
            v2[v3].lastUpdated = v7.lastUpdated;
        end;
    end;
    return v2;
end;
