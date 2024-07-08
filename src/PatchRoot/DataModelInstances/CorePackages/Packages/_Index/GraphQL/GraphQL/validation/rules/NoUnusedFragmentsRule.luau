local l_GraphQLError_0 = require(script.Parent.Parent.Parent.error.GraphQLError).GraphQLError;
return {
    NoUnusedFragmentsRule = function(v1)
        local v2 = {};
        local v3 = {};
        return {
            OperationDefinition = function(_, v5)
                table.insert(v2, v5);
                return false;
            end, 
            FragmentDefinition = function(_, v7)
                table.insert(v3, v7);
                return false;
            end, 
            Document = {
                leave = function()
                    local v8 = {};
                    for _, v10 in ipairs(v2) do
                        for _, v12 in ipairs(v1:getRecursivelyReferencedFragments(v10)) do
                            v8[v12.name.value] = true;
                        end;
                    end;
                    for _, v14 in ipairs(v3) do
                        local l_value_0 = v14.name.value;
                        if v8[l_value_0] ~= true then
                            v1:reportError(l_GraphQLError_0.new(("Fragment \"%s\" is never used."):format(l_value_0), v14));
                        end;
                    end;
                end
            }
        };
    end
};
