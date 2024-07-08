local l_Parent_0 = script.Parent.Parent.Parent;
local l_GraphQLError_0 = require(l_Parent_0.error.GraphQLError).GraphQLError;
local l_print_0 = require(l_Parent_0.language.printer).print;
local l_isCompositeType_0 = require(l_Parent_0.type.definition).isCompositeType;
local l_typeFromAST_0 = require(l_Parent_0.utilities.typeFromAST).typeFromAST;
return {
    FragmentsOnCompositeTypesRule = function(v5)
        return {
            InlineFragment = function(_, v7)
                local l_typeCondition_0 = v7.typeCondition;
                if l_typeCondition_0 then
                    local v9 = l_typeFromAST_0(v5:getSchema(), l_typeCondition_0);
                    if not (not v9 or l_isCompositeType_0(v9)) then
                        v5:reportError(l_GraphQLError_0.new(("Fragment cannot condition on non composite type \"%s\"."):format((l_print_0(l_typeCondition_0))), l_typeCondition_0));
                    end;
                end;
            end, 
            FragmentDefinition = function(_, v11)
                local v12 = l_typeFromAST_0(v5:getSchema(), v11.typeCondition);
                if not (not v12 or l_isCompositeType_0(v12)) then
                    v5:reportError(l_GraphQLError_0.new(("Fragment \"%s\" cannot condition on non composite type \"%s\"."):format(v11.name.value, (l_print_0(v11.typeCondition))), v11.typeCondition));
                end;
            end
        };
    end
};
