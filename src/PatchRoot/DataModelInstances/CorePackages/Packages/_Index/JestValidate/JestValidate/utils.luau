local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Boolean_0 = v1.Boolean;
local l_Error_0 = v1.Error;
local v4 = {};
local v5 = require(l_Parent_0.ChalkLua);
local v6 = setmetatable({}, {
    __index = l_Error_0
});
v6.__index = v6;
v6.new = function(v7, v8, v9)
    local v10 = setmetatable(l_Error_0.new(), v6);
    v9 = if v9 ~= nil and l_Boolean_0.toJSBoolean(v9) then "\n\n" .. v9 else "\n";
    v10.name = "";
    v10.message = v5.red(v5.bold(v7) .. ":\n\n" .. v8 .. v9);
    return v10;
end;
v4.ValidationError = v6;
return v4;
