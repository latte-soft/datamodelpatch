local v0 = {};
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v2 = require(l_Parent_0.LuauPolyfill);
local l_Boolean_0 = v2.Boolean;
local l_Object_0 = v2.Object;
local v5 = require(l_Parent_0.React);
local v6 = require(l_Parent_0.ApolloClient);
local l_ApolloClient_0 = require(l_Parent_0.ApolloClient).ApolloClient;
local l_InMemoryCache_0 = v6.InMemoryCache;
local l_ApolloProvider_0 = v6.ApolloProvider;
local l_MockLink_0 = require(script.Parent.mockLink).MockLink;
local _ = require(l_Parent_0.ApolloClient);
local _ = require(l_Parent_0.ApolloClient);
local v13 = v5.Component:extend("MockedProvider");
v13.defaultProps = {
    addTypename = true
};
v13.init = function(v14, v15)
    v14.props = v15;
    local l_mocks_0 = v15.mocks;
    local l_addTypename_0 = v15.addTypename;
    local l_defaultOptions_0 = v15.defaultOptions;
    local l_cache_0 = v15.cache;
    local l_resolvers_0 = v15.resolvers;
    local l_link_0 = v15.link;
    v14.state = {
        client = l_ApolloClient_0.new({
            cache = not not l_Boolean_0.toJSBoolean(l_cache_0) and l_cache_0 or l_InMemoryCache_0.new({
                addTypename = l_addTypename_0
            }), 
            defaultOptions = l_defaultOptions_0, 
            link = not not l_Boolean_0.toJSBoolean(l_link_0) and l_link_0 or l_MockLink_0.new(l_mocks_0 ~= nil and l_mocks_0 or {}, l_addTypename_0), 
            resolvers = l_resolvers_0
        })
    };
end;
v13.render = function(v22)
    local l_children_0 = v22.props.children;
    local l_childProps_0 = v22.props.childProps;
    if not v5.isValidElement(l_children_0) then
        return nil;
    else
        return v5.createElement(l_ApolloProvider_0, {
            client = v22.state.client
        }, v5.cloneElement(v5.Children.only(l_children_0), l_Object_0.assign({}, l_childProps_0)));
    end;
end;
v13.componentWillUnmount = function(v25)
    v25.state.client:stop();
end;
v0.MockedProvider = v13;
return v0;
