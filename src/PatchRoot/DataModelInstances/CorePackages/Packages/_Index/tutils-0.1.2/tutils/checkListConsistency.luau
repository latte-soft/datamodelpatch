return function(v0)
    local v1 = false;
    local v2 = false;
    local v3 = true;
    local v4 = 1;
    for v5, _ in pairs(v0) do
        if type(v5) == "string" then
            v2 = true;
        elseif type(v5) == "number" then
            if v4 ~= v5 then
                v3 = false;
            end;
            v1 = true;
        else
            return false;
        end;
        if not v2 or not v1 then
            v4 = v4 + 1;
        else
            return false;
        end;
    end;
    if not v1 then
        return true;
    else
        return v3;
    end;
end;
