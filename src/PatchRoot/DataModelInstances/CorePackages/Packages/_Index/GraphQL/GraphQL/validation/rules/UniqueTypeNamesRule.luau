local l_GraphQLError_0 = require(script.Parent.Parent.Parent.error.GraphQLError).GraphQLError;
return {
    UniqueTypeNamesRule = function(v1)
        local v2 = {};
        local v3 = v1:getSchema();
        local function v7(_, v5)
            local l_value_0 = v5.name.value;
            if not v3 or not v3:getType(l_value_0) then
                if not v2[l_value_0] then
                    v2[l_value_0] = v5.name;
                else
                    v1:reportError(l_GraphQLError_0.new(("There can be only one type named \"%s\"."):format(l_value_0), {
                        v2[l_value_0], 
                        v5.name
                    }));
                end;
                return false;
            else
                v1:reportError(l_GraphQLError_0.new(("Type \"%s\" already exists in the schema. It cannot also be defined in this type definition."):format(l_value_0), v5.name));
                return ;
            end;
        end;
        return {
            ScalarTypeDefinition = v7, 
            ObjectTypeDefinition = v7, 
            InterfaceTypeDefinition = v7, 
            UnionTypeDefinition = v7, 
            EnumTypeDefinition = v7, 
            InputObjectTypeDefinition = v7
        };
    end
};
