local v0 = require(script.Parent.Parent.Spy);
return function(v1)
    local v2 = v0.is(v1);
    return {
        pass = v2, 
        message = if not v2 then string.format("Expected object to be a Spy. Got %q instead.", (tostring(v1))) else "Expected object to be anything but a Spy."
    };
end;
