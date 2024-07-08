return function(v0, v1)
    for v2 = 1, #v0 do
        if v1(v0[v2], v2, v0) then
            return v2;
        end;
    end;
    return -1;
end;
