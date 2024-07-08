local l_GraphQLError_0 = require(script.Parent.Parent.Parent.error.GraphQLError).GraphQLError;
return {
    UniqueOperationNamesRule = function(v1)
        local v2 = {};
        return {
            OperationDefinition = function(_, v4)
                local l_name_0 = v4.name;
                if l_name_0 then
                    if not v2[l_name_0.value] then
                        v2[l_name_0.value] = l_name_0;
                    else
                        v1:reportError(l_GraphQLError_0.new(("There can be only one operation named \"%s\"."):format(l_name_0.value), {
                            v2[l_name_0.value], 
                            l_name_0
                        }));
                    end;
                end;
                return false;
            end, 
            FragmentDefinition = function()
                return false;
            end
        };
    end
};
