return function(v0, v1)
    return function(v2, ...)
        if v2 == v1 then
            return v0(v1, ...);
        else
            return v0(v1, v2, ...);
        end;
    end;
end;
