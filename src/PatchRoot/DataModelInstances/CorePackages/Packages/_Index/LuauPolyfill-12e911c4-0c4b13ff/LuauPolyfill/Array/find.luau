return function(v0, v1)
    for v2 = 1, #v0 do
        local v3 = v0[v2];
        if v1(v3, v2, v0) then
            return v3;
        end;
    end;
    return nil;
end;
