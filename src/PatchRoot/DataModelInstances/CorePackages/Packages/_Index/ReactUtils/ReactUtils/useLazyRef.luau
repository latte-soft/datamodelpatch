local v0 = require(script:FindFirstAncestor("ReactUtils").Parent.React);
return function(v1)
    local v2 = v0.useRef(nil);
    if v2.current == nil then
        v2.current = v1();
    end;
    assert(v2.current ~= nil, "Ref must be defined after initialization function is called");
    return v2;
end;
