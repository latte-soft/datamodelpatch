local v0 = require(script:FindFirstAncestor("RoactUtils").Parent.React);
local v1 = require(script.Parent.dependencyArray);
return function(v2, v3)
    local v4 = v0.useRef(false);
    v0.useEffect(function()
        if not (not v3 or v4.current) then
            v2();
            v4.current = true;
        end;
    end, v1(v3));
end;
