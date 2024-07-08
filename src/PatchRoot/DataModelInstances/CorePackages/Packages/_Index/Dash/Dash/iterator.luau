local _ = require(script.Parent.Types);
return function(v1)
    if typeof(v1) == "function" then
        return v1;
    elseif typeof(v1) == "table" then
        if #v1 > 0 then
            return ipairs(v1);
        else
            return pairs(v1);
        end;
    else
        return nil;
    end;
end;
