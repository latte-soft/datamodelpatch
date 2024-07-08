return function(v0, v1)
    local v2 = {};
    local v3 = 0;
    for v4 = 1, #v0 do
        if v4 == v1 then
            v3 = 1;
        else
            v2[v4 - v3] = v0[v4];
        end;
    end;
    return v2;
end;
