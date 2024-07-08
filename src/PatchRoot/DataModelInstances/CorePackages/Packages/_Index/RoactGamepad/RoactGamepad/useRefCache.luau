local v0 = require(script.Parent.Parent.React);
local v1 = require(script.Parent.createRefCache);
return function()
    local v2 = v0.useRef(nil);
    if v2.current == nil then
        v2.current = v1();
    end;
    return v2.current;
end;
