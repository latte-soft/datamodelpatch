local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = {};
local v3 = require(l_Parent_1.React);
local l_invariant_0 = require(l_Parent_0.jsutils.invariant).invariant;
local l_getApolloContext_0 = require(l_Parent_0.react.context).getApolloContext;
local _ = require(l_Parent_0.core);
useApolloClient = function()
    local l_client_0 = v3.useContext(l_getApolloContext_0()).client;
    l_invariant_0(l_client_0, "No Apollo Client instance can be found. Please ensure that you " .. "have called `ApolloProvider` higher up in your tree.");
    return l_client_0;
end;
v2.useApolloClient = useApolloClient;
return v2;
