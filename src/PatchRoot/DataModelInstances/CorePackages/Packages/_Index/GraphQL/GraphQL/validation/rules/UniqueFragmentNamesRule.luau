local l_GraphQLError_0 = require(script.Parent.Parent.Parent.error.GraphQLError).GraphQLError;
return {
    UniqueFragmentNamesRule = function(v1)
        local v2 = {};
        return {
            OperationDefinition = function()
                return false;
            end, 
            FragmentDefinition = function(_, v4)
                local l_value_0 = v4.name.value;
                if not v2[l_value_0] then
                    v2[l_value_0] = v4.name;
                else
                    v1:reportError(l_GraphQLError_0.new(("There can be only one fragment named \"%s\"."):format(l_value_0), {
                        v2[l_value_0], 
                        v4.name
                    }));
                end;
                return false;
            end
        };
    end
};
