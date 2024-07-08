local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Boolean_0 = v1.Boolean;
local l_Map_0 = v1.Map;
local v5 = {};
local _ = require(l_Parent_0.GraphQL);
local l_mergeDirectives_0 = require(script.Parent.directives).mergeDirectives;
local _ = require(script.Parent["merge-typedefs_types"]);
local l_compareNodes_0 = require(l_Parent_0.Utils).compareNodes;
v5.mergeEnumValues = function(v10, v11, v12)
    if l_Boolean_0.toJSBoolean(if typeof(v12) == "table" then v12.consistentEnumMerge else nil) then
        local v13 = {};
        if l_Boolean_0.toJSBoolean(v10) then
            v13 = l_Array_0.concat(v13, v10);
        end;
        v10 = v11;
        v11 = v13;
    end;
    local v14 = l_Map_0.new();
    if v10 then
        for _, v16 in v10, nil, nil do
            v14:set(v16.name.value, v16);
        end;
    end;
    if v11 then
        for _, v18 in v11, nil, nil do
            local l_value_0 = v18.name.value;
            if not l_Boolean_0.toJSBoolean(v14:has(l_value_0)) then
                v14:set(l_value_0, v18);
            else
                local v20 = v14:get(l_value_0);
                v20.description = not not l_Boolean_0.toJSBoolean(v18.description) and v18.description or v20.description;
                v20.directives = l_mergeDirectives_0(v18.directives, v20.directives);
            end;
        end;
    end;
    local v21 = l_Array_0.concat({}, v14:values());
    if not (not v12 or not l_Boolean_0.toJSBoolean(v12.sort)) then
        l_Array_0.sort(v21, l_compareNodes_0);
    end;
    return v21;
end;
return v5;
