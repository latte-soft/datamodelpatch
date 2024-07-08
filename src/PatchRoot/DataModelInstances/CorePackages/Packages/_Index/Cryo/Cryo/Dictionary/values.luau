return function(v0)
    local v1 = {};
    local v2 = 1;
    for _, v4 in pairs(v0) do
        v1[v2] = v4;
        v2 = v2 + 1;
    end;
    return v1;
end;
