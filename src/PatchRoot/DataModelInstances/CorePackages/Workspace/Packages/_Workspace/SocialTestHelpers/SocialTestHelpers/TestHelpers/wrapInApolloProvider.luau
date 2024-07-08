local l_Parent_0 = script:FindFirstAncestor("SocialTestHelpers").Parent;
local v1 = require(l_Parent_0.React);
local l_ApolloProvider_0 = require(l_Parent_0.ApolloClient).ApolloProvider;
local l_mockApolloClient_0 = require(l_Parent_0.GraphQLServer).ApolloClientTestUtils.mockApolloClient;
return function(v4, v5)
    return v1.createElement(l_ApolloProvider_0, {
        client = v5 or l_mockApolloClient_0({})
    }, v4);
end;
