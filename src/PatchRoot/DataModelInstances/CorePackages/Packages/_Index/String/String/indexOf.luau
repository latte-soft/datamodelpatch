local v0 = "([" .. ("$%^()-[].?"):gsub("(.)", "%%%1") .. "])";
return function(v1, v2, v3)
    local v4 = #v1;
    local v5 = if v3 ~= nil then v3 < 1 and 1 or v3 else 1;
    if #v2 == 0 then
        if v4 < v5 then
            return v4;
        else
            return v5;
        end;
    elseif v4 < v5 then
        return -1;
    else
        v2 = v2:gsub(v0, "%%%1");
        local v6 = #v2;
        for v7 = v5, v4 do
            if string.sub(v1, v7, (v7 + v6) - 1) == v2 then
                return v7;
            end;
        end;
        return -1;
    end;
end;
