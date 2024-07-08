return function(v0, v1, v2)
    assert(v1 <= v2, "startIndex must be less than or equal to endIndex");
    local v3 = {};
    local v4 = 1;
    for v5 = 1, math.min(#v0, v1 - 1) do
        v3[v4] = v0[v5];
        v4 = v4 + 1;
    end;
    for v6 = v2 + 1, #v0 do
        v3[v4] = v0[v6];
        v4 = v4 + 1;
    end;
    return v3;
end;
