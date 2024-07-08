return function(v0)
    return function(v1)
        return function(v2)
            v0(v2);
            return v1(v2);
        end;
    end;
end;
