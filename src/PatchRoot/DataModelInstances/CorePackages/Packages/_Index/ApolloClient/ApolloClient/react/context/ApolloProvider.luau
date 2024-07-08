local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local _ = require(l_Parent_1.LuauPolyfill);
local v3 = require(l_Parent_1.React);
local l_getApolloContext_0 = require(script.Parent.ApolloContext).getApolloContext;
local l_invariant_0 = require(l_Parent_0.jsutils.invariant).invariant;
local _ = require(l_Parent_0.core.ApolloClient);
ApolloProvider = function(v7)
    local v8 = l_getApolloContext_0();
    return v3.createElement(v8.Consumer, nil, function(v9)
        if v9 == nil then
            v9 = {};
        end;
        if v7.client and v9.client ~= v7.client then
            v9.client = v7.client;
        end;
        l_invariant_0(v9.client, "ApolloProvider was not passed a client instance. Make " .. "sure you pass in your client via the \"client\" prop.");
        return v3.createElement(v8.Provider, {
            value = v9
        }, v7.children);
    end);
end;
return {
    ApolloProvider = ApolloProvider
};
