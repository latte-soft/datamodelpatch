local _ = require(script.Parent.Types);
return function(v1)
    return function(v2)
        v1:reportCounter(v2.name, v2.count or 1);
        return v2;
    end;
end;
