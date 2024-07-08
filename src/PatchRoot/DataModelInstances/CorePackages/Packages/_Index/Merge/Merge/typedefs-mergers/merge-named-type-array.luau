local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Boolean_0 = v1.Boolean;
local v4 = {};
local _ = require(l_Parent_0.GraphQL);
local _ = require(script.Parent["merge-typedefs_types"]);
local l_compareNodes_0 = require(l_Parent_0.Utils).compareNodes;
local function _(v8, v9)
    return not not l_Boolean_0.toJSBoolean(l_Array_0.find(v8, function(v10)
        return v10.name.value == v9.name.value;
    end));
end;
v4.mergeNamedTypeArray = function(v12, v13, v14)
    local v15 = if v12 ~= nil then v12 else {};
    local v16 = if v13 ~= nil then v13 else {};
    local v17 = if v14 ~= nil then v14 else {};
    local v20 = l_Array_0.concat({}, v16, l_Array_0.filter(v15, function(v18)
        return not l_Boolean_0.toJSBoolean(not not l_Boolean_0.toJSBoolean(l_Array_0.find(v16, function(v19)
            return v19.name.value == v18.name.value;
        end)));
    end));
    if not (not v17 or not l_Boolean_0.toJSBoolean(v17.sort)) then
        l_Array_0.sort(v20, l_compareNodes_0);
    end;
    return v20;
end;
return v4;
