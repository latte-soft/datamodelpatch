return function(v0, v1)
    local v2 = {};
    for v3 = 1, #v0 do
        v2[v3] = v0[v3];
    end;
    table.sort(v2, v1);
    return v2;
end;
