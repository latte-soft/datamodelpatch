local v0 = require(script.Parent.Parent.luaUtils.deepEqual);
return function(v1, v2)
    local v3, v4 = v0(v1, v2);
    local _ = nil;
    return {
        pass = v3, 
        message = if v3 then ("expected: not %s\nreceived:     %s"):format(tostring(v2), (tostring(v1))) else v4:gsub("{1}", "received"):gsub("{2}", "expected")
    };
end;
