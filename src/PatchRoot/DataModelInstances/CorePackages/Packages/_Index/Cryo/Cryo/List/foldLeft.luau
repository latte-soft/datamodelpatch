return function(v0, v1, v2)
    local l_v2_0 = v2;
    for v4 = 1, #v0 do
        l_v2_0 = v1(l_v2_0, v0[v4], v4);
    end;
    return l_v2_0;
end;
