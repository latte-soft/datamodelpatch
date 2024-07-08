return function(v0, v1)
    if v0 == nil then
        return v1 == nil;
    elseif v1 == nil then
        return v0 == nil;
    else
        for v2, v3 in pairs(v0) do
            if v3 ~= v1[v2] then
                return false;
            end;
        end;
        for v4, v5 in pairs(v1) do
            if v5 ~= v0[v4] then
                return false;
            end;
        end;
        return true;
    end;
end;
