local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsCarousel");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.UIBlox);
v2.init((require(l_Parent_0.Dev.RobloxAppUIBloxConfig)));
local l_llama_0 = require(l_Parent_0.LuaSocialLibrariesDeps).llama;
local v4 = require(l_Parent_0.Roact);
local l_mockLocale_0 = require(l_Parent_0.Dev.SocialTestHelpers).StoryHelpers.mockLocale;
local v6 = require(l_script_FirstAncestor_0.TestHelpers.mockAnalytics);
local v7 = require(l_script_FirstAncestor_0.Analytics);
local l_AppStyleProvider_0 = v2.App.Style.AppStyleProvider;
local v9 = require(l_Parent_0.RoactRodux);
local v10 = require(l_Parent_0.Rodux);
local l_DesignTokenProvider_0 = require(l_Parent_0.Style).DesignTokenProvider;
local v12 = require(l_Parent_0.ApolloClient);
local l_mockApolloClient_0 = require(l_Parent_0.GraphQLServer).ApolloClientTestUtils.mockApolloClient;
v4.setGlobalConfig({
    elementTracing = true
});
local v14 = {
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
local v15 = {
    language = "en-us"
};
local v16 = v6({}, {
    fn = function()
    end
});
local v18 = v10.Store.new(function(v17)
    return v17;
end, {}, {});
return {
    name = "FriendsCarousel", 
    storyRoot = l_script_FirstAncestor_0, 
    roact = v4, 
    mapDefinition = function(v19)
        return l_llama_0.Dictionary.join(v19, {
            controls = l_llama_0.Dictionary.join(v15, v19.controls or {})
        });
    end, 
    mapStory = function(v20)
        return function(v21)
            return v4.createElement(l_AppStyleProvider_0, {
                style = not not v21 and v14[v21.theme] or v14.Default
            }, {
                v4.createElement(v7.Context.Provider, {
                    value = v16.value
                }, {
                    apolloClient = v4.createElement(v12.ApolloProvider, {
                        client = l_mockApolloClient_0({})
                    }, {
                        storeProvider = v4.createElement(v9.StoreProvider, {
                            store = v18
                        }, {
                            designTokenProvider = v4.createElement(l_DesignTokenProvider_0, {
                                tokenMappers = {}
                            }, {
                                Child = l_mockLocale_0(v20, v21)
                            })
                        })
                    })
                })
            });
        end;
    end
};
