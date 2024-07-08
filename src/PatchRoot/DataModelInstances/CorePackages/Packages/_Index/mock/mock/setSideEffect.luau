local v0 = require(script.Parent.symbols);
return function(v1, v2)
    local v3 = getmetatable(v1);
    local v4 = nil;
    if v2 then
        v4 = {
            value = v2, 
            calls = 0
        };
    end;
    v3[v0.SideEffect] = v4;
end;
