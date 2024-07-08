local l_GraphQLError_0 = require(script.Parent.Parent.Parent.error.GraphQLError).GraphQLError;
return {
    UniqueOperationTypesRule = function(v1)
        local v2 = v1:getSchema();
        local v3 = {};
        local v4 = not not v2 and {
            query = v2:getQueryType(), 
            mutation = v2:getMutationType(), 
            subscription = v2:getSubscriptionType()
        } or {};
        local function v12(_, v6)
            local v7 = v6.operationTypes or {};
            for _, v9 in ipairs(v7) do
                local l_operation_0 = v9.operation;
                local v11 = v3[l_operation_0];
                if not v4[l_operation_0] then
                    if not v11 then
                        v3[l_operation_0] = v9;
                    else
                        v1:reportError(l_GraphQLError_0.new(("There can be only one %s type in schema."):format(l_operation_0), {
                            v11, 
                            v9
                        }));
                    end;
                else
                    v1:reportError(l_GraphQLError_0.new(("Type for %s already defined in the schema. It cannot be redefined."):format(l_operation_0), v9));
                end;
            end;
            return false;
        end;
        return {
            SchemaDefinition = v12, 
            SchemaExtension = v12
        };
    end
};
