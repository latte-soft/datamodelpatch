local l_Parent_0 = script.Parent.Parent.Parent;
local l_inspect_0 = require(l_Parent_0.jsutils.inspect).inspect;
local l_GraphQLError_0 = require(l_Parent_0.error.GraphQLError).GraphQLError;
local l_Kind_0 = require(l_Parent_0.language.kinds).Kind;
local l_isNonNullType_0 = require(l_Parent_0.type.definition).isNonNullType;
local l_utilities_0 = l_Parent_0.utilities;
local l_typeFromAST_0 = require(l_utilities_0.typeFromAST).typeFromAST;
local l_isTypeSubTypeOf_0 = require(l_utilities_0.typeComparators).isTypeSubTypeOf;
local v8 = {};
local v9 = nil;
v8.VariablesInAllowedPositionRule = function(v10)
    local v11 = {};
    return {
        OperationDefinition = {
            enter = function()
                v11 = {};
            end, 
            leave = function(_, v13)
                for _, v15 in ipairs((v10:getRecursiveVariableUsages(v13))) do
                    local l_node_0 = v15.node;
                    local l_type_0 = v15.type;
                    local l_defaultValue_0 = v15.defaultValue;
                    local l_value_0 = l_node_0.name.value;
                    local v20 = v11[l_value_0];
                    if not (not v20 or not l_type_0) then
                        local v21 = v10:getSchema();
                        local v22 = l_typeFromAST_0(v21, v20.type);
                        if not (not v22 or v9(v21, v22, v20.defaultValue, l_type_0, l_defaultValue_0)) then
                            v10:reportError(l_GraphQLError_0.new(("Variable \"$%s\" of type \"%s\" used in position expecting type \"%s\"."):format(l_value_0, l_inspect_0(v22), (l_inspect_0(l_type_0))), {
                                v20, 
                                l_node_0
                            }));
                        end;
                    end;
                end;
            end
        }, 
        VariableDefinition = function(_, v24)
            v11[v24.variable.name.value] = v24;
        end
    };
end;
v9 = function(v25, v26, v27, v28, v29)
    if not l_isNonNullType_0(v28) or l_isNonNullType_0(v26) then
        return l_isTypeSubTypeOf_0(v25, v26, v28);
    else
        local v30 = false;
        if v27 ~= nil then
            v30 = v27.kind ~= l_Kind_0.NULL;
        end;
        local v31 = v29 ~= nil;
        if v30 or v31 then
            return l_isTypeSubTypeOf_0(v25, v26, v28.ofType);
        else
            return false;
        end;
    end;
end;
return v8;
