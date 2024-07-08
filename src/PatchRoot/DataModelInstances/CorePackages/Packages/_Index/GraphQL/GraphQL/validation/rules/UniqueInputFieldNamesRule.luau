local l_Parent_0 = script.Parent.Parent.Parent;
local l_GraphQLError_0 = require(l_Parent_0.error.GraphQLError).GraphQLError;
local _ = require(l_Parent_0.language.visitor);
local _ = require(script.Parent.Parent.ValidationContext);
local _ = require(l_Parent_0.language.ast);
return {
    UniqueInputFieldNamesRule = function(v5)
        local v6 = {};
        local v7 = {};
        return {
            ObjectValue = {
                enter = function()
                    table.insert(v6, v7);
                    v7 = {};
                end, 
                leave = function()
                    v7 = table.remove(v6);
                end
            }, 
            ObjectField = function(_, v9)
                local l_value_0 = v9.name.value;
                if not v7[l_value_0] then
                    v7[l_value_0] = v9.name;
                    return ;
                else
                    v5:reportError(l_GraphQLError_0.new(("There can be only one input field named \"%s\"."):format(l_value_0), {
                        v7[l_value_0], 
                        v9.name
                    }));
                    return ;
                end;
            end
        };
    end
};
