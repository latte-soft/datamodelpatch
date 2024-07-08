return function(v0, v1)
    local v2 = {};
    for v3, v4 in pairs(v0) do
        if v1[v3] ~= v0[v3] then
            v2[v3] = v4;
        end;
    end;
    for v5, v6 in pairs(v1) do
        if v1[v5] ~= v0[v5] then
            v2[v5] = v6;
        end;
    end;
    return v2;
end;
