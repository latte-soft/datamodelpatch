local v0 = require(script.Parent.Parent.LuauPolyfill);
local l_Boolean_0 = v0.Boolean;
local l_Error_0 = v0.Error;
local v3 = {};
local v4 = setmetatable({}, {
    __index = l_Error_0
});
v4.__index = v4;
v4.new = function(v5, v6, v7)
    local l_stackTraceLimit_0 = l_Error_0.stackTraceLimit;
    if v7 ~= nil and v7 ~= 0 then
        l_Error_0.stackTraceLimit = math.max(v7, not not l_Boolean_0.toJSBoolean(l_stackTraceLimit_0) and l_stackTraceLimit_0 or 10);
    end;
    local v9 = setmetatable(l_Error_0.new(v5), v4);
    if l_Error_0.captureStackTrace then
        l_Error_0.captureStackTrace(v9, v6);
    end;
    l_Error_0.stackTraceLimit = l_stackTraceLimit_0;
    return v9;
end;
v3.default = v4;
return v3;
