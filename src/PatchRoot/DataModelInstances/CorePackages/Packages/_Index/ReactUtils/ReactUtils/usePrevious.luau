local v0 = require(script:FindFirstAncestor("ReactUtils").Parent.React);
return function(v1)
    local v2 = v0.useRef(nil);
    v0.useEffect(function()
        v2.current = v1;
    end);
    return v2.current;
end;
