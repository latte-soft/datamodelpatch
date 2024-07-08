local l_setTimeout_0 = require(script.Parent.Parent.Parent.Parent.LuauPolyfill).setTimeout;
local v1 = {};
local function _(v2)
    return (v2());
end;
v1.getSetTimeoutFn = function()
    return ((function()
        return l_setTimeout_0;
    end)());
end;
return v1;
