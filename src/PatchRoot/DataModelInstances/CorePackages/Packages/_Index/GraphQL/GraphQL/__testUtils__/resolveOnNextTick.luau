local v0 = require(script.Parent.Parent.Parent.Promise);
return function()
    return v0.defer(function(v1)
        v1(nil);
    end);
end;
