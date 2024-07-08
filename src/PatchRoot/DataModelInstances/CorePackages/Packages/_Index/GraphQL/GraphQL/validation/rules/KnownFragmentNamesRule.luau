local l_GraphQLError_0 = require(script.Parent.Parent.Parent.error.GraphQLError).GraphQLError;
return {
    KnownFragmentNamesRule = function(v1)
        return {
            FragmentSpread = function(_, v3)
                local l_value_0 = v3.name.value;
                if not v1:getFragment(l_value_0) then
                    v1:reportError(l_GraphQLError_0.new(("Unknown fragment \"%s\"."):format(l_value_0), v3.name));
                end;
            end
        };
    end
};
