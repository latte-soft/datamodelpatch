local l_Parent_0 = script:FindFirstAncestor("RobloxApolloClient").Parent;
local v1 = require(l_Parent_0.ApolloClient);
local v2 = require(l_Parent_0.ApolloLocalState);
local l_GraphQLServer_0 = require(l_Parent_0.GraphQLServer).GraphQLServer;
local l_ApolloClient_0 = v1.ApolloClient;
local l_HttpLink_0 = v1.HttpLink;
local l_InMemoryCache_0 = v1.InMemoryCache;
local l_typePolicies_0 = v2.typePolicies;
initalizeApolloClient = function(v8)
    local v9 = l_GraphQLServer_0.new(v8);
    return (l_ApolloClient_0.new({
        link = l_HttpLink_0.new({
            uri = "/api", 
            fetch = function(_, v11)
                return v9:fetchLocal(v11);
            end
        }), 
        cache = l_InMemoryCache_0.new({
            typePolicies = l_typePolicies_0
        })
    }));
end;
return initalizeApolloClient;
