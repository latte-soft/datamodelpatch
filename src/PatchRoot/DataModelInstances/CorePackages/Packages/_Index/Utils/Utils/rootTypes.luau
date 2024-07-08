local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Boolean_0 = v1.Boolean;
local l_Error_0 = v1.Error;
local l_Map_0 = v1.Map;
local l_Set_0 = v1.Set;
local v7 = {};
local _ = require(l_Parent_0.GraphQL);
local l_memoize1_0 = require(script.Parent.memoize).memoize1;
local v10 = nil;
local v11 = nil;
v7.getDefinedRootType = function(v12, v13)
    local v14 = v10(v12):get(v13);
    if v14 == nil then
        error(l_Error_0.new(("Root type for operation \"%s\" not defined by the given schema."):format((tostring(v13)))));
    end;
    return v14;
end;
local function _(v15)
    local v16 = {};
    v15:forEach(function(v17)
        table.insert(v16, v17);
    end);
    return v16;
end;
v7.getRootTypeNames = l_memoize1_0(function(v19)
    local v20 = v11(v19);
    local l_new_0 = l_Set_0.new;
    local l_map_0 = l_Array_0.map;
    local l_concat_0 = l_Array_0.concat;
    local v24 = {};
    local v25 = {};
    v20:forEach(function(v26)
        table.insert(v25, v26);
    end);
    return l_new_0(l_map_0(l_concat_0(v24, v25), function(v27)
        return v27.name;
    end));
end);
v11 = l_memoize1_0(function(v28)
    return l_Set_0.new(v10(v28):values());
end);
v7.getRootTypes = v11;
v10 = l_memoize1_0(function(v29)
    local v30 = l_Map_0.new();
    local v31 = v29:getQueryType();
    if l_Boolean_0.toJSBoolean(v31) then
        v30:set("query", v31);
    end;
    local v32 = v29:getMutationType();
    if l_Boolean_0.toJSBoolean(v32) then
        v30:set("mutation", v32);
    end;
    local v33 = v29:getSubscriptionType();
    if l_Boolean_0.toJSBoolean(v33) then
        v30:set("subscription", v33);
    end;
    return v30;
end);
v7.getRootTypeMap = v10;
return v7;
