return function(v0)
    if typeof(v0) ~= "table" then
        return false;
    elseif next(v0) == nil then
        return true;
    elseif #v0 == 0 then
        return false;
    else
        local v1 = 0;
        local v2 = 0;
        for v3 in pairs(v0) do
            if typeof(v3) ~= "number" then
                return false;
            elseif not (v3 % 1 == 0) or v3 < 1 then
                return false;
            else
                v1 = v1 + 1;
                v2 = v2 + v3;
            end;
        end;
        return v2 == (v1 * (v1 + 1)) / 2;
    end;
end;
