local l_GraphQLError_0 = require(script.Parent.GraphQLError).GraphQLError;
return {
    syntaxError = function(v1, v2, v3)
        return l_GraphQLError_0.new("Syntax Error: " .. v3, nil, v1, {
            v2
        });
    end
};
