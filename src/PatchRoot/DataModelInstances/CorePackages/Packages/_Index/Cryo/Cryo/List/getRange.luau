return function(v0, v1, v2)
    assert(v1 <= v2, "startIndex must be less than or equal to endIndex");
    local v3 = {};
    local v4 = 1;
    for v5 = math.max(1, v1), math.min(#v0, v2) do
        v3[v4] = v0[v5];
        v4 = v4 + 1;
    end;
    return v3;
end;
