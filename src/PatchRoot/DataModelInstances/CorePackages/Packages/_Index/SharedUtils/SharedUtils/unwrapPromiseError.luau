local v0 = require(script.Parent.Parent.Promise);
return function(v1)
    while v0.Error.is(v1) do
        v1 = v1.error;
    end;
    return v1;
end;
