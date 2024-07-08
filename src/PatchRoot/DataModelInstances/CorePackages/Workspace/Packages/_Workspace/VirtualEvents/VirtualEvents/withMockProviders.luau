local l_script_FirstAncestor_0 = script:FindFirstAncestor("VirtualEvents");
local v1 = require(l_script_FirstAncestor_0.Parent.ApolloClient);
local v2 = require(l_script_FirstAncestor_0.Parent.GraphQLServer);
local v3 = require(l_script_FirstAncestor_0.Parent.React);
local v4 = require(l_script_FirstAncestor_0.Parent.Rodux);
local v5 = require(l_script_FirstAncestor_0.Parent.RoactNavigation);
local v6 = require(l_script_FirstAncestor_0.Parent.RoactRodux);
local v7 = require(l_script_FirstAncestor_0.Parent.RobloxAppLocales);
local v8 = require(l_script_FirstAncestor_0.Parent.Localization);
local v9 = require(l_script_FirstAncestor_0.Parent.UIBlox);
local v10 = require(l_script_FirstAncestor_0.installReducer);
local l_MockContentProvider_0 = v9.UnitTestHelpers.MockContentProvider;
local l_AppStyleProvider_0 = v9.App.Style.AppStyleProvider;
local l_Constants_0 = v9.App.Style.Constants;
local l_ContentProvider_0 = v9.App.Context.ContentProvider;
local v15 = v4.combineReducers({
    VirtualEvents = v10()
});
return function(v16, v17)
    local v18 = {
        StoreProvider = v3.createElement(v6.StoreProvider, {
            store = if not v17 then nil else v17.store or v4.Store.new(v15, if not v17 then nil else v17.initialStoreState, {
                v4.thunkMiddleware
            })
        }, {
            ContentProvider = v3.createElement(l_ContentProvider_0.Provider, {
                value = l_MockContentProvider_0.new()
            }, {
                LocalizationProvider = v3.createElement(v8.LocalizationProvider, {
                    localization = v7.Localization.new("en-us")
                }, {
                    StyleProvider = v3.createElement(l_AppStyleProvider_0, {
                        style = {
                            themeName = l_Constants_0.ThemeName.Dark, 
                            fontName = l_Constants_0.FontName.Gotham
                        }
                    }, {
                        Children = v3.createElement(v3.Fragment, nil, v16)
                    })
                })
            })
        })
    };
    if v17 then
        if v17.mockResolvers then
            local v19 = v2.GraphQLServer.new({
                mockResolvers = v17.mockResolvers
            });
            v18 = {
                ApolloProvider = v3.createElement(v1.ApolloProvider, {
                    client = v1.ApolloClient.new({
                        cache = v1.InMemoryCache.new({}), 
                        link = v1.HttpLink.new({
                            uri = "/api", 
                            fetch = function(_, v21)
                                return v19:fetchLocal(v21);
                            end
                        })
                    })
                }, v18)
            };
        end;
        if v17.mockNavigation then
            v18 = {
                NavigationProvider = v3.createElement(v5.Provider, {
                    value = v17.mockNavigation
                }, v18)
            };
        end;
    end;
    return v3.createElement(v3.Fragment, nil, v18);
end;
