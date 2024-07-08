local v0 = require(script.Parent.Parent.MagicMock);
return function(v1)
    local v2 = v0.is(v1);
    return {
        pass = v2, 
        message = if not v2 then string.format("Expected object to be a MagicMock. Got %q instead.", (tostring(v1))) else "Expected object to be anything but a MagicMock."
    };
end;
