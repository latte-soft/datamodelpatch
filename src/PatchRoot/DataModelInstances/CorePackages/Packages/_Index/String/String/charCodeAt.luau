local l_NaN_0 = require(script.Parent.Parent.Number).NaN;
return function(v1, v2)
    if type(v2) ~= "number" then
        v2 = 1;
    end;
    local v3 = string.len(v1);
    if not (v2 >= 1) or v3 < v2 then
        return l_NaN_0;
    else
        local v4 = utf8.offset(v1, v2);
        if not (v4 ~= nil) or v3 < v4 then
            return l_NaN_0;
        else
            local v5 = utf8.codepoint(v1, v4, v4);
            if v5 == nil then
                return l_NaN_0;
            else
                return v5;
            end;
        end;
    end;
end;
