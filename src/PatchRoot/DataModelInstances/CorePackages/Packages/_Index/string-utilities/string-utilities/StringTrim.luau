return function(v0, v1, v2)
    if not v1 then
        v1 = "%s";
    end;
    if #v1 == 0 then
        return v0;
    else
        if not v2 then
            v2 = {
                left = true, 
                right = true
            };
        end;
        local l_v0_0 = v0;
        if v2.left then
            local v4 = string.find(l_v0_0, "[^" .. v1 .. "]");
            if v4 then
                l_v0_0 = string.sub(l_v0_0, v4);
            else
                return "";
            end;
        end;
        if v2.right then
            local v5 = string.find(l_v0_0, "[" .. v1 .. "]+$");
            if v5 then
                l_v0_0 = string.sub(l_v0_0, 1, v5 - 1);
            else
                return l_v0_0;
            end;
        end;
        return l_v0_0;
    end;
end;
