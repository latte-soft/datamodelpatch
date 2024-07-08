local v0 = require(script.Parent.Parent.Rodux);
return function(v1, v2)
    return v0.Store.new(v2 or function(v3)
        return v3;
    end, v1 or {}, {
        v0.thunkMiddleware
    });
end;
