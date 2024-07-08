local l_Error_0 = require(script.Parent.Parent.Parent.LuauPolyfill).Error;
local v1 = {};
v1.__index = v1;
v1.new = function(v2)
    return (setmetatable({
        name = "TypeError", 
        message = v2 or "", 
        stack = debug.traceback(nil, 2)
    }, l_Error_0));
end;
return v1;
