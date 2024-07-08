local v0 = {};
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Error_0 = require(l_Parent_1.LuauPolyfill).Error;
local _ = require(l_Parent_1.GraphQL);
local _ = require(l_Parent_0.utilities.graphql.types);
local v6 = setmetatable({}, {
    __index = l_Error_0
});
v6.__index = v6;
v6.new = function(v7, v8, v9, v10)
    local v11 = l_Error_0.new(v7);
    v11.message = v7;
    v11.path = v8;
    v11.query = v9;
    v11.variables = v10;
    return (setmetatable(v11, v6));
end;
v0.MissingFieldError = v6;
return v0;
