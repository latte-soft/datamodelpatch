local l_Parent_0 = script.Parent.Parent.Parent;
local l_GraphQLError_0 = require(l_Parent_0.error.GraphQLError).GraphQLError;
local l_print_0 = require(l_Parent_0.language.printer).print;
local l_isInputType_0 = require(l_Parent_0.type.definition).isInputType;
local l_typeFromAST_0 = require(l_Parent_0.utilities.typeFromAST).typeFromAST;
return {
    VariablesAreInputTypesRule = function(v5)
        return {
            VariableDefinition = function(_, v7)
                local v8 = l_typeFromAST_0(v5:getSchema(), v7.type);
                if not (not v8 or l_isInputType_0(v8)) then
                    v5:reportError(l_GraphQLError_0.new(("Variable \"$%s\" cannot be non-input type \"%s\"."):format(v7.variable.name.value, (l_print_0(v7.type))), v7.type));
                end;
            end
        };
    end
};
