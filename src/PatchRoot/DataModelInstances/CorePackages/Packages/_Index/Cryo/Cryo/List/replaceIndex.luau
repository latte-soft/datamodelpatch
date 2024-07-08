return function(v0, v1, v2)
    local v3 = {};
    local v4 = #v0;
    assert(v1 <= v4, "index must be less or equal than the list length");
    for v5 = 1, v4 do
        if v5 == v1 then
            v3[v5] = v2;
        else
            v3[v5] = v0[v5];
        end;
    end;
    return v3;
end;
