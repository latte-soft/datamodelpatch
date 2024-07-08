local v0 = require(script.Parent.Parent.React);
return function(v1, v2)
    local v3 = v0.useRef(nil);
    return (v0.useCallback(function(v4)
        if not (not v3.current or not v2) then
            v2(v3.current);
        end;
        if v4 then
            v1(v4);
        end;
        v3.current = v4;
    end, {
        v1, 
        v2
    }));
end;
