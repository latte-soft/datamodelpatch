return function(v0, v1, v2)
    local v3 = v1:len();
    if v3 == 0 then
        return true;
    else
        local v4 = v0:len();
        local v5 = v2 or v4;
        if v4 < v5 then
            v5 = v4;
        end;
        if v5 < 1 then
            return false;
        else
            local v6 = (v5 - v3) + 1;
            return v0:find(v1, v6, true) == v6;
        end;
    end;
end;
