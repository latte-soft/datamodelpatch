return function(v0, v1, v2, v3, v4, v5, v6)
    local v7 = v2 + (-v4 * (v1 - v3) + -v5 * v2) * v0;
    local v8 = v1 + v2 * v0;
    if math.abs(v7) < v6 and math.abs(v3 - v8) < v6 then
        return v3, 0;
    else
        return v8, v7;
    end;
end;
