local v0 = require(script.Parent.Parent.Number);
return function(v1)
    local v2 = not not v1;
    if v2 then
        v2 = false;
        if v1 ~= 0 then
            v2 = false;
            if v1 ~= "" then
                v2 = not v0.isNaN(v1);
            end;
        end;
    end;
    return v2;
end;
