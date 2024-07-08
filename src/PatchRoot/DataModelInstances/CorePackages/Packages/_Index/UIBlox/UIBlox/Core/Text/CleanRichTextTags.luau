return function(v0)
    local v1 = "";
    local v2 = 0;
    for v3 = 1, #v0 do
        local v4 = string.sub(v0, v3, v3);
        if v4 == "<" then
            v2 = v2 + 1;
        elseif v4 == ">" and v2 > 0 then
            v2 = v2 - 1;
        elseif v2 == 0 then
            v1 = v1 .. v4;
        end;
    end;
    if v2 ~= 0 then
        return v0;
    else
        return v1;
    end;
end;
