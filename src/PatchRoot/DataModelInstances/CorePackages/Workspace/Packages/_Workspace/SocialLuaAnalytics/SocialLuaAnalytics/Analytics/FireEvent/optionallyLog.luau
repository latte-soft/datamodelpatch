local _ = require(script.Parent.Parent.Types);
return function(v1, v2)
    return function(v3)
        if v1 then
            v1:info(v2(v3));
        end;
        return v3;
    end;
end;
