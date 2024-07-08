local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Error_0 = require(l_Parent_1.LuauPolyfill).Error;
local v3 = require(l_Parent_1.Promise);
local _ = require(l_Parent_0.jsutils.PromiseOrValue);
local l_isPromise_0 = require(l_Parent_0.jsutils.isPromise).isPromise;
local _ = require(l_Parent_0.language.source);
local l_parse_0 = require(l_Parent_0.language.parser).parse;
local _ = require(l_Parent_0.type.definition);
local _ = require(l_Parent_0.type.schema);
local l_validate_0 = require(l_Parent_0.validation.validate).validate;
local l_validateSchema_0 = require(l_Parent_0.type.validate).validateSchema;
local l_execute_0 = require(l_Parent_0.execution.execute).execute;
local v13 = {};
local v14 = nil;
v13.graphql = function(v15)
    return v3.new(function(v16)
        return v16(v14(v15));
    end);
end;
v13.graphqlSync = function(v17)
    local v18 = v14(v17);
    if l_isPromise_0(v18) then
        error(l_Error_0.new("GraphQL execution failed to complete synchronously."));
    end;
    return v18;
end;
v14 = function(v19)
    local l_schema_0 = v19.schema;
    local l_source_0 = v19.source;
    local l_rootValue_0 = v19.rootValue;
    local l_contextValue_0 = v19.contextValue;
    local l_variableValues_0 = v19.variableValues;
    local l_operationName_0 = v19.operationName;
    local l_fieldResolver_0 = v19.fieldResolver;
    local l_typeResolver_0 = v19.typeResolver;
    local v28 = l_validateSchema_0(l_schema_0);
    if #v28 > 0 then
        return {
            errors = v28
        };
    else
        local v29 = nil;
        local l_status_0, l_result_0 = pcall(function()
            v29 = l_parse_0(l_source_0);
        end);
        if l_status_0 then
            local v32 = l_validate_0(l_schema_0, v29);
            if #v32 > 0 then
                return {
                    errors = v32
                };
            else
                return l_execute_0({
                    schema = l_schema_0, 
                    document = v29, 
                    rootValue = l_rootValue_0, 
                    contextValue = l_contextValue_0, 
                    variableValues = l_variableValues_0, 
                    operationName = l_operationName_0, 
                    fieldResolver = l_fieldResolver_0, 
                    typeResolver = l_typeResolver_0
                });
            end;
        else
            return {
                errors = {
                    l_result_0
                }
            };
        end;
    end;
end;
return v13;
