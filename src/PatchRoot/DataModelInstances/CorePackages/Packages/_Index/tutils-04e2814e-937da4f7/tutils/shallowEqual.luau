return function(v0, v1, v2)
    if v0 and v1 then
        if v0 == v1 then
            return true;
        else
            if not v2 then
                v2 = {};
            end;
            for v3, v4 in pairs(v0) do
                if not (not (v1[v3] ~= v4) or v2[v3]) then
                    return false;
                end;
            end;
            for v5, v6 in pairs(v1) do
                if not (not (v0[v5] ~= v6) or v2[v5]) then
                    return false;
                end;
            end;
            return true;
        end;
    else
        return false;
    end;
end;
