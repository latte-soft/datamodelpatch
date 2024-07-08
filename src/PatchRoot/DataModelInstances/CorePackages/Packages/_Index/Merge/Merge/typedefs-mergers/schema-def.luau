local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Boolean_0 = v1.Boolean;
local l_Object_0 = v1.Object;
local v5 = {};
local l_Kind_0 = require(l_Parent_0.GraphQL).Kind;
local l_mergeDirectives_0 = require(script.Parent.directives).mergeDirectives;
local _ = require(script.Parent["merge-typedefs_types"]);
local v9 = {
    query = "Query", 
    mutation = "Mutation", 
    subscription = "Subscription"
};
v5.DEFAULT_OPERATION_TYPE_NAME_MAP = v9;
local function v21(v10, v11)
    local v12 = if v10 ~= nil then v10 else {};
    local v13 = if v11 ~= nil then v11 else {};
    local v14 = {};
    for _, v16 in v9, nil, nil do
        local v18 = l_Array_0.find(v12, function(v17)
            return v17.operation == v16;
        end);
        local v20 = not not l_Boolean_0.toJSBoolean(v18) and v18 or l_Array_0.find(v13, function(v19)
            return v19.operation == v16;
        end);
        if v20 then
            table.insert(v14, v20);
        end;
    end;
    return v14;
end;
v5.mergeSchemaDefs = function(v22, v23, v24)
    if not l_Boolean_0.toJSBoolean(v23) then
        if not v24 or not l_Boolean_0.toJSBoolean(v24.convertExtensions) then
            return v22;
        else
            return (l_Object_0.assign({}, v22, {
                kind = l_Kind_0.SCHEMA_DEFINITION
            }));
        end;
    else
        return {
            kind = if not (v22.kind ~= l_Kind_0.SCHEMA_DEFINITION) or v23.kind == l_Kind_0.SCHEMA_DEFINITION then l_Kind_0.SCHEMA_DEFINITION else l_Kind_0.SCHEMA_EXTENSION, 
            description = not not l_Boolean_0.toJSBoolean(v22.description) and v22.description or v23.description, 
            directives = l_mergeDirectives_0(v22.directives, v23.directives, v24), 
            operationTypes = v21(v22.operationTypes, v23.operationTypes)
        };
    end;
end;
return v5;
