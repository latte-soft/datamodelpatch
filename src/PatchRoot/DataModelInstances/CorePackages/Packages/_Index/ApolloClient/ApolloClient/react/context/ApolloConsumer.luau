local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Parent.React);
local l_getApolloContext_0 = require(script.Parent.ApolloContext).getApolloContext;
local l_invariant_0 = require(l_Parent_0.jsutils.invariant).invariant;
local _ = require(l_Parent_0.core.ApolloClient);
ApolloConsumer = function(v5)
    return v1.createElement(l_getApolloContext_0().Consumer, nil, function(v6)
        l_invariant_0(v6 and v6.client, "Could not find \"client\" in the context of ApolloConsumer. " .. "Wrap the root component in an <ApolloProvider>.");
        return v5.children(v6.client);
    end);
end;
return {
    ApolloConsumer = ApolloConsumer
};
