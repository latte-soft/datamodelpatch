local l_script_FirstAncestor_0 = script:FindFirstAncestor("UserSearch");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Roact);
local v3 = require(l_Parent_0.Dash);
local v4 = require(l_Parent_0.UIBlox);
local v5 = require(l_Parent_0.RoactRodux);
local v6 = require(l_Parent_0.Rodux);
local l_mockLocale_0 = require(l_Parent_0.Dev.SocialTestHelpers).StoryHelpers.mockLocale;
local v8 = require(l_Parent_0.ApolloClient);
local l_mockApolloClient_0 = require(l_Parent_0.GraphQLServer).ApolloClientTestUtils.mockApolloClient;
v4.init((require(l_Parent_0.Dev.RobloxAppUIBloxConfig)));
local l_AppStyleProvider_0 = v4.App.Style.AppStyleProvider;
v2.setGlobalConfig({
    elementTracing = true
});
local v11 = {
    Default = {
        themeName = "Light", 
        fontName = "Gotham"
    }, 
    Light = {
        themeName = "Light", 
        fontName = "Gotham"
    }, 
    Dark = {
        themeName = "Dark", 
        fontName = "Gotham"
    }
};
local v12 = {
    language = "en-us"
};
local function v14(v13)
    return v6.Store.new(function()
        return v13;
    end, {}, {
        v6.thunkMiddleware
    });
end;
return {
    name = "UserSearch", 
    storyRoot = l_script_FirstAncestor_0, 
    roact = v2, 
    mapDefinition = function(v15)
        return v3.join(v15, {
            controls = v3.join(v12, v15.controls or {}), 
            state = v15.state or {}
        });
    end, 
    mapStory = function(v16)
        return function(v17)
            return v2.createElement(l_AppStyleProvider_0, {
                style = not not v17 and v11[v17.theme] or v11.Default
            }, {
                storeProvider = v2.createElement(v5.StoreProvider, {
                    store = v14(v17.definition.state or {})
                }, {
                    apolloClient = v2.createElement(v8.ApolloProvider, {
                        client = l_mockApolloClient_0({})
                    }, {
                        Child = l_mockLocale_0(v16, v17)
                    })
                })
            });
        end;
    end
};
