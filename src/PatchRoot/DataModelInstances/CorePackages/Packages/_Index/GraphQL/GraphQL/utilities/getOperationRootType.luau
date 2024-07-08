local l_GraphQLError_0 = require(script.Parent.Parent.error.GraphQLError).GraphQLError;
local _ = require(script.Parent.Parent.language.ast);
local _ = require(script.Parent.Parent.type.definition);
local _ = require(script.Parent.Parent.type.schema);
return {
    getOperationRootType = function(v4, v5)
        if v5.operation == "query" then
            local v6 = v4:getQueryType();
            if not v6 then
                error(l_GraphQLError_0.new("Schema does not define the required query root type.", v5));
            end;
            return v6;
        elseif v5.operation == "mutation" then
            local v7 = v4:getMutationType();
            if not v7 then
                error(l_GraphQLError_0.new("Schema is not configured for mutations.", v5));
            end;
            return v7;
        elseif v5.operation == "subscription" then
            local v8 = v4:getSubscriptionType();
            if not v8 then
                error(l_GraphQLError_0.new("Schema is not configured for subscriptions.", v5));
            end;
            return v8;
        else
            error(l_GraphQLError_0.new("Can only have query, mutation and subscription operations.", v5));
            return ;
        end;
    end
};
