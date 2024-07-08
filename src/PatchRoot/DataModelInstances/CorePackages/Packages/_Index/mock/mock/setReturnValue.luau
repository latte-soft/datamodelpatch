local v0 = require(script.Parent.symbols);
return function(v1, v2)
    getmetatable(v1)[v0.ReturnValue] = {
        v2
    };
end;
