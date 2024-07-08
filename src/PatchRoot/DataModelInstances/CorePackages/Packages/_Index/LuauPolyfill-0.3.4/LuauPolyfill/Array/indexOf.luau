return function(v0, v1, v2)
    local v3 = v2 or 1;
    local v4 = #v0;
    if v3 < 1 then
        v3 = math.max(v4 - math.abs(v3), 1);
    end;
    for v5 = v3, v4 do
        if v0[v5] == v1 then
            return v5;
        end;
    end;
    return -1;
end;
