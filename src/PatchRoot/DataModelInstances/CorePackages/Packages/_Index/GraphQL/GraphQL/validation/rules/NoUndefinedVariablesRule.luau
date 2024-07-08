local l_GraphQLError_0 = require(script.Parent.Parent.Parent.error.GraphQLError).GraphQLError;
return {
    NoUndefinedVariablesRule = function(v1)
        local v2 = {};
        return {
            OperationDefinition = {
                enter = function()
                    v2 = {};
                end, 
                leave = function(_, v4)
                    for _, v6 in ipairs((v1:getRecursiveVariableUsages(v4))) do
                        local l_node_0 = v6.node;
                        local l_value_0 = l_node_0.name.value;
                        if v2[l_value_0] ~= true then
                            v1:reportError(l_GraphQLError_0.new(not not v4.name and ("Variable \"$%s\" is not defined by operation \"%s\"."):format(l_value_0, v4.name.value) or ("Variable \"$%s\" is not defined."):format(l_value_0), {
                                l_node_0, 
                                v4
                            }));
                        end;
                    end;
                end
            }, 
            VariableDefinition = function(_, v10)
                v2[v10.variable.name.value] = true;
            end
        };
    end
};
