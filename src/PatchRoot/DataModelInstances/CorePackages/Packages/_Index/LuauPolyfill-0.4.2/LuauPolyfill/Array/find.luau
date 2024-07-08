local _ = require(script.Parent.Parent.types);
return function(v1, v2)
    for v3 = 1, #v1 do
        local v4 = v1[v3];
        if v2(v4, v3, v1) then
            return v4;
        end;
    end;
    return nil;
end;
