local v0 = require(script:FindFirstAncestor("LazyRequire").Parent.React);
return function(v1)
    return function(v2)
        return v0.createElement(v1(), v2);
    end;
end;
