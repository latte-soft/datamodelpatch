return function(v0, v1, v2)
    if string.len(v1) == 0 then
        return true;
    else
        local v3 = nil;
        v3 = (not (v2 ~= nil) or v2 < 1) and 1 or v2;
        if string.len(v0) < v3 then
            return false;
        else
            return v0:find(v1, v3, true) == v3;
        end;
    end;
end;
