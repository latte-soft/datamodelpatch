local v0 = require(script.Parent.ActionBindableEvent);
return function(v1, _)
    return function(v3)
        v0:Fire(v3);
        v1(v3);
    end;
end;
