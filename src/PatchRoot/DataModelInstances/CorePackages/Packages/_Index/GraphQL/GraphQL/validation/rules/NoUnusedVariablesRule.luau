local l_GraphQLError_0 = require(script.Parent.Parent.Parent.error.GraphQLError).GraphQLError;
return {
    NoUnusedVariablesRule = function(v1)
        local v2 = {};
        return {
            OperationDefinition = {
                enter = function()
                    v2 = {};
                end, 
                leave = function(_, v4)
                    local v5 = {};
                    for _, v7 in ipairs((v1:getRecursiveVariableUsages(v4))) do
                        v5[v7.node.name.value] = true;
                    end;
                    for _, v9 in ipairs(v2) do
                        local l_value_0 = v9.variable.name.value;
                        if v5[l_value_0] ~= true then
                            v1:reportError(l_GraphQLError_0.new(not not v4.name and ("Variable \"$%s\" is never used in operation \"%s\"."):format(l_value_0, v4.name.value) or ("Variable \"$%s\" is never used."):format(l_value_0), v9));
                        end;
                    end;
                end
            }, 
            VariableDefinition = function(_, v12)
                table.insert(v2, v12);
            end
        };
    end
};
