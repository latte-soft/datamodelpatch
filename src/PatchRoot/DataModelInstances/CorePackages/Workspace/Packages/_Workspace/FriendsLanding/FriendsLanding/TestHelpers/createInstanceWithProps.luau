local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.dependencies);
local l_UIBlox_0 = v2.UIBlox;
local l_Roact_0 = v2.Roact;
local l_Rodux_0 = v2.Rodux;
local l_RoactRodux_0 = v2.RoactRodux;
local v7 = require(l_script_FirstAncestor_0.installReducer);
local v8 = require(l_Parent_0.ApolloClient);
local l_mockApolloClient_0 = require(l_Parent_0.GraphQLServer).ApolloClientTestUtils.mockApolloClient;
return function(v10)
    return function(v11, v12, v13)
        local l_ScreenGui_0 = Instance.new("ScreenGui");
        l_ScreenGui_0.Parent = game:GetService("CoreGui");
        local _ = nil;
        local v17 = l_Roact_0.mount(v10((l_Roact_0.createFragment({
            styleProvider = l_Roact_0.createElement(l_UIBlox_0.App.Style.AppStyleProvider, {
                style = {
                    themeName = "Dark", 
                    fontName = "Gotham"
                }
            }, {
                apolloClient = l_Roact_0.createElement(v8.ApolloProvider, {
                    client = l_mockApolloClient_0({})
                }, {
                    StoreProvider = l_Roact_0.createElement(l_RoactRodux_0.StoreProvider, {
                        store = l_Rodux_0.Store.new(l_Rodux_0.combineReducers({
                            FriendsLanding = v7(), 
                            LocalUserId = function(v16)
                                return v16;
                            end
                        }), {}, {
                            l_Rodux_0.thunkMiddleware
                        })
                    }, {
                        myElement = if v13 then l_Roact_0.createElement("Frame", {
                            Size = v13
                        }, {
                            testElement = l_Roact_0.createElement(v11, v12)
                        }) else l_Roact_0.createElement(v11, v12)
                    })
                })
            })
        }))), l_ScreenGui_0);
        return l_ScreenGui_0, function()
            l_Roact_0.unmount(v17);
            l_ScreenGui_0:Destroy();
        end;
    end;
end;
