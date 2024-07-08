return function(v0, v1)
    local v2;
    if v0 == v1 then
        v2 = true;
        if v0 == 0 then
            v2 = true;
            if not (1 / v0 ~= 1 / v1) then
                goto label0;
            end;
        else
            goto label0;
        end;
    end;
    v2 = false;
    if v0 ~= v0 then
        v2 = v1 ~= v1;
    end;
    ::label0::;
    return v2;
end;
