local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialTestHelpers");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.dependencies);
local l_Roact_0 = v2.Roact;
local l_RoactNavigation_0 = v2.RoactNavigation;
local l_RoactRodux_0 = v2.RoactRodux;
local l_Rodux_0 = v2.Rodux;
local l_UIBlox_0 = v2.UIBlox;
local l_LocalizationProvider_0 = v2.LocalizationProvider;
local l_Mock_0 = v2.Mock;
local l_mockNavigation_0 = v2.UnitTestHelpers.mockNavigation;
local l_ApolloProvider_0 = v2.ApolloClient.ApolloProvider;
local l_mockApolloClient_0 = v2.GraphQLServer.ApolloClientTestUtils.mockApolloClient;
local l_DesignTokenProvider_0 = require(l_Parent_0.Style).DesignTokenProvider;
local v14 = l_Mock_0.MagicMock.new({
    name = "Localization"
});
v14.Format = function(_, v16, _)
    return v16;
end;
local function v19(v18)
    return l_Rodux_0.Store.new(function()
        return v18;
    end, {}, {
        l_Rodux_0.thunkMiddleware
    });
end;
local v20 = l_Rodux_0.Store.new(function()
    return {};
end, {}, {
    l_Rodux_0.thunkMiddleware
});
return function(v21, v22)
    local v23 = l_Roact_0.createFragment({
        storeProvider = l_Roact_0.createElement(l_RoactRodux_0.StoreProvider, {
            store = if not v22.state then v22.store or v20 else v19(v22.state)
        }, {
            styleProvider = l_Roact_0.createElement(l_UIBlox_0.App.Style.AppStyleProvider, {
                style = {
                    themeName = "Dark", 
                    fontName = "Gotham"
                }
            }, {
                localizationProvider = l_Roact_0.createElement(l_LocalizationProvider_0, {
                    localization = v14
                }, {
                    apolloClient = l_Roact_0.createElement(l_ApolloProvider_0, {
                        client = v22.apolloClient or l_mockApolloClient_0({})
                    }, {
                        designTokenProvider = l_Roact_0.createElement(l_DesignTokenProvider_0, {
                            tokenMappers = {}
                        }, {
                            myElement = if not v22.navigation then l_mockNavigation_0(l_Roact_0.createElement(v21, v22.props)) else l_Roact_0.createElement(l_RoactNavigation_0.Provider, {
                                value = v22.navigation
                            }, l_Roact_0.createElement(v21, v22.props))
                        })
                    })
                })
            })
        })
    });
    if v22.mockProvider then
        v23 = v22.mockProvider(v23);
    end;
    return v23;
end;
