local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Boolean_0 = v1.Boolean;
local l_Error_0 = v1.Error;
local l_Object_0 = v1.Object;
local l_Set_0 = v1.Set;
local v7 = {};
local _ = require(script.Parent["merge-typedefs_types"]);
local v9 = nil;
local v10 = require(l_Parent_0.GraphQL);
local l_parse_0 = v10.parse;
local l_Kind_0 = v10.Kind;
local l_isSchema_0 = v10.isSchema;
local l_isDefinitionNode_0 = v10.isDefinitionNode;
local v15 = require(script.Parent.utils);
local l_defaultStringComparator_0 = v15.defaultStringComparator;
local l_isSourceTypes_0 = v15.isSourceTypes;
local l_isStringTypes_0 = v15.isStringTypes;
local v19 = require(script.Parent["merge-nodes"]);
local l_mergeGraphQLNodes_0 = v19.mergeGraphQLNodes;
local l_schemaDefSymbol_0 = v19.schemaDefSymbol;
local v22 = require(l_Parent_0.Utils);
local l_getDocumentNodeFromSchema_0 = v22.getDocumentNodeFromSchema;
local l_isDocumentNode_0 = v22.isDocumentNode;
local l_resetComments_0 = v22.resetComments;
local l_printWithComments_0 = v22.printWithComments;
local l_DEFAULT_OPERATION_TYPE_NAME_MAP_0 = require(script.Parent["schema-def"]).DEFAULT_OPERATION_TYPE_NAME_MAP;
v7.mergeTypeDefs = function(v28, v29)
    l_resetComments_0();
    local v30 = {
        kind = l_Kind_0.DOCUMENT, 
        definitions = v9(v28, l_Object_0.assign({}, {
            useSchemaDefinition = true, 
            forceSchemaDefinition = false, 
            throwOnConflict = false, 
            commentDescriptions = false
        }, v29))
    };
    local v31 = nil;
    v31 = if not not v29 and v29.commentDescriptions then l_printWithComments_0(v30) else v30;
    l_resetComments_0();
    return v31;
end;
local function v32(v33, v34, v35, v36)
    local v37 = if v35 ~= nil then v35 else {};
    local v38 = if v36 ~= nil then v36 else l_Set_0.new();
    if l_Boolean_0.toJSBoolean(if not l_Boolean_0.toJSBoolean(v33) then v33 else not l_Boolean_0.toJSBoolean(v38:has(v33))) then
        v38:add(v33);
        if typeof(v33) == "function" then
            v32(v33(), v34, v37, v38);
            return v37;
        elseif not l_Boolean_0.toJSBoolean(l_Array_0.isArray(v33)) then
            if not l_Boolean_0.toJSBoolean(l_isSchema_0(v33)) then
                local l_toJSBoolean_0 = l_Boolean_0.toJSBoolean;
                local v40 = l_isStringTypes_0(v33);
                if not l_toJSBoolean_0(not not l_Boolean_0.toJSBoolean(v40) and v40 or l_isSourceTypes_0(v33)) then
                    l_toJSBoolean_0 = l_Boolean_0.toJSBoolean;
                    local v41 = false;
                    if typeof(v33) == "table" then
                        v41 = l_isDefinitionNode_0(v33);
                    end;
                    if not l_toJSBoolean_0(v41) then
                        if not l_isDocumentNode_0(v33) then
                            error(l_Error_0.new(("typeDefs must contain only strings, documents, schemas, or functions, got %s"):format((tostring((typeof(v33)))))));
                        else
                            v32(v33.definitions, v34, v37, v38);
                            return v37;
                        end;
                    else
                        table.insert(v37, v33);
                        return v37;
                    end;
                else
                    v32(l_parse_0(v33, v34).definitions, v34, v37, v38);
                    return v37;
                end;
            else
                v32(l_getDocumentNodeFromSchema_0(v33, v34).definitions, v34, v37, v38);
                return v37;
            end;
        else
            for _, v43 in v33, nil, nil do
                v32(v43, v34, v37, v38);
            end;
            return v37;
        end;
    end;
    return v37;
end;
v9 = function(v44, v45)
    l_resetComments_0();
    local v46 = l_mergeGraphQLNodes_0(v32(v44, v45), v45);
    if not (not v45 or not l_Boolean_0.toJSBoolean(v45.useSchemaDefinition)) then
        local v47 = not not l_Boolean_0.toJSBoolean(v46:get(l_schemaDefSymbol_0)) and v46:get(l_schemaDefSymbol_0) or {
            kind = l_Kind_0.SCHEMA_DEFINITION, 
            operationTypes = {}
        };
        local l_operationTypes_0 = v47.operationTypes;
        for v49 in l_DEFAULT_OPERATION_TYPE_NAME_MAP_0, nil, nil do
            if not l_Boolean_0.toJSBoolean((l_Array_0.find(l_operationTypes_0, function(v50)
                return v50.operation == v49;
            end))) then
                local v51 = v46:get(l_DEFAULT_OPERATION_TYPE_NAME_MAP_0[tostring(v49)]);
                if v51 ~= nil and v51.name ~= nil then
                    table.insert(l_operationTypes_0, {
                        kind = l_Kind_0.OPERATION_TYPE_DEFINITION, 
                        type = {
                            kind = l_Kind_0.NAMED_TYPE, 
                            name = v51.name
                        }, 
                        operation = v49
                    });
                end;
            end;
        end;
        if (typeof(v47) == "table" and typeof(v47.operationTypes) == "table") and #v47.operationTypes > 0 then
            v46:set(l_schemaDefSymbol_0, v47);
        end;
    end;
    if not (not v45 or not l_Boolean_0.toJSBoolean(v45.forceSchemaDefinition)) and (not (typeof(v46:get(l_schemaDefSymbol_0)) == "table" and typeof(v46:get(l_schemaDefSymbol_0).operationTypes) == "table") or #v46:get(l_schemaDefSymbol_0).operationTypes <= 0) then
        v46:set(l_schemaDefSymbol_0, {
            kind = l_Kind_0.SCHEMA_DEFINITION, 
            operationTypes = {
                {
                    kind = l_Kind_0.OPERATION_TYPE_DEFINITION, 
                    operation = "query", 
                    type = {
                        kind = l_Kind_0.NAMED_TYPE, 
                        name = {
                            kind = l_Kind_0.NAME, 
                            value = "Query"
                        }
                    }
                }
            }
        });
    end;
    local v52 = v46:values();
    if not (not v45 or not l_Boolean_0.toJSBoolean(v45.sort)) then
        local v53 = if typeof(v45.sort) == "function" then v45.sort else l_defaultStringComparator_0;
        l_Array_0.sort(v52, function(v54, v55)
            return v53(if typeof(v54.name) == "table" then v54.name.value else nil, if typeof(v55.name) == "table" then v55.name.value else nil);
        end);
    end;
    return v52;
end;
v7.mergeGraphQLTypes = v9;
return v7;
