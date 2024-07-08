local l_Parent_0 = script.Parent.Parent.Parent;
local l_Array_0 = require(l_Parent_0.Parent.LuauPolyfill).Array;
local l_GraphQLError_0 = require(l_Parent_0.error.GraphQLError).GraphQLError;
local l_Kind_0 = require(l_Parent_0.language.kinds).Kind;
return {
    LoneAnonymousOperationRule = function(v4)
        local v5 = 0;
        return {
            Document = function(_, v7)
                v5 = #l_Array_0.filter(v7.definitions, function(v8)
                    return v8.kind == l_Kind_0.OPERATION_DEFINITION;
                end);
            end, 
            OperationDefinition = function(_, v10)
                if not v10.name and v5 > 1 then
                    v4:reportError(l_GraphQLError_0.new("This anonymous operation must be the only defined operation.", v10));
                end;
            end
        };
    end
};
