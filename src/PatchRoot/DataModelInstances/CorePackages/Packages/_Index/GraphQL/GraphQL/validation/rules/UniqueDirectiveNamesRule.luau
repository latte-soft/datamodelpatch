local l_GraphQLError_0 = require(script.Parent.Parent.Parent.error.GraphQLError).GraphQLError;
return {
    UniqueDirectiveNamesRule = function(v1)
        local v2 = {};
        local v3 = v1:getSchema();
        return {
            DirectiveDefinition = function(_, v5)
                local l_value_0 = v5.name.value;
                if not v3 or not v3:getDirective(l_value_0) then
                    if not v2[l_value_0] then
                        v2[l_value_0] = v5.name;
                    else
                        v1:reportError(l_GraphQLError_0.new(("There can be only one directive named \"@%s\"."):format(l_value_0), {
                            v2[l_value_0], 
                            v5.name
                        }));
                    end;
                    return false;
                else
                    v1:reportError(l_GraphQLError_0.new(("Directive \"@%s\" already exists in the schema. It cannot be redefined."):format(l_value_0), v5.name));
                    return ;
                end;
            end
        };
    end
};
