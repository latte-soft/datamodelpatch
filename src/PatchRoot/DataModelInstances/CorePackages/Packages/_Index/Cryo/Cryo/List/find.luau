return function(v0, v1)
    for v2 = 1, #v0 do
        if v0[v2] == v1 then
            return v2;
        end;
    end;
    return nil;
end;
