local v0 = require(script:FindFirstAncestor("RoactUtils").Parent.React);
return function(v1)
    local v2 = v0.useRef(false);
    local v3 = v0.useRef(false);
    v0.useEffect(function()
        if v2.current then
            if not v3.current then
                v3.current = true;
            end;
            if v1 then
                v1();
            end;
            return ;
        else
            v2.current = true;
            return ;
        end;
    end);
    return v3;
end;
