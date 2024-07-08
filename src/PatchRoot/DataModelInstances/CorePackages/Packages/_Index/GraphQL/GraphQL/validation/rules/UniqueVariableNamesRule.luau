local l_GraphQLError_0 = require(script.Parent.Parent.Parent.error.GraphQLError).GraphQLError;
return {
    UniqueVariableNamesRule = function(v1)
        local v2 = {};
        return {
            OperationDefinition = function()
                v2 = {};
            end, 
            VariableDefinition = function(_, v4)
                local l_value_0 = v4.variable.name.value;
                if not v2[l_value_0] then
                    v2[l_value_0] = v4.variable.name;
                    return ;
                else
                    v1:reportError(l_GraphQLError_0.new(("There can be only one variable named \"$%s\"."):format(l_value_0), {
                        v2[l_value_0], 
                        v4.variable.name
                    }));
                    return ;
                end;
            end
        };
    end
};
