local v0 = require(script.Parent.makeRequestApi);
return function(v1)
    return v0(v1, "PATCH");
end;
