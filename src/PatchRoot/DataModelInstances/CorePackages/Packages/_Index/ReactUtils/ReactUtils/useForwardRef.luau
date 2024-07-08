local v0 = require(script:FindFirstAncestor("ReactUtils").Parent.React);
return function(v1, v2)
    local v3 = v0.useRef(nil);
    local v4 = v0.useRef(nil);
    local v6 = v0.useCallback(function(v5)
        if v4.current then
            v4.current();
            v4.current = nil;
        end;
        if v5 then
            v3.current = v5;
            v4.current = v2(v5);
        end;
    end, {
        v2
    });
    v0.useImperativeHandle(v1, function()
        return v3.current;
    end);
    return v6;
end;
