return function(v0)
    local v1 = {};
    local v2 = #v0;
    local v3 = v2 + 1;
    for v4 = 1, v2 do
        v1[v4] = v0[v3 - v4];
    end;
    return v1;
end;
