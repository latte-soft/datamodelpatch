local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsCarousel");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.dependencies);
local v3 = require(l_script_FirstAncestor_0.devDependencies);
local l_Roact_0 = v2.Roact;
local l_RoactRodux_0 = v2.RoactRodux;
local l_Rodux_0 = v2.Rodux;
local l_UIBlox_0 = v2.UIBlox;
local l_LocalizationProvider_0 = v2.LocalizationProvider;
local l_Mock_0 = v3.Mock;
local l_jest_0 = v3.jest;
local l_DesignTokenProvider_0 = v2.Style.DesignTokenProvider;
local v12 = require(l_Parent_0.ApolloClient);
local l_mockApolloClient_0 = require(l_Parent_0.GraphQLServer).ApolloClientTestUtils.mockApolloClient;
local v14 = require(script.Parent.mockAnalytics);
local v15 = require(l_script_FirstAncestor_0.Analytics);
local v16 = l_Mock_0.MagicMock.new({
    name = "Localization"
});
v16.Format = function(_, v18, _)
    return v18;
end;
local v20 = l_Rodux_0.Store.new(function()
    return {};
end, {}, {
    l_Rodux_0.thunkMiddleware
});
return function(v21, v22)
    local v23 = v22.mockAnalytics or v14(l_jest_0);
    return l_Roact_0.createFragment({
        storeProvider = l_Roact_0.createElement(l_RoactRodux_0.StoreProvider, {
            store = v22.store or v20
        }, {
            l_Roact_0.createElement(v15.Context.Provider, {
                value = v23.value
            }, {
                styleProvider = l_Roact_0.createElement(l_UIBlox_0.App.Style.AppStyleProvider, {
                    style = {
                        themeName = "Dark", 
                        fontName = "Gotham"
                    }
                }, {
                    localizationProvider = l_Roact_0.createElement(l_LocalizationProvider_0, {
                        localization = v16
                    }, {
                        apolloClient = l_Roact_0.createElement(v12.ApolloProvider, {
                            client = v22.apolloClient or l_mockApolloClient_0({})
                        }, {
                            designTokenProvider = l_Roact_0.createElement(l_DesignTokenProvider_0, {
                                tokenMappers = {}
                            }, {
                                myElement = l_Roact_0.createElement(v21, v22.props)
                            })
                        })
                    })
                })
            })
        })
    }), v23;
end;
