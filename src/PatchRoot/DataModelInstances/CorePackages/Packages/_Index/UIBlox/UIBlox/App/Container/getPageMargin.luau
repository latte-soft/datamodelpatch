local v0 = require(script.Parent.Parent.Parent.Parent.t);
return function(v1)
    assert(v0.number(v1));
    if v1 < 360 then
        return 12;
    elseif v1 < 600 then
        return 24;
    else
        return 48;
    end;
end;
