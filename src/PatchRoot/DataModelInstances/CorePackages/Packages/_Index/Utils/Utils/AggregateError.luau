local v0 = require(script.Parent.Parent.LuauPolyfill);
local l_Array_0 = v0.Array;
local l_Object_0 = v0.Object;
local l_Error_0 = v0.Error;
local v4 = {};
local _ = nil;
local v6 = nil;
v6 = setmetatable({}, {
    __index = l_Error_0
});
v6.__index = v6;
v6.new = function(v7, v8)
    local v9 = setmetatable(l_Error_0.new(if v8 ~= nil then v8 else ""), v6);
    v9.errors = v7;
    v9.name = "AggregateError";
    l_Error_0.captureStackTrace(v9, v6.new);
    return v9;
end;
v4.AggregateError = setmetatable(v6, {
    __call = function(_, v11, v12)
        return v6.new(v11, v12);
    end
});
v4.isAggregateError = function(v13)
    local v14 = false;
    if l_Array_0.indexOf(l_Object_0.keys(v13), "errors") ~= -1 then
        v14 = l_Array_0.isArray(v13.errors);
    end;
    return v14;
end;
return v4;
