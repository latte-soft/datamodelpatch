local _ = require(script.Parent.Parent.types);
return function(v1, v2)
    for v3 = 1, #v1 do
        if v2(v1[v3], v3, v1) then
            return v3;
        end;
    end;
    return -1;
end;
