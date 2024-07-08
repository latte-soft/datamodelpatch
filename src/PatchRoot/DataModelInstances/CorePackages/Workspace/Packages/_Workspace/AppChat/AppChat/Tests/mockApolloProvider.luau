local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.UserProfiles);
local v3 = require(l_Parent_0.ApolloClient);
local l_mockApolloClient_0 = require(l_Parent_0.GraphQLServer).ApolloClientTestUtils.mockApolloClient;
return function(v5)
    local v6 = l_mockApolloClient_0({});
    v2.TestUtils.writeProfileDataToCache(v6, {
        ["1989"] = {
            combinedName = "Test Primary Name", 
            alias = "Test Primary Name", 
            contactName = "Test Contact Name", 
            displayName = "Test Display Name", 
            username = "username"
        }, 
        ["1969"] = {
            combinedName = "OrangeClement", 
            alias = "OrangeClement", 
            contactName = "Test Contact Name", 
            displayName = "ClementOrange", 
            username = "username"
        }
    });
    return v1.createElement(v3.ApolloProvider, {
        client = v6
    }, {
        AnalyticsElement = v5
    });
end;
