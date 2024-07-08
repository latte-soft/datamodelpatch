return function(v0)
    local v1 = {};
    for v2, v3 in pairs(v0) do
        v1[v2] = #v3;
    end;
    return v1;
end;
