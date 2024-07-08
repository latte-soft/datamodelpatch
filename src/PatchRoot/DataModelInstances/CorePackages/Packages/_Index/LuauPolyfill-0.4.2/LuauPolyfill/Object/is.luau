return function(v0, v1)
    if v0 == v1 then
        local v2 = true;
        if v0 == 0 then
            v2 = 1 / v0 == 1 / v1;
        end;
        return v2;
    else
        local v3 = false;
        if v0 ~= v0 then
            v3 = v1 ~= v1;
        end;
        return v3;
    end;
end;
