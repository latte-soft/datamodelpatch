local l_Parent_0 = script.Parent.Parent.Parent;
local l_Array_0 = require(l_Parent_0.Parent.LuauPolyfill).Array;
local l_GraphQLError_0 = require(l_Parent_0.error.GraphQLError).GraphQLError;
return {
    SingleFieldSubscriptionsRule = function(v3)
        return {
            OperationDefinition = function(_, v5)
                if v5.operation == "subscription" and #v5.selectionSet.selections ~= 1 then
                    v3:reportError(l_GraphQLError_0.new(not not v5.name and ("Subscription \"%s\" must select only one top level field."):format(v5.name.value) or "Anonymous Subscription must select only one top level field.", l_Array_0.slice(v5.selectionSet.selections, 2)));
                end;
            end
        };
    end
};
