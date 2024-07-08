local _ = require(script.Parent.Constants);
return function(v1, v2, v3, v4)
    local v5 = string.format("rbxthumb://type=%s&id=%s&w=%d&h=%d", v2, tostring(v1), v3, v3);
    if v4 then
        v5 = v5 .. "&filters=circular";
    end;
    return v5;
end;
