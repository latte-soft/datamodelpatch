local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Roact);
local v2 = require(l_CorePackages_0.Rodux);
local v3 = require(l_CorePackages_0.RoactRodux);
local v4 = require(l_CorePackages_0.UIBlox);
local l_Parent_0 = script.Parent;
local v6 = require(l_Parent_0.Reducers.Reducer);
local l_Provider_0 = require(script.Parent.Components.Connection.LayoutValues).Provider;
local l_ApolloProvider_0 = require(l_CorePackages_0.Packages.ApolloClient).ApolloProvider;
local l_mockApolloClient_0 = require(l_CorePackages_0.Workspace.Packages.GraphQLServer).ApolloClientTestUtils.mockApolloClient;
local l_Array_0 = require(l_CorePackages_0.Packages.LuauPolyfill).Array;
local v11 = require(l_Parent_0.CreateLayoutValues);
return function(v12)
    return v1.createElement(v3.StoreProvider, {
        store = v12.store or v2.Store.new(v6)
    }, {
        ApolloProvider = v1.createElement(l_ApolloProvider_0, {
            client = v12.client or l_mockApolloClient_0({
                mockResolvers = {
                    Query = {
                        userProfiles = function(_, v14, _, _)
                            return (l_Array_0.map(v14.userIds, function(v17)
                                return {
                                    userId = v17, 
                                    names = {
                                        alias = ("alias%*"):format(v17), 
                                        combinedName = ("combinedName%*"):format(v17), 
                                        contactName = ("contactName%*"):format(v17), 
                                        displayName = ("displayName%*"):format(v17), 
                                        username = ("username%*"):format(v17), 
                                        platformName = ("platformName%*"):format(v17)
                                    }
                                };
                            end));
                        end
                    }, 
                    UserProfile = {
                        id = function(v18)
                            return (tostring(v18.userId));
                        end, 
                        names = function(v19)
                            return v19.names;
                        end
                    }
                }
            })
        }, {
            LayoutValuesProvider = v1.createElement(l_Provider_0, {
                layoutValues = v12.layoutValues or v11(false)
            }, {
                ThemeProvider = v1.createElement(v4.Style.Provider, {}, v12.children)
            })
        })
    });
end;
