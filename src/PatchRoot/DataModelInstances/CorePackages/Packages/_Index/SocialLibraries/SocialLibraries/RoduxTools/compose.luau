return function(...)
    local v0 = {
        ...
    };
    local v1 = #v0;
    if v1 == 0 then
        return function(v2)
            return v2;
        end;
    else
        local v3 = v0[1];
        for v4 = 2, v1 do
            local v5 = v0[v4];
            local l_v3_0 = v3;
            v3 = function(...)
                return l_v3_0(v5(...));
            end;
        end;
        return v3;
    end;
end;
