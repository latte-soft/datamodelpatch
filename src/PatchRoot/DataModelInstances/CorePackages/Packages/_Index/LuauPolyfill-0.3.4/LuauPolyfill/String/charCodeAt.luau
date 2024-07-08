local l_NaN_0 = require(script.Parent.Parent.Number).NaN;
return function(v1, v2)
    if typeof(v2) ~= "number" then
        v2 = 1;
    end;
    local v3, v4 = utf8.len(v1);
    assert(v3 ~= nil, ("string `%s` has an invalid byte at position %s"):format(v1, (tostring(v4))));
    if not (v3 >= v2) or v2 < 1 then
        return l_NaN_0;
    else
        local v5 = utf8.offset(v1, v2);
        local v6 = utf8.codepoint(v1, v5, v5);
        if v6 == nil then
            return l_NaN_0;
        else
            return v6;
        end;
    end;
end;
