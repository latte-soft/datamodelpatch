local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialTab");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.dependencies);
local l_Roact_0 = v2.Roact;
local l_Rodux_0 = v2.Rodux;
local l_RoactRodux_0 = v2.RoactRodux;
local l_UIBlox_0 = v2.UIBlox;
local v7 = require(l_Parent_0.ApolloClient);
local v8 = require(l_Parent_0.GraphQLServer);
local v9 = require(l_Parent_0.UserProfiles);
local l_mockApolloClient_0 = v8.ApolloClientTestUtils.mockApolloClient;
local l_UnitTestHelpers_0 = require(l_script_FirstAncestor_0.devDependencies).UnitTestHelpers;
local v14 = l_Rodux_0.Store.new(function(v12, _)
    return v12;
end, {
    InvisibleMode = {
        NetworkStatus = {
            byUserId = {}
        }
    }, 
    ScreenSize = Vector2.new(100, 100)
}, {
    l_Rodux_0.thunkMiddleware
});
return function(v15, v16, v17)
    local l_ScreenGui_0 = Instance.new("ScreenGui");
    l_ScreenGui_0.Parent = game:GetService("CoreGui");
    local v19 = l_mockApolloClient_0({});
    v19:writeQuery({
        variables = {
            userIds = {
                "1"
            }
        }, 
        query = v9.Queries.userProfilesCombinedNameAndUsernameByUserIds, 
        data = {
            userProfiles = {
                {
                    __typename = "UserProfile", 
                    id = "1", 
                    names = {
                        __typename = "Names", 
                        combinedName = "Stacey", 
                        username = "This shouldn't show"
                    }
                }
            }
        }
    });
    v19:writeQuery({
        variables = {
            userIds = {
                "test"
            }
        }, 
        query = v9.Queries.userProfilesCombinedNameAndUsernameByUserIds, 
        data = {
            userProfiles = {
                {
                    __typename = "UserProfile", 
                    id = "test", 
                    names = {
                        __typename = "Names", 
                        combinedName = "DisplayName", 
                        username = "Username"
                    }
                }
            }
        }
    });
    local _ = nil;
    local v21 = l_Roact_0.mount(l_UnitTestHelpers_0.mockLocale((l_Roact_0.createFragment({
        apolloProvider = l_Roact_0.createElement(v7.ApolloProvider, {
            client = v19
        }, {
            storeProvider = l_Roact_0.createElement(l_RoactRodux_0.StoreProvider, {
                store = v14
            }, {
                styleProvider = l_Roact_0.createElement(l_UIBlox_0.App.Style.AppStyleProvider, {
                    style = {
                        themeName = "Dark", 
                        fontName = "Gotham"
                    }
                }, {
                    myElement = if v17 then l_Roact_0.createElement("Frame", {
                        Size = v17
                    }, {
                        testElement = l_Roact_0.createElement(v15, v16)
                    }) else l_Roact_0.createElement(v15, v16)
                })
            })
        })
    }))), l_ScreenGui_0);
    return l_ScreenGui_0, function()
        l_Roact_0.unmount(v21);
        l_ScreenGui_0:Destroy();
    end;
end;
