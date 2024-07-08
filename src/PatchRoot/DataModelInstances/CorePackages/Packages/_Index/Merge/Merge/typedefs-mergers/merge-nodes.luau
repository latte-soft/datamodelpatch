local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Boolean_0 = v1.Boolean;
local l_Object_0 = v1.Object;
local l_Map_0 = v1.Map;
local v6 = {};
local _ = require(script.Parent["merge-typedefs_types"]);
local l_Kind_0 = require(l_Parent_0.GraphQL).Kind;
local l_mergeType_0 = require(script.Parent.type).mergeType;
local l_mergeEnum_0 = require(script.Parent.enum).mergeEnum;
local l_mergeScalar_0 = require(script.Parent.scalar).mergeScalar;
local l_mergeUnion_0 = require(script.Parent.union).mergeUnion;
local l_mergeInputType_0 = require(script.Parent["input-type"]).mergeInputType;
local l_mergeInterface_0 = require(script.Parent.interface).mergeInterface;
local l_mergeDirective_0 = require(script.Parent.directives).mergeDirective;
local l_mergeSchemaDefs_0 = require(script.Parent["schema-def"]).mergeSchemaDefs;
local l_collectComment_0 = require(l_Parent_0.Utils).collectComment;
v6.schemaDefSymbol = "SCHEMA_DEF_SYMBOL";
v6.isNamedDefinitionNode = function(v18)
    return l_Array_0.indexOf(l_Object_0.keys(v18), "name") ~= -1;
end;
v6.mergeGraphQLNodes = function(v19, v20)
    local v21 = l_Map_0.new();
    for _, v23 in v19, nil, nil do
        if not l_Boolean_0.toJSBoolean(l_Array_0.indexOf(l_Object_0.keys(v23), "name") ~= -1) then
            if not (v23.kind ~= l_Kind_0.SCHEMA_DEFINITION) or v23.kind == l_Kind_0.SCHEMA_EXTENSION then
                v21:set("SCHEMA_DEF_SYMBOL", l_mergeSchemaDefs_0(v23, v21:get("SCHEMA_DEF_SYMBOL"), v20));
            end;
        else
            local v24 = if typeof(v23.name) == "table" then v23.name.value else nil;
            if not (not v20 or not l_Boolean_0.toJSBoolean(v20.commentDescriptions)) then
                l_collectComment_0(v23);
            end;
            if v24 ~= nil then
                if not ((v20 and typeof(v20.exclusions) == "table") and l_Array_0.includes(v20.exclusions, v24 .. ".*")) and (not (v20 and typeof(v20.exclusions) == "table") or not l_Array_0.includes(v20.exclusions, v24)) then
                    local l_kind_0 = v23.kind;
                    if not (l_kind_0 ~= l_Kind_0.OBJECT_TYPE_DEFINITION) or l_kind_0 == l_Kind_0.OBJECT_TYPE_EXTENSION then
                        v21:set(v24, l_mergeType_0(v23, v21:get(v24), v20));
                    elseif not (l_kind_0 ~= l_Kind_0.ENUM_TYPE_DEFINITION) or l_kind_0 == l_Kind_0.ENUM_TYPE_EXTENSION then
                        v21:set(v24, l_mergeEnum_0(v23, v21:get(v24), v20));
                    elseif not (l_kind_0 ~= l_Kind_0.UNION_TYPE_DEFINITION) or l_kind_0 == l_Kind_0.UNION_TYPE_EXTENSION then
                        v21:set(v24, l_mergeUnion_0(v23, v21:get(v24), v20));
                    elseif not (l_kind_0 ~= l_Kind_0.SCALAR_TYPE_DEFINITION) or l_kind_0 == l_Kind_0.SCALAR_TYPE_EXTENSION then
                        v21:set(v24, l_mergeScalar_0(v23, v21:get(v24), v20));
                    elseif not (l_kind_0 ~= l_Kind_0.INPUT_OBJECT_TYPE_DEFINITION) or l_kind_0 == l_Kind_0.INPUT_OBJECT_TYPE_EXTENSION then
                        v21:set(v24, l_mergeInputType_0(v23, v21:get(v24), v20));
                    elseif not (l_kind_0 ~= l_Kind_0.INTERFACE_TYPE_DEFINITION) or l_kind_0 == l_Kind_0.INTERFACE_TYPE_EXTENSION then
                        v21:set(v24, l_mergeInterface_0(v23, v21:get(v24), v20));
                    elseif l_kind_0 == l_Kind_0.DIRECTIVE_DEFINITION then
                        v21:set(v24, l_mergeDirective_0(v23, (v21:get(v24))));
                    end;
                else
                    v21:delete(v24);
                end;
            end;
        end;
    end;
    return v21;
end;
return v6;
