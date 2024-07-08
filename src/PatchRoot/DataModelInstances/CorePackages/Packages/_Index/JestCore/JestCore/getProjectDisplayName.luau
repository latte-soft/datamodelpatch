local l_Parent_0 = script.Parent.Parent;
local l_Boolean_0 = require(l_Parent_0.LuauPolyfill).Boolean;
local v2 = {};
local _ = require(l_Parent_0.JestTypes);
v2.default = function(v4)
    local v5 = if typeof(v4.displayName) == "table" then v4.displayName.name else nil;
    return not not l_Boolean_0.toJSBoolean(v5) and v5 or nil;
end;
return v2;
