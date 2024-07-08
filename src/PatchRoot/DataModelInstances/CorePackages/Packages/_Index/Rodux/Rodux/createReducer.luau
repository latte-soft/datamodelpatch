return function(v0, v1)
    return function(v2, v3)
        if v2 == nil then
            v2 = v0;
        end;
        local v4 = v1[v3.type];
        if not v4 then
            return v2;
        else
            return v4(v2, v3);
        end;
    end;
end;
