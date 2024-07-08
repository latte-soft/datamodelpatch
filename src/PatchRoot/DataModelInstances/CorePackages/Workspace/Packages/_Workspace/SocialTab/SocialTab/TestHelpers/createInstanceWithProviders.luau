local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialTab");
local v1 = require(l_script_FirstAncestor_0.Analytics);
local v2 = require(l_script_FirstAncestor_0.SocialTabContext);
local v3 = require(l_script_FirstAncestor_0.Flags.getFFlagSocialTabUseUIBloxCarouselForFriends);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v5 = require(l_script_FirstAncestor_0.dependencies);
local l_Roact_0 = v5.Roact;
local l_Rodux_0 = v5.Rodux;
local l_RoactRodux_0 = v5.RoactRodux;
local l_UIBlox_0 = v5.UIBlox;
local l_Mock_0 = v5.Mock;
local v11 = require(l_Parent_0.ApolloClient);
local l_mockApolloClient_0 = require(l_Parent_0.GraphQLServer).ApolloClientTestUtils.mockApolloClient;
local l_UnitTestHelpers_0 = require(l_script_FirstAncestor_0.devDependencies).UnitTestHelpers;
local v16 = l_Rodux_0.Store.new(function(v14, _)
    return v14;
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
return function(v17, v18)
    local l_ScreenGui_0 = Instance.new("ScreenGui");
    l_ScreenGui_0.Parent = game:GetService("CoreGui");
    local v20 = l_Mock_0.MagicMock.new();
    local v21 = l_mockApolloClient_0({});
    v20.wideMode = true;
    v20.isLuaProfilePageEnabled = v3();
    local v22 = l_Roact_0.mount(l_UnitTestHelpers_0.mockLocale((l_Roact_0.createFragment({
        l_Roact_0.createElement(v11.ApolloProvider, {
            client = v21
        }, {
            storeProvider = l_Roact_0.createElement(l_RoactRodux_0.StoreProvider, {
                store = v18.store or v16
            }, {
                styleProvider = l_Roact_0.createElement(l_UIBlox_0.App.Style.AppStyleProvider, {
                    style = {
                        themeName = "Dark", 
                        fontName = "Gotham"
                    }
                }, {
                    policyProvider = l_Roact_0.createElement(v5.UniversalAppPolicy.Provider, {
                        policy = v18.policy or {
                            function()
                                return {
                                    getShowDisplayName = function()
                                        return true;
                                    end, 
                                    getFriendFinder = function()
                                        return true;
                                    end, 
                                    getAccountProviderName = function()
                                        return "";
                                    end, 
                                    shouldInviteFromAccountProvider = function()
                                        return true;
                                    end, 
                                    getShouldShowGroupsTile = function()
                                        return true;
                                    end, 
                                    getChatHeaderNotifications = function()
                                        return true;
                                    end, 
                                    getProfileShareEnabled = function()
                                        return true;
                                    end, 
                                    getContactImporterEnabled = function()
                                        return true;
                                    end, 
                                    getWebViewSupport = function()
                                        return true;
                                    end
                                };
                            end
                        }
                    }, {
                        analyticsProvider = l_Roact_0.createElement(v1.Context.Provider, {
                            value = l_Mock_0.MagicMock.new()
                        }, {
                            socialTabContext = l_Roact_0.createElement(v2.Provider, {
                                value = v20
                            }, {
                                myElement = l_Roact_0.createElement(v17, v18.props)
                            })
                        })
                    })
                })
            })
        })
    }))), l_ScreenGui_0);
    return l_ScreenGui_0, function()
        l_Roact_0.unmount(v22);
        l_ScreenGui_0:Destroy();
    end;
end;
