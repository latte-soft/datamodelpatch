local l_Parent_0 = script.Parent.Parent.Parent;
local l_GraphQLError_0 = require(l_Parent_0.error.GraphQLError).GraphQLError;
local v2 = require(l_Parent_0.luaUtils.isNillish);
local l_isNillish_0 = v2.isNillish;
local l_isNotNillish_0 = v2.isNotNillish;
return {
    LoneSchemaDefinitionRule = function(v5)
        local v6 = v5:getSchema();
        local v7 = nil;
        if v6 then
            v7 = v6.astNode;
            if l_isNillish_0(v7) then
                v7 = v6:getQueryType();
            end;
            if l_isNillish_0(v7) then
                v7 = v6:getMutationType();
            end;
            if l_isNillish_0(v7) then
                v7 = v6:getSubscriptionType();
            end;
        end;
        local v8 = 0;
        return {
            SchemaDefinition = function(_, v10)
                if not l_isNotNillish_0(v7) then
                    if v8 > 0 then
                        v5:reportError(l_GraphQLError_0.new("Must provide only one schema definition.", v10));
                    end;
                    v8 = v8 + 1;
                    return ;
                else
                    v5:reportError(l_GraphQLError_0.new("Cannot define a new schema within a schema extension.", v10));
                    return ;
                end;
            end
        };
    end
};
