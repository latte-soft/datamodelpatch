local v0 = {};
local l_Parent_0 = script.Parent.Parent.Parent;
local l_Boolean_0 = require(l_Parent_0.Parent.LuauPolyfill).Boolean;
local _ = require(l_Parent_0.core);
local _ = require(script.Parent.types);
local l_useMutation_0 = require(script.Parent.Parent.hooks).useMutation;
v0.Mutation = function(v6)
    local v7, v8 = table.unpack(l_useMutation_0(v6.mutation, v6), 1, 2);
    if not l_Boolean_0.toJSBoolean(v6.children) then
        return nil;
    else
        return v6.children(v7, v8);
    end;
end;
return v0;
