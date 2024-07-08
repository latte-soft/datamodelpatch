return function(v0, v1)
    for v2, v3 in v0, nil, nil do
        if v1[v2] ~= v3 then
            return false;
        end;
    end;
    for v4, v5 in v1, nil, nil do
        if v0[v4] ~= v5 then
            return false;
        end;
    end;
    return true;
end;
