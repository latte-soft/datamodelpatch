return function(v0)
    local v1 = {};
    for v2 = 1, #v0 do
        v1[v0[v2]] = true;
    end;
    return v1;
end;
